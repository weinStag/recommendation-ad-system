CREATE (u1:Usuario {nome: 'Alice'})
CREATE (u2:Usuario {nome: 'Bob'})
CREATE (c1:Categoria {nome: 'Eletrônicos'})
CREATE (c2:Categoria {nome: 'Livros'})
CREATE (p1:Produto {nome: 'Smartphone', preco: 2000})
CREATE (p2:Produto {nome: 'Notebook', preco: 3500})
CREATE (p3:Produto {nome: 'Livro de Python', preco: 120})

MATCH (p:Produto {nome: 'Smartphone'}), (c:Categoria {nome: 'Eletrônicos'})
CREATE (p)-[:PERTENCE_A]->(c);

MATCH (p:Produto {nome: 'Notebook'}), (c:Categoria {nome: 'Eletrônicos'})
CREATE (p)-[:PERTENCE_A]->(c);

MATCH (p:Produto {nome: 'Livro de Python'}), (c:Categoria {nome: 'Livros'})
CREATE (p)-[:PERTENCE_A]->(c);

MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Smartphone'})
CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Livro de Python'})
CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Notebook'})
CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'Alice'})-[:COMPROU]->(p1)-[:PERTENCE_A]->(c)<-[:PERTENCE_A]-(p2:Produto)
WHERE NOT (u)-[:COMPROU]->(p2)
RETURN p2.nome AS ProdutoRecomendado, c.nome AS Categoria

// Novas categorias
CREATE (c3:Categoria {nome: 'Games'});
CREATE (c4:Categoria {nome: 'Casa'});
CREATE (c5:Categoria {nome: 'Moda'});

// Novos produtos
CREATE (p4:Produto {nome: 'PlayStation 5', preco: 4500});
CREATE (p5:Produto {nome: 'Xbox Series X', preco: 4200});
CREATE (p6:Produto {nome: 'Cafeteira', preco: 300});
CREATE (p7:Produto {nome: 'Sofá', preco: 2000});
CREATE (p8:Produto {nome: 'Camiseta', preco: 50});
CREATE (p9:Produto {nome: 'Tênis', preco: 250});
CREATE (p10:Produto {nome: 'Livro de JavaScript', preco: 130});
CREATE (p11:Produto {nome: 'Fone de Ouvido', preco: 400});
CREATE (p12:Produto {nome: 'Smart TV', preco: 3200});
CREATE (p13:Produto {nome: 'Micro-ondas', preco: 600});
CREATE (p14:Produto {nome: 'Calça Jeans', preco: 120});
CREATE (p15:Produto {nome: 'Controle Xbox', preco: 300});

// Relacionar produtos às categorias
MATCH (p:Produto {nome: 'PlayStation 5'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Xbox Series X'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Cafeteira'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Sofá'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Camiseta'}), (c:Categoria {nome: 'Moda'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Tênis'}), (c:Categoria {nome: 'Moda'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Livro de JavaScript'}), (c:Categoria {nome: 'Livros'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Fone de Ouvido'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Smart TV'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Micro-ondas'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Calça Jeans'}), (c:Categoria {nome: 'Moda'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Controle Xbox'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);

// Novos usuários
CREATE (u3:Usuario {nome: 'Carol'});
CREATE (u4:Usuario {nome: 'Daniel'});
CREATE (u5:Usuario {nome: 'Eva'});

// Compras dos usuários
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'PlayStation 5'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Fone de Ouvido'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Cafeteira'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Livro de JavaScript'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Tênis'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Smart TV'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Camiseta'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Calça Jeans'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Micro-ondas'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Controle Xbox'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Xbox Series X'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Sofá'}) CREATE (u)-[:COMPROU]->(p);

// Novas categorias
CREATE (c6:Categoria {nome: 'Esportes'});
CREATE (c7:Categoria {nome: 'Beleza'});
CREATE (c8:Categoria {nome: 'Brinquedos'});

// Novos produtos
CREATE (p16:Produto {nome: 'Bicicleta', preco: 900});
CREATE (p17:Produto {nome: 'Bola de Futebol', preco: 80});
CREATE (p18:Produto {nome: 'Shampoo', preco: 25});
CREATE (p19:Produto {nome: 'Boneca', preco: 60});
CREATE (p20:Produto {nome: 'Lego Star Wars', preco: 350});
CREATE (p21:Produto {nome: 'Perfume', preco: 200});
CREATE (p22:Produto {nome: 'Raquete de Tênis', preco: 400});
CREATE (p23:Produto {nome: 'Carrinho de Controle Remoto', preco: 150});

// Relacionar produtos às novas categorias
MATCH (p:Produto {nome: 'Bicicleta'}), (c:Categoria {nome: 'Esportes'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Bola de Futebol'}), (c:Categoria {nome: 'Esportes'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Shampoo'}), (c:Categoria {nome: 'Beleza'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Boneca'}), (c:Categoria {nome: 'Brinquedos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Lego Star Wars'}), (c:Categoria {nome: 'Brinquedos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Perfume'}), (c:Categoria {nome: 'Beleza'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Raquete de Tênis'}), (c:Categoria {nome: 'Esportes'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Carrinho de Controle Remoto'}), (c:Categoria {nome: 'Brinquedos'}) CREATE (p)-[:PERTENCE_A]->(c);

// Novos usuários
CREATE (u6:Usuario {nome: 'Felipe'});
CREATE (u7:Usuario {nome: 'Gabriela'});
CREATE (u8:Usuario {nome: 'Henrique'});

// Compras dos novos usuários
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Bicicleta'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Shampoo'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Boneca'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Perfume'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Bola de Futebol'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Raquete de Tênis'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Lego Star Wars'}) CREATE (u)-[:COMPROU]->(p);

// Exemplo de avaliações (relacionamento com nota)
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Smartphone'}) CREATE (u)-[:AVALIOU {nota: 5, comentario: 'Excelente!'}]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'PlayStation 5'}) CREATE (u)-[:AVALIOU {nota: 4, comentario: 'Muito bom'}]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Livro de JavaScript'}) CREATE (u)-[:AVALIOU {nota: 5, comentario: 'Didático'}]->(p);
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Shampoo'}) CREATE (u)-[:AVALIOU {nota: 3, comentario: 'Bom'}]->(p);

// Exemplo de visualizações (usuário visualizou produto)
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Lego Star Wars'}) CREATE (u)-[:VISUALIZOU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Carrinho de Controle Remoto'}) CREATE (u)-[:VISUALIZOU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Camiseta'}) CREATE (u)-[:VISUALIZOU]->(p);

// Compras cruzadas para diversificar recomendações
// ------------------------------------------------------------------------------------------------

// Alice compra Fone de Ouvido e Smart TV
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Fone de Ouvido'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Smart TV'}) CREATE (u)-[:COMPROU]->(p);

// Bob compra Livro de Python e Micro-ondas
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Livro de Python'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Micro-ondas'}) CREATE (u)-[:COMPROU]->(p);

// Carol compra PlayStation 5 e Camiseta
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'PlayStation 5'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Camiseta'}) CREATE (u)-[:COMPROU]->(p);

// Daniel compra Fone de Ouvido e Livro de JavaScript
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Fone de Ouvido'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Livro de JavaScript'}) CREATE (u)-[:COMPROU]->(p);

// Eva compra Bicicleta e Perfume
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Bicicleta'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Perfume'}) CREATE (u)-[:COMPROU]->(p);

// Felipe compra Sofá e Boneca
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Sofá'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Boneca'}) CREATE (u)-[:COMPROU]->(p);

// Gabriela compra Cafeteira e Bola de Futebol
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Cafeteira'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Bola de Futebol'}) CREATE (u)-[:COMPROU]->(p);

// Henrique compra Controle Xbox e Micro-ondas
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Controle Xbox'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Micro-ondas'}) CREATE (u)-[:COMPROU]->(p);

// ------------------------------------------------------------------------------------------------

// Diversificação de compras para Eva, Felipe, Henrique e Gabriela

// Eva compra Raquete de Tênis e Boneca
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Raquete de Tênis'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Boneca'}) CREATE (u)-[:COMPROU]->(p);

// Felipe compra Bola de Futebol e Perfume
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Bola de Futebol'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Perfume'}) CREATE (u)-[:COMPROU]->(p);

// Henrique compra Cafeteira e Camiseta
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Cafeteira'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Camiseta'}) CREATE (u)-[:COMPROU]->(p);

// Gabriela compra Tênis e Lego Star Wars
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Tênis'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Lego Star Wars'}) CREATE (u)-[:COMPROU]->(p);

// Novos usuários
CREATE (u9:Usuario {nome: 'Isabela'});
CREATE (u10:Usuario {nome: 'João'});
CREATE (u11:Usuario {nome: 'Larissa'});
CREATE (u12:Usuario {nome: 'Marcos'});

// Compras variadas para novos usuários
MATCH (u:Usuario {nome: 'Isabela'}), (p:Produto {nome: 'Smart TV'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Isabela'}), (p:Produto {nome: 'Notebook'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Isabela'}), (p:Produto {nome: 'Perfume'}) CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'João'}), (p:Produto {nome: 'Smartphone'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'João'}), (p:Produto {nome: 'Fone de Ouvido'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'João'}), (p:Produto {nome: 'Bicicleta'}) CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'Larissa'}), (p:Produto {nome: 'PlayStation 5'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Larissa'}), (p:Produto {nome: 'Livro de JavaScript'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Larissa'}), (p:Produto {nome: 'Cafeteira'}) CREATE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {nome: 'Marcos'}), (p:Produto {nome: 'Xbox Series X'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Marcos'}), (p:Produto {nome: 'Micro-ondas'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Marcos'}), (p:Produto {nome: 'Tênis'}) CREATE (u)-[:COMPROU]->(p);

// Mais compras cruzadas entre usuários antigos e eletrônicos
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Smart TV'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Fone de Ouvido'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Notebook'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'PlayStation 5'}) CREATE (u)-[:COMPROU]->(p);

// Usuários antigos comprando produtos de outras categorias
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Bicicleta'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Livro de JavaScript'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Micro-ondas'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Cafeteira'}) CREATE (u)-[:COMPROU]->(p);

// Produtos únicos para alguns usuários
MATCH (u:Usuario {nome: 'Isabela'}), (p:Produto {nome: 'Carrinho de Controle Remoto'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'João'}), (p:Produto {nome: 'Shampoo'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Larissa'}), (p:Produto {nome: 'Calça Jeans'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Marcos'}), (p:Produto {nome: 'Boneca'}) CREATE (u)-[:COMPROU]->(p);

// ------------------------------------------------------------------------------------------------

// Novos produtos
CREATE (p24:Produto {nome: 'Tablet', preco: 1500});
CREATE (p25:Produto {nome: 'Echo Dot', preco: 350});
CREATE (p26:Produto {nome: 'Aspirador Robô', preco: 900});
CREATE (p27:Produto {nome: 'Kindle', preco: 500});
CREATE (p28:Produto {nome: 'Air Fryer', preco: 600});
CREATE (p29:Produto {nome: 'Relógio Smart', preco: 800});
CREATE (p30:Produto {nome: 'Mochila', preco: 120});
CREATE (p31:Produto {nome: 'Cadeira Gamer', preco: 1100});
CREATE (p32:Produto {nome: 'Blusa de Frio', preco: 180});
CREATE (p33:Produto {nome: 'Patins', preco: 350});
CREATE (p34:Produto {nome: 'Secador de Cabelo', preco: 200});
CREATE (p35:Produto {nome: 'Câmera Digital', preco: 2200});
CREATE (p36:Produto {nome: 'Monitor 27"', preco: 1400});
CREATE (p37:Produto {nome: 'Teclado Mecânico', preco: 400});
CREATE (p38:Produto {nome: 'Mouse Gamer', preco: 250});
CREATE (p39:Produto {nome: 'Batedeira', preco: 300});
CREATE (p40:Produto {nome: 'Chaleira Elétrica', preco: 150});

// Relacionar produtos às categorias
MATCH (p:Produto {nome: 'Tablet'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Echo Dot'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Aspirador Robô'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Kindle'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Air Fryer'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Relógio Smart'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Mochila'}), (c:Categoria {nome: 'Moda'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Cadeira Gamer'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Blusa de Frio'}), (c:Categoria {nome: 'Moda'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Patins'}), (c:Categoria {nome: 'Esportes'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Secador de Cabelo'}), (c:Categoria {nome: 'Beleza'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Câmera Digital'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Monitor 27"'}), (c:Categoria {nome: 'Eletrônicos'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Teclado Mecânico'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Mouse Gamer'}), (c:Categoria {nome: 'Games'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Batedeira'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);
MATCH (p:Produto {nome: 'Chaleira Elétrica'}), (c:Categoria {nome: 'Casa'}) CREATE (p)-[:PERTENCE_A]->(c);

// Compras cruzadas dos novos produtos
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Tablet'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Echo Dot'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Aspirador Robô'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Kindle'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Air Fryer'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Felipe'}), (p:Produto {nome: 'Relógio Smart'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Gabriela'}), (p:Produto {nome: 'Mochila'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Henrique'}), (p:Produto {nome: 'Cadeira Gamer'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Isabela'}), (p:Produto {nome: 'Blusa de Frio'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'João'}), (p:Produto {nome: 'Patins'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Larissa'}), (p:Produto {nome: 'Secador de Cabelo'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Marcos'}), (p:Produto {nome: 'Câmera Digital'}) CREATE (u)-[:COMPROU]->(p);

// Mais compras cruzadas para aumentar a variedade
MATCH (u:Usuario {nome: 'Alice'}), (p:Produto {nome: 'Monitor 27"'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Bob'}), (p:Produto {nome: 'Teclado Mecânico'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Carol'}), (p:Produto {nome: 'Mouse Gamer'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Daniel'}), (p:Produto {nome: 'Batedeira'}) CREATE (u)-[:COMPROU]->(p);
MATCH (u:Usuario {nome: 'Eva'}), (p:Produto {nome: 'Chaleira Elétrica'}) CREATE (u)-[:COMPROU]->(p);