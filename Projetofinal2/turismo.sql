-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 09-Maio-2023 às 21:51
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `turismo`
--

CREATE DATABASE turismo;
USE turismo;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportes`
--

CREATE TABLE `transportes` (
  `cod_transporte` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `assentos` int(11) NOT NULL,
  `combustivel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `transportes`
--

INSERT INTO `transportes` (`cod_transporte`, `tipo`, `assentos`, `combustivel`) VALUES
(1, 'Ônibus', 45, 'Diesel'),
(2, 'Van', 30, 'Flex'),
(3, 'Avião', 100, 'Gasolina'),
(4, 'Carroça', 1, 'Cavalo'),
(5, 'Moto', 2, 'Flex'),
(6, 'Carro', 5, 'Flex'),
(7, 'Skate', 1, 'Diesel'),
(8, 'BalÃ£o', 4, 'GNV');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportes_viagens`
--

CREATE TABLE `transportes_viagens` (
  `cod_transporte_viagem` int(11) NOT NULL,
  `cod_transporte` int(11) NOT NULL,
  `cod_viagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `transportes_viagens`
--

INSERT INTO `transportes_viagens` (`cod_transporte_viagem`, `cod_transporte`, `cod_viagem`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 3, 3),
(6, 4, 3),
(7, 5, 3),
(8, 1, 4),
(9, 5, 4),
(10, 6, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `viagens`
--

CREATE TABLE `viagens` (
  `cod_viagem` int(11) NOT NULL,
  `local_partida` text NOT NULL,
  `local_destino` text NOT NULL,
  `data_viagem` date NOT NULL,
  `hora_saida` time DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `viagens`
--

INSERT INTO `viagens` (`cod_viagem`, `local_partida`, `local_destino`, `data_viagem`, `hora_saida`, `hora_chegada`) VALUES
(1, 'Porto Alegre', 'Recife', '2023-02-01', '09:00:00', '19:35:00'),
(2, 'Porto Alegre', 'Rio de Janeiro', '2023-01-05', '10:00:00', '15:00:00'),
(3, 'Porto Alegre', 'Amazônia', '2023-04-25', '01:30:00', '22:00:00'),
(4, 'Porto Alegre', 'Viamão', '2023-05-01', '00:00:00', '23:59:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `transportes`
--
ALTER TABLE `transportes`
  ADD PRIMARY KEY (`cod_transporte`);

--
-- Índices para tabela `transportes_viagens`
--
ALTER TABLE `transportes_viagens`
  ADD PRIMARY KEY (`cod_transporte_viagem`),
  ADD KEY `cod_transporte` (`cod_transporte`),
  ADD KEY `cod_viagem` (`cod_viagem`);

--
-- Índices para tabela `viagens`
--
ALTER TABLE `viagens`
  ADD PRIMARY KEY (`cod_viagem`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `transportes`
--
ALTER TABLE `transportes`
  MODIFY `cod_transporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `transportes_viagens`
--
ALTER TABLE `transportes_viagens`
  MODIFY `cod_transporte_viagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `viagens`
--
ALTER TABLE `viagens`
  MODIFY `cod_viagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `transportes_viagens`
--
ALTER TABLE `transportes_viagens`
  ADD CONSTRAINT `transportes_viagens_ibfk_1` FOREIGN KEY (`cod_transporte`) REFERENCES `transportes` (`cod_transporte`),
  ADD CONSTRAINT `transportes_viagens_ibfk_2` FOREIGN KEY (`cod_viagem`) REFERENCES `viagens` (`cod_viagem`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
