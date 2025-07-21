const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Servir arquivos estáticos (CSS)
app.use(express.static(path.join(__dirname, 'public')));

// Integração real com Neo4j
const neo4j = require('neo4j-driver');
const NEO4J_URI = 'bolt://localhost:7687';
const NEO4J_USER = 'neo4j';
const NEO4J_PASSWORD = 'senha_segura';
const driver = neo4j.driver(
  NEO4J_URI,
  neo4j.auth.basic(NEO4J_USER, NEO4J_PASSWORD)
);


// Página principal: seleção de usuário
app.get('/', async (req, res) => {
  const session = driver.session();
  try {
    const result = await session.run('MATCH (u:Usuario) RETURN u.nome AS nome ORDER BY nome');
    const users = result.records.map(r => r.get('nome'));
    res.send(`
      <!DOCTYPE html>
      <html lang="pt-br">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Selecione o Usuário</title>
        <link rel="stylesheet" href="/ad.css">
        <style>
          .user-select-container { max-width: 400px; margin: 40px auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 32px 28px; text-align: center; }
          select, button { font-size: 1.1rem; padding: 8px 12px; margin-top: 12px; border-radius: 6px; border: 1px solid #ccc; }
          button { background: #3182ce; color: #fff; border: none; cursor: pointer; margin-left: 8px; }
          button:hover { background: #225ea8; }
        </style>
      </head>
      <body>
        <div class="user-select-container">
          <h2>Selecione o usuário</h2>
          <form action="/ad" method="get">
            <select name="usuario" required>
              <option value="">-- Escolha --</option>
              ${users.map(u => `<option value="${u}">${u}</option>`).join('')}
            </select>
            <button type="submit">Ver anúncio</button>
          </form>
        </div>
      </body>
      </html>
    `);
  } catch (err) {
    console.error('Erro ao buscar usuários:', err);
    res.status(500).send('Erro ao buscar usuários no banco de dados.');
  } finally {
    await session.close();
  }
});

// Rota para exibir anúncio de produto comprado pelo usuário selecionado
app.get('/ad', async (req, res) => {
  const usuario = req.query.usuario;
  if (!usuario) {
    return res.redirect('/');
  }
  const session = driver.session();
  try {
    const result = await session.run(
      `
      MATCH (u:Usuario {nome: $usuario})-[:COMPROU]->(prod:Produto)
      WITH u, collect(prod) AS produtos_usuario
      MATCH (outro:Usuario)-[:COMPROU]->(prod)
      WHERE outro <> u
      WITH u, produtos_usuario, outro
      MATCH (outro)-[:COMPROU]->(recomendado:Produto)-[:PERTENCE_A]->(c:Categoria)
      WHERE NOT recomendado IN produtos_usuario
      RETURN recomendado.nome AS nome, recomendado.preco AS preco, c.nome AS categoria, COUNT(*) AS score
      ORDER BY score DESC
      LIMIT 1
      `,
      { usuario }
    );
    if (result.records.length === 0) {
      return res.send(`<p>Não há recomendações para <b>${usuario}</b> no momento.</p><p><a href="/">Voltar</a></p>`);
    }
    const record = result.records[0];
    const product = {
      name: record.get('nome'),
      price: record.get('preco'),
      description: `Categoria: ${record.get('categoria')}`
    };
    res.send(`
      <!DOCTYPE html>
      <html lang="pt-br">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Anúncio de Produto</title>
        <link rel="stylesheet" href="/ad.css">
      </head>
      <body>
        <div class="ad-container">
          <div class="ad-title">${product.name}</div>
          <div class="ad-price">R$ ${Number(product.price).toFixed(2)}</div>
          <div class="ad-description">${product.description}</div>
          <div style="margin-top:24px"><a href="/">Trocar usuário</a></div>
        </div>
      </body>
      </html>
    `);
  } catch (err) {
    console.error('Erro ao buscar recomendação no Neo4j:', err);
    res.status(500).send('Erro ao buscar recomendação no banco de dados.');
  } finally {
    await session.close();
  }
});

// Rota principal
app.get('/', (req, res) => {
  res.redirect('/ad');
});

// Preparação para futura integração com Neo4j
// const neo4j = require('neo4j-driver');
// const driver = neo4j.driver('bolt://localhost:7687', neo4j.auth.basic('user', 'password'));

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
