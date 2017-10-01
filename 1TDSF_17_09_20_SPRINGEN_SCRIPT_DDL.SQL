DROP SEQUENCE SEQ_BAIRRO;
DROP TABLE T_SPG_BAIRRO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_CIDADE;
DROP TABLE T_SPG_CIDADE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_CLASS_FISCAL;
DROP TABLE T_SPG_CLASS_FISCAL CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_CLIENTE;
DROP TABLE T_SPG_CLIENTE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_DEPARTAMENTO;
DROP TABLE T_SPG_DEPARTAMENTO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ENTREGA;
DROP TABLE T_SPG_ENTREGA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ESTADO;
DROP TABLE T_SPG_ESTADO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ESTOQUE;
DROP TABLE T_SPG_ESTOQUE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ESTOQUE_END;
DROP TABLE T_SPG_ESTOQUE_END CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_FORNECEDOR;
DROP TABLE T_SPG_FORNECEDOR CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_FORNECEDOR_END;
DROP TABLE T_SPG_FORNECEDOR_END CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_FUNCIONARIO;
DROP TABLE T_SPG_FUNCIONARIO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ITEM_VENDA;
DROP TABLE T_SPG_ITEM_VENDA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_LOGRADOURO;
DROP TABLE T_SPG_LOGRADOURO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_MAT_PRIMA_FORNECIDA;
DROP TABLE T_SPG_MAT_PRIMA_FORNECIDA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_MAT_SOLICITADA;
DROP TABLE T_SPG_MAT_SOLICITADA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_MATERIA_PRIMA;
DROP TABLE T_SPG_MATERIA_PRIMA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NOTA_FISCAL;
DROP TABLE T_SPG_NOTA_FISCAL CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ORDEM_FABRICACAO;
DROP TABLE T_SPG_ORDEM_FABRICACAO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_PEDIDO_MATERIA_PRIMA;
DROP TABLE T_SPG_PEDIDO_MATERIA_PRIMA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_PROD_ESTOQUE;
DROP TABLE T_SPG_PROD_ESTOQUE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_PRODUTO;
DROP TABLE T_SPG_PRODUTO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_TELEFONE;
DROP TABLE T_SPG_TELEFONE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_TIPO_FONE;
DROP TABLE T_SPG_TIPO_FONE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_TIPO_LOG;
DROP TABLE T_SPG_TIPO_LOG CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_UN_MEDIDA;
DROP TABLE T_SPG_UN_MEDIDA CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_USUARIO;
DROP TABLE T_SPG_USUARIO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_USUARIO_ENDE;
DROP TABLE T_SPG_USUARIO_ENDE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_USUARIO_FONE;
DROP TABLE T_SPG_USUARIO_FONE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_VENDA;
DROP TABLE T_SPG_VENDA CASCADE CONSTRAINTS;


CREATE TABLE t_spg_bairro (
    cd_bairro   NUMBER(5) NOT NULL,
    cd_cidade   NUMBER(5) NOT NULL,
    nm_bairro   VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE seq_bairro MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_bairro ADD CONSTRAINT pk_spg_bairro PRIMARY KEY ( cd_bairro );

CREATE TABLE t_spg_cidade (
    cd_cidade   NUMBER(5) NOT NULL,
    cd_estado   NUMBER(2) NOT NULL,
    nm_cidade   VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE seq_cidade MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_cidade ADD CONSTRAINT pk_spg_cid PRIMARY KEY ( cd_cidade );

CREATE TABLE t_spg_class_fiscal (
    cd_classificacao   NUMBER(4) NOT NULL,
    nr_cfop            NUMBER(4) NOT NULL,
    ds_natureza_op     VARCHAR2(50 CHAR) NOT NULL
);

CREATE SEQUENCE seq_class_fiscal MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_class_fiscal ADD CONSTRAINT pk_spg_class_fiscal PRIMARY KEY ( cd_classificacao );

ALTER TABLE t_spg_class_fiscal ADD CONSTRAINT un_spg_clss_fiscal UNIQUE(nr_cfop);

CREATE TABLE t_spg_cliente (
    cd_usuario             NUMBER(4) NOT NULL,
    nr_cnpj                NUMBER(14) NOT NULL,
    ds_razao_social        VARCHAR2(50 CHAR) NOT NULL,
    ds_inscricao_estadual  VARCHAR2(50 CHAR) NOT NULL,
    ds_url                 VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seq_cliente MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

CREATE UNIQUE INDEX t_spg_cliente__idx ON
    t_spg_cliente ( cd_usuario ASC );

CREATE TABLE t_spg_departamento (
    cd_departamento   NUMBER(4) NOT NULL,
    ds_departamento   VARCHAR2(50 CHAR) NOT NULL,
    qt_funcionarios   NUMBER(2) NOT NULL
);

CREATE SEQUENCE seq_departamento MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_departamento ADD CONSTRAINT pk_spg_dep PRIMARY KEY ( cd_departamento );

CREATE TABLE t_spg_entrega (
    cd_entrega   NUMBER(4) NOT NULL,
    cd_nf        NUMBER(4) NOT NULL
);

CREATE SEQUENCE seq_entrega MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_entrega ADD CONSTRAINT pk_spg_entrega PRIMARY KEY ( cd_entrega );

CREATE TABLE t_spg_estado (
    cd_estado   NUMBER(2) NOT NULL,
    nm_estado   VARCHAR2(20) NOT NULL,
    sg_estado   CHAR(2) NOT NULL
);

CREATE SEQUENCE seq_estado MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_estado ADD CONSTRAINT pk_spg_estv2 PRIMARY KEY ( cd_estado );

CREATE TABLE t_spg_estoque (
    cd_estoque           NUMBER(2) NOT NULL,
    nr_cep               NUMBER(8) NOT NULL,
    qt_limite            NUMBER(6) NOT NULL,
    ds_disponibilidade   VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seq_estoque MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_estoque ADD CONSTRAINT pk_spg_est PRIMARY KEY ( cd_estoque );

CREATE TABLE t_spg_estoque_end (
    nr_cep           NUMBER(8) NOT NULL,
    nr_logradouro    NUMBER(4) NOT NULL,
    ds_complemento   VARCHAR2(50 CHAR) NOT NULL
);

CREATE SEQUENCE seq_estoque_end MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_estoque_end ADD CONSTRAINT pk_spg_est_end PRIMARY KEY ( nr_cep );

CREATE TABLE t_spg_fornecedor (
    cd_fornecedor     NUMBER(4) NOT NULL,
    nm_fornecedor     VARCHAR2(20 CHAR) NOT NULL,
    ds_email          VARCHAR2(20 CHAR) NOT NULL,
    nr_cnpj           NUMBER(14) NOT NULL,
    ds_razao_social   VARCHAR2(20 CHAR) NOT NULL
);

CREATE SEQUENCE seq_fornecedor MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_fornecedor ADD CONSTRAINT pk_spg_forn PRIMARY KEY ( cd_fornecedor );

ALTER TABLE T_SPG_FORNECEDOR ADD CONSTRAINT UN_SPG_DS_EMAIL_FORNECEDOR UNIQUE (DS_EMAIL);

CREATE TABLE t_spg_fornecedor_end (
    nr_cep           NUMBER(8) NOT NULL,
    nr_logradouro    NUMBER(5) NOT NULL,
    ds_complemento   VARCHAR2(50 CHAR) NOT NULL,
    cd_fornecedor    NUMBER(4) NOT NULL
);

CREATE SEQUENCE seq_fornecedor_end MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_fornecedor_end ADD CONSTRAINT pk_spg_forn_end PRIMARY KEY ( nr_cep );

CREATE TABLE t_spg_funcionario (
    cd_usuario        NUMBER(4) NOT NULL,
    cd_departamento   NUMBER(4) NOT NULL,
    ds_rg             VARCHAR2(10 CHAR) NOT NULL,
    nr_cpf            NUMBER(11) NOT NULL
);

CREATE SEQUENCE seq_funcionario MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

CREATE UNIQUE INDEX t_spg_funcionario__idx ON
    t_spg_funcionario ( cd_usuario ASC );

CREATE TABLE t_spg_item_venda (
    cd_venda            NUMBER(4) NOT NULL,
    cd_produto          NUMBER(2) NOT NULL,
    cd_item             NUMBER(4) NOT NULL,
    vl_unitario_venda   NUMBER(4,2) NOT NULL,
    vl_total_item       NUMBER(7,2) NOT NULL
);

CREATE SEQUENCE seq_item_venda MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_item_venda ADD CONSTRAINT pk_spg_item_venda PRIMARY KEY ( cd_item );

CREATE TABLE t_spg_logradouro (
    nr_cep               NUMBER(8) NOT NULL,
    cd_bairro            NUMBER(5) NOT NULL,
    cd_tipo_logradouro   NUMBER(2) NOT NULL,
    ds_descricao         VARCHAR2(60) NOT NULL
);

CREATE SEQUENCE seq_logradouro MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_logradouro ADD CONSTRAINT pk_spg_log PRIMARY KEY ( nr_cep );

CREATE TABLE t_spg_mat_prima_fornecida (
    cd_materia_prima       NUMBER(4) NOT NULL,
    cd_fornecedor          NUMBER(4) NOT NULL,
    qt_materia_fornecida   NUMBER(5) NOT NULL
);

CREATE SEQUENCE seq_mat_prima_fornecida MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_mat_prima_fornecida ADD CONSTRAINT pk_spg_mp_forn PRIMARY KEY ( cd_materia_prima,cd_fornecedor );

CREATE TABLE t_spg_mat_solicitada (
    cd_materia_prima   NUMBER(4) NOT NULL,
    cd_usuario         NUMBER(4) NOT NULL,
    cd_fornecedor      NUMBER(4) NOT NULL,
    qt_comprada        NUMBER(5) NOT NULL,
    dt_solicitacao     VARCHAR2(10) NOT NULL,
    hr_solicitacao     VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE seq_mat_solicitada MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_mat_solicitada
    ADD CONSTRAINT pk_spg_mat_solicit PRIMARY KEY ( cd_usuario,cd_materia_prima,cd_fornecedor );

CREATE TABLE t_spg_materia_prima (
    cd_materia_prima   NUMBER(4) NOT NULL,
    ds_mat_prima       VARCHAR2(50 CHAR) NOT NULL,
    vl_mat_prima       NUMBER(8,2) NOT NULL,
    cd_un_medida       NUMBER(4) NOT NULL
);

CREATE SEQUENCE seq_materia_prima MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_materia_prima ADD CONSTRAINT pk_spg_mp PRIMARY KEY ( cd_materia_prima );

CREATE TABLE t_spg_nota_fiscal (
    cd_nf                  NUMBER(4) NOT NULL,
    cd_classificacao       NUMBER(4) NOT NULL,
    ds_tipo                VARCHAR2(50 CHAR) NOT NULL,
    dt_emissao             VARCHAR2(10) NOT NULL,
    vl_total_nota_fiscal   NUMBER(8,2) NOT NULL
);

CREATE SEQUENCE seq_nota_fiscal MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE;

ALTER TABLE t_spg_nota_fiscal ADD CONSTRAINT pk_spg_nota_fiscal PRIMARY KEY ( cd_nf );

CREATE TABLE t_spg_ordem_fabricacao (
    cd_ordem      NUMBER(4) NOT NULL,
    ds_ordem      VARCHAR2(50 CHAR) NOT NULL,
    qt_produtos   NUMBER(4) NOT NULL,
    dt_emissao    VARCHAR2(10) NOT NULL,
    hr_emissao    VARCHAR2(10) NOT NULL,
    cd_produto    NUMBER(2) NOT NULL,
    cd_venda      NUMBER(4) NOT NULL
);

CREATE SEQUENCE seq_ordem_fabricacao MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_ordem_fabricacao ADD CONSTRAINT pk_spg_ord_fab PRIMARY KEY ( cd_ordem );

CREATE TABLE t_spg_pedido_materia_prima (
    cd_usuario       NUMBER(4) NOT NULL,
    cd_pedido        NUMBER(4) NOT NULL,
    qt_pedido        NUMBER(5) NOT NULL,
    dt_pedido        VARCHAR2(10) NOT NULL,
    hr_pedido        VARCHAR2(10) NOT NULL,
    ds_pedido        VARCHAR2(50 CHAR) NOT NULL,
    cd_ordem         NUMBER(4) NULL
);

CREATE SEQUENCE seq_pedido_materia_prima MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_pedido_materia_prima ADD CONSTRAINT pk_spg_pedido_mp PRIMARY KEY ( cd_usuario );

CREATE TABLE t_spg_prod_estoque (
    qt_estocada   NUMBER(6) NOT NULL,
    cd_produto    NUMBER(2) NOT NULL,
    cd_estoque    NUMBER(2) NOT NULL
);

CREATE SEQUENCE seq_prod_estoque MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_prod_estoque ADD CONSTRAINT pk_spg_prod_est PRIMARY KEY ( cd_produto,cd_estoque );

CREATE TABLE t_spg_produto (
    cd_produto          NUMBER(2) NOT NULL,
    ds_produto          VARCHAR2(50 CHAR) NOT NULL,
    vl_preco_unitario   NUMBER(5,2) NOT NULL,
    ds_disponibilidade  VARCHAR2(50 CHAR) NOT NULL,
    nm_produto          VARCHAR2(20 CHAR) NOT NULL,
    ds_url              VARCHAR2(100 CHAR) NOT NULL
);

CREATE SEQUENCE seq_produto MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_produto ADD CONSTRAINT pk_spg_prod PRIMARY KEY ( cd_produto );

CREATE TABLE t_spg_telefone (
    cd_fone        NUMBER(8) NOT NULL,
    cd_tipo_fone   NUMBER(2) NOT NULL,
    nr_ddd         NUMBER(3) NOT NULL,
    nr_telefone    NUMBER(9) NOT NULL
);

CREATE SEQUENCE seq_telefone MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_telefone ADD CONSTRAINT pk_spg_tel PRIMARY KEY ( cd_fone );

CREATE TABLE t_spg_tipo_fone (
    cd_tipo_fone   NUMBER(2) NOT NULL,
    ds_tipo_fone   CHAR(20) NOT NULL
);

CREATE SEQUENCE seq_tipo_fone MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_tipo_fone ADD CONSTRAINT pk_spg_tipo_fone PRIMARY KEY ( cd_tipo_fone );

CREATE TABLE t_spg_tipo_log (
    cd_tipo_logradouro   NUMBER(2) NOT NULL,
    ds_tipo_logradouro   VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE seq_tipo_log MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_tipo_log ADD CONSTRAINT pk_spg_tipo_log PRIMARY KEY ( cd_tipo_logradouro );

CREATE TABLE t_spg_un_medida (
    cd_un_medida   NUMBER(4) NOT NULL,
    ds_un_medida   VARCHAR2(50 CHAR) NOT NULL
);

CREATE SEQUENCE seq_un_medida MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_un_medida ADD CONSTRAINT pk_spg_un_med PRIMARY KEY ( cd_un_medida );

CREATE TABLE t_spg_usuario (
    cd_usuario   NUMBER(4) NOT NULL,
    nm_nome      VARCHAR2(50 CHAR) NOT NULL,
    ds_email     VARCHAR2(50 CHAR) NOT NULL,
    ds_senha     VARCHAR2(20 CHAR) NOT NULL
);

CREATE SEQUENCE seq_usuario MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_usuario ADD CONSTRAINT pk_spg_user PRIMARY KEY ( cd_usuario );

ALTER TABLE T_SPG_USUARIO ADD CONSTRAINT UN_SPG_DS_EMAIL UNIQUE (DS_EMAIL);

CREATE TABLE t_spg_usuario_ende (
    cd_usuario       NUMBER(4) NOT NULL,
    nr_cep           NUMBER(8) NOT NULL,
    nr_logradouro    NUMBER(5) NOT NULL,
    ds_complemento   VARCHAR2(30)
);

CREATE SEQUENCE seq_usuario_ende MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

CREATE UNIQUE INDEX t_spg_usuario_ende__idx ON
    t_spg_usuario_ende ( cd_usuario ASC );

ALTER TABLE t_spg_usuario_ende ADD CONSTRAINT pk_spg_user_ende PRIMARY KEY ( nr_cep );

CREATE TABLE t_spg_usuario_fone (
    cd_fone      NUMBER(8) NOT NULL,
    cd_usuario   NUMBER(4) NOT NULL,
    nr_ramal     NUMBER(4)
);

CREATE SEQUENCE seq_usuario_fone MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 25;

ALTER TABLE t_spg_usuario_fone ADD CONSTRAINT pk_spg_user_fone PRIMARY KEY ( cd_fone,cd_usuario );

CREATE TABLE t_spg_venda (
    cd_venda     NUMBER(4) NOT NULL,
    cd_nf        NUMBER(4) NOT NULL,
    cd_usuario   NUMBER(4) NOT NULL,
    vl_venda     NUMBER(8,2) NOT NULL,
    dt_venda     VARCHAR2(10) NOT NULL,
    hr_venda     VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE seq_venda MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE UNIQUE INDEX t_spg_venda__idx ON
    t_spg_venda ( cd_nf ASC );

ALTER TABLE t_spg_venda ADD CONSTRAINT pk_spg_venda PRIMARY KEY ( cd_venda );

ALTER TABLE t_spg_bairro
    ADD CONSTRAINT fk_spg_bairro_cid FOREIGN KEY ( cd_cidade )
        REFERENCES t_spg_cidade ( cd_cidade );

ALTER TABLE t_spg_cidade
    ADD CONSTRAINT fk_spg_cid_est FOREIGN KEY ( cd_estado )
        REFERENCES t_spg_estado ( cd_estado );

ALTER TABLE t_spg_cliente
    ADD CONSTRAINT fk_spg_cli_user FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );

ALTER TABLE t_spg_entrega
    ADD CONSTRAINT fk_spg_entrega_nf FOREIGN KEY ( cd_nf )
        REFERENCES t_spg_nota_fiscal ( cd_nf );

ALTER TABLE t_spg_estoque_end
    ADD CONSTRAINT fk_spg_est_end_log FOREIGN KEY ( nr_cep )
        REFERENCES t_spg_logradouro ( nr_cep );

ALTER TABLE t_spg_estoque
    ADD CONSTRAINT fk_spg_est_est_end FOREIGN KEY ( nr_cep )
        REFERENCES t_spg_estoque_end ( nr_cep );

ALTER TABLE t_spg_fornecedor_end
    ADD CONSTRAINT fk_spg_forn_end_forn FOREIGN KEY ( cd_fornecedor )
        REFERENCES t_spg_fornecedor ( cd_fornecedor );

ALTER TABLE t_spg_fornecedor_end
    ADD CONSTRAINT fk_spg_forn_end_log FOREIGN KEY ( nr_cep )
        REFERENCES t_spg_logradouro ( nr_cep );

ALTER TABLE t_spg_funcionario
    ADD CONSTRAINT fk_spg_func_dep FOREIGN KEY ( cd_departamento )
        REFERENCES t_spg_departamento ( cd_departamento );

ALTER TABLE t_spg_funcionario
    ADD CONSTRAINT fk_spg_func_user FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );

ALTER TABLE t_spg_item_venda
    ADD CONSTRAINT fk_spg_item_venda_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_spg_produto ( cd_produto );

ALTER TABLE t_spg_item_venda
    ADD CONSTRAINT fk_spg_item_venda_venda FOREIGN KEY ( cd_venda )
        REFERENCES t_spg_venda ( cd_venda );

ALTER TABLE t_spg_logradouro
    ADD CONSTRAINT fk_spg_log_bairro FOREIGN KEY ( cd_bairro )
        REFERENCES t_spg_bairro ( cd_bairro );

ALTER TABLE t_spg_logradouro
    ADD CONSTRAINT fk_spg_log_tipo_log FOREIGN KEY ( cd_tipo_logradouro )
        REFERENCES t_spg_tipo_log ( cd_tipo_logradouro );

ALTER TABLE t_spg_mat_solicitada
    ADD CONSTRAINT fk_spg_mat_solicit_mp_forn FOREIGN KEY ( cd_materia_prima,cd_fornecedor )
        REFERENCES t_spg_mat_prima_fornecida ( cd_materia_prima,cd_fornecedor );

ALTER TABLE t_spg_mat_solicitada
    ADD CONSTRAINT fk_spg_mat_solicit_pedido_mp FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_pedido_materia_prima ( cd_usuario );

ALTER TABLE t_spg_mat_prima_fornecida
    ADD CONSTRAINT fk_spg_mp_forn_forn FOREIGN KEY ( cd_fornecedor )
        REFERENCES t_spg_fornecedor ( cd_fornecedor );

ALTER TABLE t_spg_mat_prima_fornecida
    ADD CONSTRAINT fk_spg_mp_forn_mp FOREIGN KEY ( cd_materia_prima )
        REFERENCES t_spg_materia_prima ( cd_materia_prima );

ALTER TABLE t_spg_materia_prima
    ADD CONSTRAINT fk_spg_mp_un_med FOREIGN KEY ( cd_un_medida )
        REFERENCES t_spg_un_medida ( cd_un_medida );

ALTER TABLE t_spg_nota_fiscal
    ADD CONSTRAINT fk_spg_nf_spg_class_fiscal FOREIGN KEY ( cd_classificacao )
        REFERENCES t_spg_class_fiscal ( cd_classificacao );

ALTER TABLE t_spg_ordem_fabricacao
    ADD CONSTRAINT fk_spg_ord_fab_item_venda FOREIGN KEY ( cd_venda )
        REFERENCES t_spg_venda ( cd_venda );

ALTER TABLE t_spg_ordem_fabricacao
    ADD CONSTRAINT fk_spg_ord_fab_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_spg_produto ( cd_produto );

ALTER TABLE t_spg_pedido_materia_prima
    ADD CONSTRAINT fk_spg_pedido_mp_func FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );

ALTER TABLE t_spg_pedido_materia_prima
    ADD CONSTRAINT fk_spg_pedido_mp_ord_fab FOREIGN KEY ( cd_ordem )
        REFERENCES t_spg_ordem_fabricacao ( cd_ordem );

ALTER TABLE t_spg_prod_estoque
    ADD CONSTRAINT fk_spg_prod_est_est FOREIGN KEY ( cd_estoque )
        REFERENCES t_spg_estoque ( cd_estoque );

ALTER TABLE t_spg_prod_estoque
    ADD CONSTRAINT fk_spg_prod_est_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_spg_produto ( cd_produto );

ALTER TABLE t_spg_telefone
    ADD CONSTRAINT fk_spg_tel_tipo_fone FOREIGN KEY ( cd_tipo_fone )
        REFERENCES t_spg_tipo_fone ( cd_tipo_fone );

ALTER TABLE t_spg_usuario_ende
    ADD CONSTRAINT fk_spg_user_ende_log FOREIGN KEY ( nr_cep )
        REFERENCES t_spg_logradouro ( nr_cep );

ALTER TABLE t_spg_usuario_ende
    ADD CONSTRAINT fk_spg_user_ende_user FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );

ALTER TABLE t_spg_usuario_fone
    ADD CONSTRAINT fk_spg_user_fone_tel FOREIGN KEY ( cd_fone )
        REFERENCES t_spg_telefone ( cd_fone );

ALTER TABLE t_spg_usuario_fone
    ADD CONSTRAINT fk_spg_user_fone_user FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );

ALTER TABLE t_spg_venda
    ADD CONSTRAINT fk_spg_venda_cli FOREIGN KEY ( cd_usuario )
        REFERENCES t_spg_usuario ( cd_usuario );
