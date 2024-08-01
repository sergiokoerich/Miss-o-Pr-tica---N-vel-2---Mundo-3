-- Criação da sequência para IDs
CREATE SEQUENCE seq_pessoa_id
    START WITH 1
    INCREMENT BY 1;

-- Tabela de Usuários
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Senha NVARCHAR(100)
);

-- Tabela de Pessoas
CREATE TABLE Pessoas (
    ID INT PRIMARY KEY DEFAULT NEXT VALUE FOR seq_pessoa_id,
    Tipo NVARCHAR(10) CHECK (Tipo IN ('Física', 'Jurídica')),
    CPF NVARCHAR(11) NULL,
    CNPJ NVARCHAR(14) NULL,
    Nome NVARCHAR(100),
    Endereco NVARCHAR(255),
    Contato NVARCHAR(100)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Quantidade INT,
    PrecoVenda DECIMAL(10, 2)
);

-- Tabela de Movimentos de Compra
CREATE TABLE MovimentosCompra (
    ID INT PRIMARY KEY IDENTITY,
    ID_Produto INT FOREIGN KEY REFERENCES Produtos(ID),
    ID_Pessoa_Juridica INT FOREIGN KEY REFERENCES Pessoas(ID),
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    Data DATETIME
);

-- Tabela de Movimentos de Venda
CREATE TABLE MovimentosVenda (
    ID INT PRIMARY KEY IDENTITY,
    ID_Produto INT FOREIGN KEY REFERENCES Produtos(ID),
    ID_Pessoa_Fisica INT FOREIGN KEY REFERENCES Pessoas(ID),
    Quantidade INT,
    PrecoVenda DECIMAL(10, 2),
    Data DATETIME
);
