-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 26-Out-2016 às 14:20
-- Versão do servidor: 5.5.35
-- versão do PHP: 5.4.45-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `observatorio_producao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_de_artigo_para_perfil`
--

CREATE TABLE IF NOT EXISTS `acesso_de_artigo_para_perfil` (
  `id_acesso_de_artigo_para_perfil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_artigo` varchar(255) NOT NULL,
  `slug_perfil` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_acesso_de_artigo_para_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_de_perfil_para_artigo`
--

CREATE TABLE IF NOT EXISTS `acesso_de_perfil_para_artigo` (
  `id_acesso_de_perfil_para_artigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_artigo` varchar(255) NOT NULL,
  `slug_perfil` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_acesso_de_perfil_para_artigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1720 ;
-- --------------------------------------------------------

--
-- Estrutura da tabela `artigos`
--

CREATE TABLE IF NOT EXISTS `artigos` (
  `id_artigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_artigo` varchar(255) NOT NULL,
  `subtitulo_artigo` varchar(255) NOT NULL,
  `descricao_artigo` varchar(255) NOT NULL,
  `slug_artigo` varchar(255) NOT NULL,
  `capa_artigo` varchar(255) NOT NULL,
  `texto_artigo` text NOT NULL,
  `video_url_artigo` varchar(255) NOT NULL,
  `total_acessos_artigo` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_positiva_artigo` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_negativa_artigo` int(10) unsigned NOT NULL DEFAULT '0',
  `autor_original` varchar(20) DEFAULT NULL,
  `id_original` int(10) unsigned DEFAULT NULL,
  `ordem` int(10) unsigned DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  `data_original` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_artigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=128 ;
-- --------------------------------------------------------

--
-- Estrutura da tabela `artigos_tags`
--

CREATE TABLE IF NOT EXISTS `artigos_tags` (
  `id_artigos_tags` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_artigo` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_artigos_tags`),
  KEY `FK_artigos_tags1` (`id_artigo`),
  KEY `FK_artigos_tags2` (`id_tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=128 ;

--
-- Extraindo dados da tabela `artigos_tags`
--
-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo_arquivos`
--

CREATE TABLE IF NOT EXISTS `artigo_arquivos` (
  `id_arquivo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ordem` int(10) unsigned DEFAULT NULL,
  `artigo` int(10) unsigned NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_arquivo`),
  KEY `FK_arquivo_artigo` (`artigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Estrutura da tabela `artigo_imagens`
--

CREATE TABLE IF NOT EXISTS `artigo_imagens` (
  `id_imagem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ordem` int(10) unsigned DEFAULT NULL,
  `artigo` int(10) unsigned NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `FK_imagem_artigo` (`artigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo_utilidade`
--

CREATE TABLE IF NOT EXISTS `artigo_utilidade` (
  `id_artigo_utilidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_artigo` varchar(255) NOT NULL,
  `slug_perfil` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `achou_util` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_artigo_utilidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1690 ;
-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `descricao_categoria` varchar(255) NOT NULL,
  `slug_categoria` varchar(255) NOT NULL,
  `capa_categoria` varchar(255) NOT NULL,
  `id_cor` int(10) unsigned NOT NULL,
  `id_cor_intensidade` int(10) unsigned NOT NULL,
  `total_acessos_categoria` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_positiva_categoria` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_negativa_categoria` int(10) unsigned NOT NULL DEFAULT '0',
  `ordem` int(10) unsigned DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `FK_cor_categoria` (`id_cor`),
  KEY `FK_cor_intensidade_categoria` (`id_cor_intensidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `categorias`
--
-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_artigos`
--

CREATE TABLE IF NOT EXISTS `categorias_artigos` (
  `id_categorias_artigos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_categoria` int(10) unsigned NOT NULL,
  `id_artigo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_categorias_artigos`),
  KEY `FK_categorias_artigos1` (`id_categoria`),
  KEY `FK_categorias_artigos2` (`id_artigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=153 ;

--
-- Extraindo dados da tabela `categorias_artigos`
--

--
-- Estrutura da tabela `categoria_utilidade`
--

CREATE TABLE IF NOT EXISTS `categoria_utilidade` (
  `id_categoria_utilidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug_categoria` varchar(255) NOT NULL,
  `slug_perfil` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `achou_util` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_categoria_utilidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=153 ;

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela `contribuicoes`
--

CREATE TABLE IF NOT EXISTS `contribuicoes` (
  `id_contribuicao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_contribuicao` int(10) unsigned NOT NULL,
  `titulo_contribuicao` varchar(255) NOT NULL,
  `resumo_contribuicao` varchar(500) NOT NULL,
  `texto_contribuicao` text NOT NULL,
  `imagem_contribuicao` varchar(255) DEFAULT NULL,
  `capa_contribuicao` varchar(255) DEFAULT NULL,
  `video_url_contribuicao` varchar(255) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `total_visualizacoes` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_positiva` int(10) unsigned NOT NULL DEFAULT '0',
  `total_avaliacao_negativa` int(10) unsigned NOT NULL DEFAULT '0',
  `total_denuncias` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contribuicao`),
  KEY `FK_tipo_contribuicao` (`id_tipo_contribuicao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Estrutura da tabela `cores`
--

CREATE TABLE IF NOT EXISTS `cores` (
  `id_cor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- Estrutura da tabela `cores_intensidades`
--

CREATE TABLE IF NOT EXISTS `cores_intensidades` (
  `id_cor_intensidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cor_intensidade` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cor_intensidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Estrutura da tabela `home`
--

CREATE TABLE IF NOT EXISTS `home` (
  `id_home` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `texto` text NOT NULL,
  `rodape_titulo` varchar(255) NOT NULL,
  `rodape_texto` text NOT NULL,
  `id_cor` int(10) unsigned NOT NULL,
  `id_cor_intensidade` int(10) unsigned NOT NULL,
  `total_acessos_home` int(10) unsigned NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_home`),
  KEY `FK_cor_home` (`id_cor`),
  KEY `FK_cor_intensidade_home` (`id_cor_intensidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- Estrutura da tabela `home_imagens`
--

CREATE TABLE IF NOT EXISTS `home_imagens` (
  `id_imagem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ordem` int(10) unsigned DEFAULT NULL,
  `home` int(10) unsigned NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `FK_imagem_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- Estrutura da tabela `incidentes`
--

CREATE TABLE IF NOT EXISTS `incidentes` (
  `id_incidente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_incidente` varchar(255) DEFAULT NULL,
  `descricao_incidente` text NOT NULL,
  `id_tipo_incidente` int(10) unsigned NOT NULL,
  `imagem_incidente` varchar(255) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `total_visualizacoes` int(10) unsigned NOT NULL DEFAULT '0',
  `total_confirmacoes_existencia` int(10) unsigned NOT NULL DEFAULT '0',
  `total_confirmacoes_resolvido` int(10) unsigned NOT NULL DEFAULT '0',
  `total_denuncias` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_incidente`),
  KEY `FK_tipo_incidente` (`id_tipo_incidente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Estrutura da tabela `perfis`
--

CREATE TABLE IF NOT EXISTS `perfis` (
  `id_perfil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `perfil` varchar(255) NOT NULL,
  `descricao_perfil` text NOT NULL,
  `slug_perfil` varchar(255) NOT NULL,
  `capa_perfil` varchar(255) NOT NULL,
  `id_cor` int(10) unsigned NOT NULL,
  `id_cor_intensidade` int(10) unsigned NOT NULL,
  `total_acessos_perfil` int(10) unsigned NOT NULL DEFAULT '0',
  `ordem` int(10) unsigned DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(20) NOT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `FK_cor_perfil` (`id_cor`),
  KEY `FK_cor_intensidade_perfil` (`id_cor_intensidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- Estrutura da tabela `perfis_categorias`
--

CREATE TABLE IF NOT EXISTS `perfis_categorias` (
  `id_perfis_categorias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_perfil` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_perfis_categorias`),
  KEY `FK_perfis_categorias1` (`id_perfil`),
  KEY `FK_perfis_categorias2` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

-- Estrutura da tabela `pevs`
--

CREATE TABLE IF NOT EXISTS `pevs` (
  `id_pev` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_pev` varchar(255) DEFAULT NULL,
  `descricao_pev` text NOT NULL,
  `id_tipo_pev` int(10) unsigned NOT NULL,
  `imagem_pev` varchar(255) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `total_visualizacoes` int(10) unsigned NOT NULL DEFAULT '0',
  `total_confirmacoes_funcionando` int(10) unsigned NOT NULL DEFAULT '0',
  `total_confirmacoes_fechou` int(10) unsigned NOT NULL DEFAULT '0',
  `total_denuncias` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pev`),
  KEY `FK_tipo_pev` (`id_tipo_pev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Estrutura da tabela `superusers`
--

CREATE TABLE IF NOT EXISTS `superusers` (
  `id_superuser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `superuser` varchar(255) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `criado_por` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `cadastrado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `superuser_tipo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_superuser`),
  KEY `fk_superuser` (`superuser_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- Estrutura da tabela `superusers_acessos`
--

CREATE TABLE IF NOT EXISTS `superusers_acessos` (
  `id_acesso_su` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acesso_su` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_superuser` int(10) unsigned NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`id_acesso_su`),
  KEY `fk_acesso_su` (`id_superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;
--
-- Estrutura da tabela `superusers_tipos`
--

CREATE TABLE IF NOT EXISTS `superusers_tipos` (
  `superuser_tipo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `nivel` int(10) NOT NULL,
  PRIMARY KEY (`superuser_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Estrutura da tabela `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `a_ordem` int(10) unsigned DEFAULT NULL,
  `a_usuario` varchar(20) NOT NULL,
  `a_adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Estrutura da tabela `tipos_contribuicoes`
--

CREATE TABLE IF NOT EXISTS `tipos_contribuicoes` (
  `id_tipo_contribuicao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_contribuicao` varchar(255) NOT NULL,
  `tipo_contribuicao_ordem` int(10) unsigned DEFAULT NULL,
  `tipo_contribuicao_publicado` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_contribuicao_usuario` varchar(20) NOT NULL,
  `tipo_contribuicao_adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_contribuicao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_incidentes`
--

CREATE TABLE IF NOT EXISTS `tipos_incidentes` (
  `id_tipo_incidente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_incidente` varchar(255) NOT NULL,
  `tipo_incidente_ordem` int(10) unsigned DEFAULT NULL,
  `tipo_incidente_publicado` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_incidente_usuario` varchar(20) NOT NULL,
  `tipo_incidente_adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_incidente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

INSERT INTO tipos_incidentes(tipo_incidente, tipo_incidente_usuario)
VALUES ('incidente', 'amoedo');


--
-- Estrutura da tabela `tipos_pevs`
--

CREATE TABLE IF NOT EXISTS `tipos_pevs` (
  `id_tipo_pev` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_pev` varchar(255) NOT NULL,
  `tipo_pev_ordem` int(10) unsigned DEFAULT NULL,
  `tipo_pev_publicado` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_pev_usuario` varchar(20) NOT NULL,
  `tipo_pev_adicionado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_pev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO tipos_pevs(tipo_pev, tipo_pev_usuario)
 VALUES('coleta seletiva', 'AMOEDO');
--
-- Estrutura da tabela `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `utilizado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  `codigo_verificacao` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `total_acessos` int(10) unsigned NOT NULL DEFAULT '0',
  `cadastrado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `usuario_tipo_id` int(10) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario` (`usuario_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;
--
-- Estrutura da tabela `usuarios_acessos`
--

CREATE TABLE IF NOT EXISTS `usuarios_acessos` (
  `id_acesso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(10) unsigned NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`id_acesso`),
  KEY `fk_acesso` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

-- Estrutura da tabela `usuarios_tipos`
--

CREATE TABLE IF NOT EXISTS `usuarios_tipos` (
  `usuario_tipo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `nivel` int(10) NOT NULL,
  PRIMARY KEY (`usuario_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Limitadores para a tabela `artigos_tags`
--
ALTER TABLE `artigos_tags`
  ADD CONSTRAINT `FK_artigos_tags1` FOREIGN KEY (`id_artigo`) REFERENCES `artigos` (`id_artigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_artigos_tags2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `artigo_arquivos`
--
ALTER TABLE `artigo_arquivos`
  ADD CONSTRAINT `FK_arquivo_artigo` FOREIGN KEY (`artigo`) REFERENCES `artigos` (`id_artigo`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `artigo_imagens`
--
ALTER TABLE `artigo_imagens`
  ADD CONSTRAINT `FK_imagem_artigo` FOREIGN KEY (`artigo`) REFERENCES `artigos` (`id_artigo`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `FK_cor_categoria` FOREIGN KEY (`id_cor`) REFERENCES `cores` (`id_cor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cor_intensidade_categoria` FOREIGN KEY (`id_cor_intensidade`) REFERENCES `cores_intensidades` (`id_cor_intensidade`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `categorias_artigos`
--
ALTER TABLE `categorias_artigos`
  ADD CONSTRAINT `FK_categorias_artigos1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_categorias_artigos2` FOREIGN KEY (`id_artigo`) REFERENCES `artigos` (`id_artigo`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `contribuicoes`
--
ALTER TABLE `contribuicoes`
  ADD CONSTRAINT `FK_tipo_contribuicao` FOREIGN KEY (`id_tipo_contribuicao`) REFERENCES `tipos_contribuicoes` (`id_tipo_contribuicao`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `home`
--
ALTER TABLE `home`
  ADD CONSTRAINT `FK_cor_home` FOREIGN KEY (`id_cor`) REFERENCES `cores` (`id_cor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cor_intensidade_home` FOREIGN KEY (`id_cor_intensidade`) REFERENCES `cores_intensidades` (`id_cor_intensidade`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `home_imagens`
--
ALTER TABLE `home_imagens`
  ADD CONSTRAINT `FK_imagem_home` FOREIGN KEY (`home`) REFERENCES `home` (`id_home`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `incidentes`
--
ALTER TABLE `incidentes`
  ADD CONSTRAINT `FK_tipo_incidente` FOREIGN KEY (`id_tipo_incidente`) REFERENCES `tipos_incidentes` (`id_tipo_incidente`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `perfis`
--
ALTER TABLE `perfis`
  ADD CONSTRAINT `FK_cor_intensidade_perfil` FOREIGN KEY (`id_cor_intensidade`) REFERENCES `cores_intensidades` (`id_cor_intensidade`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cor_perfil` FOREIGN KEY (`id_cor`) REFERENCES `cores` (`id_cor`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `perfis_categorias`
--
ALTER TABLE `perfis_categorias`
  ADD CONSTRAINT `FK_perfis_categorias1` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_perfis_categorias2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pevs`
--
ALTER TABLE `pevs`
  ADD CONSTRAINT `FK_tipo_pev` FOREIGN KEY (`id_tipo_pev`) REFERENCES `tipos_pevs` (`id_tipo_pev`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `superusers`
--
ALTER TABLE `superusers`
  ADD CONSTRAINT `fk_superuser` FOREIGN KEY (`superuser_tipo_id`) REFERENCES `superusers_tipos` (`superuser_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `superusers_acessos`
--
ALTER TABLE `superusers_acessos`
  ADD CONSTRAINT `fk_acesso_su` FOREIGN KEY (`id_superuser`) REFERENCES `superusers` (`id_superuser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_tipo_id`) REFERENCES `usuarios_tipos` (`usuario_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios_acessos`
--
ALTER TABLE `usuarios_acessos`
  ADD CONSTRAINT `fk_acesso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `usuarios_tipos` (`usuario_tipo_id`, `nome`, `nivel`) VALUES
(1, 'vip', 1),
(2, 'comum', 2);


