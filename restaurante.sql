CREATE DATABASE restaurante;
use restaurante;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurante`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `id_cardapio` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cardapio`
--

INSERT INTO `cardapio` (`id_cardapio`, `nome`, `tipo`) VALUES
(1, 'Lanche', 'lanche'),
(2, 'Bebida', 'bebida'),
(3, 'Combo', 'combo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio_produto`
--

CREATE TABLE `cardapio_produto` (
  `id_cardapioFK` int(11) DEFAULT NULL,
  `id_produtoFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `rua` varchar(30) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `numero` int(11) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `id_enderecoFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_pedido`
--

CREATE TABLE `funcionario_pedido` (
  `id_funcionarioFK` int(11) NOT NULL,
  `id_pedidoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `status_pagamento` varchar(20) NOT NULL,
  `numero_parcela` int(11) NOT NULL,
  `valor_parcela` decimal(5,2) NOT NULL,
  `id_pedidoFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `valor_Pedido` double NOT NULL,
  `numero_Mesa` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `id_pedidoFK` int(11) NOT NULL,
  `id_produtoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome_p` varchar(45) NOT NULL,
  `valor_p` decimal(5,2) NOT NULL,
  `descricao_p` varchar(500) NOT NULL,
  `foto_p` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_p`, `valor_p`, `descricao_p`, `foto_p`) VALUES
(1, 'Refrigerante Fanta 1,5L', '6.00', 'Refrigerante de laranja', 'assets/Expresso-Delivery_10bea64b80d31677828a1723d1bd065c.jpg'),
(2, 'Refrigerante Fanta Guaraná 1.5L', '5.50', 'Refrigerante de guaraná', 'assets/Expresso-Delivery_12bbef384d58de2789d71456d90e7973.jpg'),
(3, 'Refrigerante Sprite 1.5L', '7.00', 'Refrigerante de limão', 'assets/Expresso-Delivery_2808b351c161284331ef6736f138078d.jpg'),
(4, 'Refrigerante Coca Cola 1,5l', '8.00', 'Refrigerante de cola', 'assets/Expresso-Delivery_7f5ed1df30a43062cd9a8f61a28148fb.jpg'),
(5, 'Hamburguer Bacon Duplo', '25.90', 'Hamburguer feito especialmente <br/>para quem gosta de bacon em dobro que vai deixar seu hamburguer saboroso!', 'assets/Expresso-Delivery_9f0a112a57c9f1c8d9159cf34cafd573.png'),
(6, 'Hamburguer Cheedar Duplo', '26.90', 'Hamburguer feito especialmente  <br/>para quem gosta de cheedar em dobro que vai deixar seu hamburguer saboroso!', 'assets/Expresso-Delivery_a1455ddd2dff1ee61b1ce1e56cf05317.png'),
(7, 'Chikenburguer Cheedar', '21.90', 'Chikenburguer feito especialmente  <br/>para quem gosta de frango com cheedar!', 'assets/Expresso-Delivery_c5fd0c57eac60490f7c3b405a180c5ea.png'),
(8, 'Hamburguer Duplo', '28.90', 'Hamburguer feito especialmente  <br/>para quem está com aquela fome monstra, possui duas carnes!', 'assets/Expresso-Delivery_546c150581f3a84bbf39608b4ed37551.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`id_cardapio`);

--
-- Indexes for table `cardapio_produto`
--
ALTER TABLE `cardapio_produto`
  ADD KEY `id_cardapioFK` (`id_cardapioFK`),
  ADD KEY `id_produtoFK` (`id_produtoFK`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_enderecoFK` (`id_enderecoFK`);

--
-- Indexes for table `funcionario_pedido`
--
ALTER TABLE `funcionario_pedido`
  ADD PRIMARY KEY (`id_pedidoFK`,`id_funcionarioFK`),
  ADD KEY `id_funcionarioFK` (`id_funcionarioFK`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_pedidoFK` (`id_pedidoFK`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indexes for table `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`id_pedidoFK`,`id_produtoFK`),
  ADD KEY `id_produtoFK` (`id_produtoFK`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `id_cardapio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cardapio_produto`
--
ALTER TABLE `cardapio_produto`
  ADD CONSTRAINT `cardapio_produto_ibfk_1` FOREIGN KEY (`id_cardapioFK`) REFERENCES `cardapio` (`id_cardapio`),
  ADD CONSTRAINT `cardapio_produto_ibfk_2` FOREIGN KEY (`id_produtoFK`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_enderecoFK`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `funcionario_pedido`
--
ALTER TABLE `funcionario_pedido`
  ADD CONSTRAINT `funcionario_pedido_ibfk_1` FOREIGN KEY (`id_pedidoFK`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `funcionario_pedido_ibfk_2` FOREIGN KEY (`id_funcionarioFK`) REFERENCES `funcionario` (`id_funcionario`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedidoFK`) REFERENCES `pedido` (`id_pedido`);

--
-- Limitadores para a tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `pedido_produto_ibfk_1` FOREIGN KEY (`id_pedidoFK`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `pedido_produto_ibfk_2` FOREIGN KEY (`id_produtoFK`) REFERENCES `produto` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
