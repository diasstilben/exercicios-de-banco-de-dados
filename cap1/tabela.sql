* **Func** (`Mat`, `NomeFunc`, `Sal`, `CodDep`)[1]
* **Depto** (`CodDep`, `NomeDep`)[1]
* **Cliente** (`CodCli`, `NomeCli`, `Tel`, `Endereco`)[2][3]
* **Fornecedor** (`CodForn`, `NomeForn`, `Tel`, `End`)[2][3]

-- Tabela de Departamentos
CREATE TABLE Depto (
    CodDep INT PRIMARY KEY,
    NomeDep VARCHAR(255) NOT NULL
);

-- Tabela de Funcionários
CREATE TABLE Func (
    Mat INT PRIMARY KEY,
    NomeFunc VARCHAR(255) NOT NULL,
    Sal DECIMAL(10, 2),
    CodDep INT,
    FOREIGN KEY (CodDep) REFERENCES Depto(CodDep)
);

-- Tabela de Clientes
CREATE TABLE Cliente (
    CodCli INT PRIMARY KEY,
    NomeCli VARCHAR(255) NOT NULL,
    Tel VARCHAR(20),
    Endereco VARCHAR(255)
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedor (
    CodForn INT PRIMARY KEY,
    NomeForn VARCHAR(255) NOT NULL,
    Tel VARCHAR(20),
    End VARCHAR(255)
);