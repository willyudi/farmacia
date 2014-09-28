-- Database: dbminhafarmacia

-- DROP DATABASE dbminhafarmacia;

CREATE DATABASE dbminhafarmacia
  WITH OWNER = williano
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'pt_BR.UTF-8'
       LC_CTYPE = 'pt_BR.UTF-8'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE dbminhafarmacia
  IS 'Banco de dados da aplicacao minha farmacia, criado originalmente em 03 de maio de 2014.';

-- Table: tbindicacao

-- DROP TABLE tbindicacao;

CREATE TABLE tbindicacao
(
  idindicacao serial NOT NULL,
  dsindicacao character varying(20),
  CONSTRAINT pkindicacao PRIMARY KEY (idindicacao )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbindicacao
  OWNER TO williano;
COMMENT ON TABLE tbindicacao
  IS 'Tabela de Indicacao do Remedio';

-- Table: tbminhafarmacia

-- DROP TABLE tbminhafarmacia;

CREATE TABLE tbminhafarmacia
(
  dtabertura date,
  dtencerramento date,
  idremedio integer,
  idminhafarmacia serial NOT NULL,
  CONSTRAINT pkminhafarmacia PRIMARY KEY (idminhafarmacia ),
  CONSTRAINT fkremedio FOREIGN KEY (idremedio)
      REFERENCES tbremedio (idremedio) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbminhafarmacia
  OWNER TO williano;
COMMENT ON TABLE tbminhafarmacia
  IS 'Tabela principal Minha Farmacia';

-- Table: tbpaciente

-- DROP TABLE tbpaciente;

CREATE TABLE tbpaciente
(
  dspaciente character varying(20),
  idpaciente serial NOT NULL,
  CONSTRAINT pkpaciente PRIMARY KEY (idpaciente )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbpaciente
  OWNER TO williano;
COMMENT ON TABLE tbpaciente
  IS 'Tabela de Pacientes';

-- Table: tbremedio

-- DROP TABLE tbremedio;

CREATE TABLE tbremedio
(
  idremedio serial NOT NULL,
  dsnome character varying(30),
  idindicacao integer,
  idtipo integer,
  dtvalidade date,
  CONSTRAINT pkremedio PRIMARY KEY (idremedio ),
  CONSTRAINT fkindicacao FOREIGN KEY (idindicacao)
      REFERENCES tbindicacao (idindicacao) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fktipo FOREIGN KEY (idtipo)
      REFERENCES tbtipo (idtipo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbremedio
  OWNER TO williano;
COMMENT ON TABLE tbremedio
  IS 'Tabela de Remedios';

-- Table: tbtipo

-- DROP TABLE tbtipo;

CREATE TABLE tbtipo
(
  idtipo serial NOT NULL,
  dstipo character varying(20),
  CONSTRAINT pktipo PRIMARY KEY (idtipo )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbtipo
  OWNER TO williano;
COMMENT ON TABLE tbtipo
  IS 'Tabela de Tipos de Remedios';

-- Table: tbtratamento

-- DROP TABLE tbtratamento;

CREATE TABLE tbtratamento
(
  idtratamento serial NOT NULL,
  idpaciente integer,
  dsdosagem character varying(20),
  idminhafarmacia integer,
  dtiniciotratamento date,
  dtfimtratamento date,
  CONSTRAINT pktratamento PRIMARY KEY (idtratamento ),
  CONSTRAINT fkpaciente FOREIGN KEY (idpaciente)
      REFERENCES tbpaciente (idpaciente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT pkminhafarmacia FOREIGN KEY (idminhafarmacia)
      REFERENCES tbminhafarmacia (idminhafarmacia) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbtratamento
  OWNER TO williano;
COMMENT ON TABLE tbtratamento
  IS 'Tabela de Tratamento dos Pacientes';

-- Sequence: tbindicacao_idindicacao_seq

-- DROP SEQUENCE tbindicacao_idindicacao_seq;

CREATE SEQUENCE tbindicacao_idindicacao_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tbindicacao_idindicacao_seq
  OWNER TO williano;

-- Sequence: tbminhafarmacia_idminhafarmacia_seq

-- DROP SEQUENCE tbminhafarmacia_idminhafarmacia_seq;

CREATE SEQUENCE tbminhafarmacia_idminhafarmacia_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tbminhafarmacia_idminhafarmacia_seq
  OWNER TO williano;

-- Sequence: tbpaciente_idpaciente_seq

-- DROP SEQUENCE tbpaciente_idpaciente_seq;

CREATE SEQUENCE tbpaciente_idpaciente_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tbpaciente_idpaciente_seq
  OWNER TO williano;

-- Sequence: tbremedio_idremedio_seq

-- DROP SEQUENCE tbremedio_idremedio_seq;

CREATE SEQUENCE tbremedio_idremedio_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tbremedio_idremedio_seq
  OWNER TO williano;

-- Sequence: tbtipo_idtipo_seq

-- DROP SEQUENCE tbtipo_idtipo_seq;

CREATE SEQUENCE tbtipo_idtipo_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 6
  CACHE 1;
ALTER TABLE tbtipo_idtipo_seq
  OWNER TO williano;

-- Sequence: tbtratamento_idtratamento_seq

-- DROP SEQUENCE tbtratamento_idtratamento_seq;

CREATE SEQUENCE tbtratamento_idtratamento_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tbtratamento_idtratamento_seq
  OWNER TO williano;


