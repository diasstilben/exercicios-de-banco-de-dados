* **Categoria** (`CodCat`, `NomeCat`)
* **Produto** (`CodProd`, `NomeProd`, `Preco`, `CodCat`)
* **Venda** (`CodVenda`, `CodProd`, `Quantidade`, `DataVenda`)

CREATE TABLE Categoria (
    CodCat INT PRIMARY KEY,
    NomeCat VARCHAR(255) NOT NULL
);

CREATE TABLE Produto (
    CodProd INT PRIMARY KEY,
    NomeProd VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2),
    CodCat INT,
    FOREIGN KEY (CodCat) REFERENCES Categoria(CodCat)
);

CREATE TABLE Venda (
    CodVenda INT PRIMARY KEY,
    CodProd INT,
    Quantidade INT,
    DataVenda DATE,
    FOREIGN KEY (CodProd) REFERENCES Produto(CodProd)
);