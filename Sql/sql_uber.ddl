-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-06-13 12:44:58 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Automoveis 
    (
     IdAutomovel BIGINT NOT NULL , 
     CRLV IMAGE NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL , 
     Placa CHAR (7) NOT NULL , 
     Renavam CHAR (11) NOT NULL , 
     Chassi VARCHAR (20) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Automoveis__IDX ON Automoveis 
    ( 
     Usuarios_IdUsuario 
    ) 
GO

ALTER TABLE Automoveis ADD CONSTRAINT Automoveis_PK PRIMARY KEY CLUSTERED (IdAutomovel)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Automoveis ADD CONSTRAINT limitarRenavanNumerico CHECK ( Renavan not like '%[^a-z]%' ) 
GO

CREATE TABLE Cartoes 
    (
     IdCartao BIGINT NOT NULL , 
     NumeroCartao VARCHAR (16) NOT NULL , 
     DataVencimento DATE NOT NULL , 
     CVV CHAR (3) NOT NULL , 
     TipoOperacao CHAR (1) NOT NULL , 
     FPagamento_IdFormaPagamento BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Cartoes__IDX ON Cartoes 
    ( 
     FPagamento_IdFormaPagamento 
    ) 
GO

ALTER TABLE Cartoes ADD CONSTRAINT Cartoes_PK PRIMARY KEY CLUSTERED (IdCartao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Cartoes ADD CONSTRAINT tipoOperacaoCartao CHECK ( TipoOperacao in ("C", "D") ) 
GO

CREATE TABLE CNHs 
    (
     IdCNH BIGINT NOT NULL , 
     Numero CHAR (11) NOT NULL , 
     DataPrimeiraHabilitacao DATE NOT NULL , 
     UF CHAR (2) NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    CNHs__IDX ON CNHs 
    ( 
     Usuarios_IdUsuario 
    ) 
GO

ALTER TABLE CNHs ADD CONSTRAINT CNHs_PK PRIMARY KEY CLUSTERED (IdCNH)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE CodigosPaises 
    (
     IdCodigoPais INTEGER NOT NULL , 
     Codigo SMALLINT NOT NULL , 
     Telefones_IdTelefones BIGINT NOT NULL 
    )
GO

ALTER TABLE CodigosPaises ADD CONSTRAINT CodigosPaises_PK PRIMARY KEY CLUSTERED (IdCodigoPais)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ContatosEmail 
    (
     IdEmail BIGINT NOT NULL , 
     Email VARCHAR (100) NOT NULL , 
     Principal BIT NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL 
    )
GO

ALTER TABLE ContatosEmail ADD CONSTRAINT ContatosEmail_PK PRIMARY KEY CLUSTERED (IdEmail)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE FormasPagamento 
    (
     IdFormaPagamento BIGINT NOT NULL , 
     TipoPagamento CHAR (1) NOT NULL , 
     Principal BIT NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL 
    )
GO

ALTER TABLE FormasPagamento ADD CONSTRAINT FormasPagamento_PK PRIMARY KEY CLUSTERED (IdFormaPagamento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE FormasPagamento ADD CONSTRAINT tipoPagamento CHECK ( TipoPagamento in ("DINHEIRO", "PIX", "CARTAO", "PAYPAL") ) 
GO

CREATE TABLE Identidades 
    (
     IdIdentidade BIGINT NOT NULL , 
     Numero VARCHAR (10) NOT NULL , 
     OegaoEmissor VARCHAR (10) NOT NULL , 
     UF CHAR (2) NOT NULL , 
     DataEmissao DATE NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Identidades__IDX ON Identidades 
    ( 
     Usuarios_IdUsuario 
    ) 
GO

ALTER TABLE Identidades ADD CONSTRAINT Identidades_PK PRIMARY KEY CLUSTERED (IdIdentidade)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PayPal 
    (
     IdPayPal BIGINT NOT NULL , 
     Token CHAR (128) NOT NULL , 
     FormasPagamento_IdFormaPagamento BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    PayPal__IDX ON PayPal 
    ( 
     FormasPagamento_IdFormaPagamento 
    ) 
GO

ALTER TABLE PayPal ADD CONSTRAINT PayPal_PK PRIMARY KEY CLUSTERED (IdPayPal)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Telefones 
    (
     IdTelefones BIGINT NOT NULL , 
     DDDCelular VARCHAR (3) NOT NULL , 
     NumeroCelular VARCHAR (9) NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Telefones__IDX ON Telefones 
    ( 
     Usuarios_IdUsuario 
    ) 
GO

ALTER TABLE Telefones ADD CONSTRAINT Telefones_PK PRIMARY KEY CLUSTERED (IdTelefones)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Telefones ADD CONSTRAINT ddd CHECK ( DDD like '%[0-9]%' ) 
GO


ALTER TABLE Telefones ADD CONSTRAINT numeroCelular CHECK ( NumeroCelular like '%[0-9]%' ) 
GO

CREATE TABLE Usuarios 
    (
     IdUsuario BIGINT NOT NULL , 
     PrimeiroNome VARCHAR (50) NOT NULL , 
     UltimoNome VARCHAR (50) NOT NULL , 
     HashSenha CHAR (255) NOT NULL , 
     Motorista BIT NOT NULL , 
     SaldoCarteira DECIMAL (2,12) NOT NULL , 
     Telefones_IdTelefones BIGINT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Usuarios__IDX ON Usuarios 
    ( 
     Telefones_IdTelefones 
    ) 
GO

ALTER TABLE Usuarios ADD CONSTRAINT Usuarios_PK PRIMARY KEY CLUSTERED (IdUsuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Viagens 
    (
     IdViagem BIGINT NOT NULL , 
     DataHoraPartida DATETIME NOT NULL , 
     DataHoraChegada DATETIME NOT NULL , 
     LocalizacaoPartida VARCHAR (8000) NOT NULL , 
     LocalizacaoChegada VARCHAR (8000) NOT NULL , 
     TotalViagem DECIMAL (2,12) NOT NULL , 
     Usuarios_IdUsuario BIGINT NOT NULL , 
     FormasPagamento_IdFormaPagamento BIGINT NOT NULL 
    )
GO

ALTER TABLE Viagens ADD CONSTRAINT Viagens_PK PRIMARY KEY CLUSTERED (IdViagem)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Automoveis 
    ADD CONSTRAINT Automoveis_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cartoes 
    ADD CONSTRAINT Cartoes_FormasPagamento_FK FOREIGN KEY 
    ( 
     FPagamento_IdFormaPagamento
    ) 
    REFERENCES FormasPagamento 
    ( 
     IdFormaPagamento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE CNHs 
    ADD CONSTRAINT CNHs_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE CodigosPaises 
    ADD CONSTRAINT CodigosPaises_Telefones_FK FOREIGN KEY 
    ( 
     Telefones_IdTelefones
    ) 
    REFERENCES Telefones 
    ( 
     IdTelefones 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ContatosEmail 
    ADD CONSTRAINT ContatosEmail_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE FormasPagamento 
    ADD CONSTRAINT FormasPagamento_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Identidades 
    ADD CONSTRAINT Identidades_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PayPal 
    ADD CONSTRAINT PayPal_FormasPagamento_FK FOREIGN KEY 
    ( 
     FormasPagamento_IdFormaPagamento
    ) 
    REFERENCES FormasPagamento 
    ( 
     IdFormaPagamento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Telefones 
    ADD CONSTRAINT Telefones_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuarios 
    ADD CONSTRAINT Usuarios_Telefones_FK FOREIGN KEY 
    ( 
     Telefones_IdTelefones
    ) 
    REFERENCES Telefones 
    ( 
     IdTelefones 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Viagens 
    ADD CONSTRAINT Viagens_FormasPagamento_FK FOREIGN KEY 
    ( 
     FormasPagamento_IdFormaPagamento
    ) 
    REFERENCES FormasPagamento 
    ( 
     IdFormaPagamento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Viagens 
    ADD CONSTRAINT Viagens_Usuarios_FK FOREIGN KEY 
    ( 
     Usuarios_IdUsuario
    ) 
    REFERENCES Usuarios 
    ( 
     IdUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             7
-- ALTER TABLE                             28
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
