# Recommendation Ad System

Sistema de recomendação de anúncios de produtos, desenvolvido em **Node.js** com integração ao **Neo4j** (banco de dados orientado a grafos).

## 🚀 Funcionalidades

- Seleção de usuário para simular contexto de recomendação
- Anúncio personalizado para cada usuário, baseado em produtos comprados por usuários semelhantes
- Layout moderno e responsivo (CSS customizado)
- Pronto para expansão com avaliações, visualizações e novas lógicas de recomendação

## 🛠️ Tecnologias

- [Node.js](https://nodejs.org/)
- [Express](https://expressjs.com/)
- [Neo4j](https://neo4j.com/) + [neo4j-driver](https://www.npmjs.com/package/neo4j-driver)
- HTML + CSS

## 💾 Como rodar localmente

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/weinStag/recommendation-ad-system.git
   cd recommendation-ad-system
   ```

2. **Instale as dependências:**
   ```sh
   npm install
   ```

3. **Suba o Neo4j (exemplo usando Docker):**
   ```sh
   docker run -d --name neo4j \
     -p7474:7474 -p7687:7687 \
     -e NEO4J_AUTH=neo4j/senha_segura \
     neo4j:5
   ```

4. **Popule o banco com exemplos:**
   - Acesse o Neo4j Browser em [http://localhost:7474](http://localhost:7474)
   - Faça login (usuário: `neo4j`, senha: `senha_segura`)
   - Cole e execute o conteúdo do arquivo [`neo4j_sample.cypher`](neo4j_sample.cypher)

5. **Inicie o app:**
   ```sh
   npm start
   ```
   Acesse [http://localhost:3000](http://localhost:3000) no navegador.

## 📦 Estrutura

```
├── app.js                # Backend Express + integração Neo4j
├── public/
│   └── ad.css            # Estilos do anúncio
├── neo4j_sample.cypher   # Script para popular o banco
├── package.json
├── .gitignore
└── README.md
```

## ✨ Exemplo de uso

1. Selecione um usuário na tela inicial.
2. Veja um anúncio recomendado com base em compras de usuários semelhantes.
3. O sistema pode ser expandido para recomendações por categoria, avaliações, produtos populares, etc.

## 📋 Observações

- O sistema está pronto para receber novas lógicas de recomendação.
- Para ambiente de produção, configure variáveis de ambiente e proteja credenciais.

---

Feito com 💡 por