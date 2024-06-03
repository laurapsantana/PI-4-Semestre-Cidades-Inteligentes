-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2024 às 21:26
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_bueiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bueiro`
--

CREATE TABLE `tb_bueiro` (
  `id` int(50) NOT NULL,
  `numero_bueiro` int(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `rua` varchar(20) NOT NULL,
  `bairro` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `profundidade` double NOT NULL,
  `data_instalacao` datetime(6) NOT NULL,
  `id_sensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tb_bueiro`
--

INSERT INTO `tb_bueiro` (`id`, `numero_bueiro`, `descricao`, `rua`, `bairro`, `estado`, `cidade`, `latitude`, `longitude`, `profundidade`, `data_instalacao`, `id_sensor`) VALUES
(1, 1, '', 'rua china', 'cubatão', 'SP', 'Itapira', -22.432430921195067, -46.81233394903086, 2, '2024-05-01 00:00:00.000000', 1),
(2, 2, '', 'rua jose bonifacio', 'centro', 'SP', 'Itapira', -22.439346411657628, -46.825994878029384, 2, '2024-05-01 00:00:00.000000', 2),
(3, 3, '', 'rua minas gerais', 'cubatão', 'SP', 'Itapira', -22.43021531692228, -46.816220237384435, 2, '2024-05-01 00:00:00.000000', 3),
(4, 3, '', 'Doa bobos', 'Zeca', 'São Paulo', 'Itapira', 3232154654, 411444564565, 5, '2024-05-24 16:33:00.000000', 6),
(5, 5, '', 'Rua Batista Júnior', 'Santa Cruz', 'SP', 'Itapira', 654156465464, 4646444463599, 2, '2024-05-27 00:00:00.000000', 2),
(6, 5, '', 'Rua Batista Júnior', 'Santa Cruz', 'SP', 'Itapira', 654156465464, 4646444463599, 2, '2024-05-27 00:00:00.000000', 2),
(7, 6, '', 'Rua São José', 'Santa Cruz', 'SP', 'Itapira', 6546548778784, 545789789464, 2, '2024-05-29 00:00:00.000000', 2),
(8, 6, '', 'Rua São José', 'Santa Cruz', 'SP', 'Itapira', 21346546541, 4478787545544, 2, '2024-05-10 00:00:00.000000', 3),
(9, 6, '', 'Rua São José', 'Santa Cruz', 'SP', 'Itapira', 21346546541, 4478787545544, 2, '2024-05-10 00:00:00.000000', 3),
(10, 7, '', 'Rua Bento da Rocha', 'Centro', 'SP', 'Itapira', -22.43631, -46.82328, 2, '2024-05-26 00:00:00.000000', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_manutencao`
--

CREATE TABLE `tb_manutencao` (
  `id` int(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `id_bueiro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_medicao`
--

CREATE TABLE `tb_medicao` (
  `id` int(50) NOT NULL,
  `nivel_bueiro` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `id_bueiro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tb_medicao`
--

INSERT INTO `tb_medicao` (`id`, `nivel_bueiro`, `date_time`, `id_sensor`, `id_bueiro`) VALUES
(1, '2', '2024-05-01 00:00:00', 1, 1),
(2, '1', '2024-05-21 00:00:00', 1, 1),
(3, '0', '2024-05-02 00:00:00', 2, 2),
(4, '1.5', '2024-05-21 00:00:00', 2, 2),
(5, '1', '2024-05-03 00:00:00', 3, 3),
(6, '0', '2024-05-21 00:00:00', 3, 3),
(7, '2', '2024-05-21 01:00:00', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_sensor`
--

CREATE TABLE `tb_sensor` (
  `id` int(50) NOT NULL,
  `ativo` varchar(10) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tb_sensor`
--

INSERT INTO `tb_sensor` (`id`, `ativo`, `descricao`) VALUES
(1, 'S', 'Sensor 1'),
(2, 'S', 'Sensor 2'),
(3, 'S', 'Sensor 3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id`, `usuario`, `senha`) VALUES
(1, 'lauradmin@admin.com', '$2y$10$BYsRY5B3t9fgjCVRVaTzC.PmFcpm6lykoc4RLoUNM.kjKMVdHSm6u'),
(2, 'lauradmin@admin.com', '$2y$10$z1Z1.OgvhK8SY5M2e32H.O99VVBioG2Ni3YOfrZW0oGPZ5Nyi9ggO'),
(3, 'admin@admin.com', '$2y$10$bqqJf0j3Cjmu6HXja4LwNeI0UXzyH8HR7GO1lYnE2SXlnaXvxFqJC');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_bueiro`
--
ALTER TABLE `tb_bueiro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_manutencao`
--
ALTER TABLE `tb_manutencao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_medicao`
--
ALTER TABLE `tb_medicao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_sensor`
--
ALTER TABLE `tb_sensor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_bueiro`
--
ALTER TABLE `tb_bueiro`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_manutencao`
--
ALTER TABLE `tb_manutencao`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_medicao`
--
ALTER TABLE `tb_medicao`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_sensor`
--
ALTER TABLE `tb_sensor`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
