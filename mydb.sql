-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 26 2022 г., 14:00
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`) VALUES
(1, 'Рубашки', 'Раздел с рубашками'),
(2, 'Футболки', 'Раздел с футболками');

-- --------------------------------------------------------

--
-- Структура таблицы `category_has_product`
--

CREATE TABLE `category_has_product` (
  `category_id` int NOT NULL,
  `idproduct` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category_has_product`
--

INSERT INTO `category_has_product` (`category_id`, `idproduct`) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `idimage` int NOT NULL,
  `image` char(45) DEFAULT NULL,
  `alt` varchar(45) DEFAULT NULL COMMENT 'База хранит изображения товаров, '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`idimage`, `image`, `alt`) VALUES
(1, '1.png', 'Однотонная рубашка с коротким рукавом'),
(2, '2.png', 'Базовая рубашка'),
(3, '3.png', 'Рубашка изо льна'),
(4, '4.png', 'Рубашка из хлопка и льна'),
(5, '5.png', 'Рубашка-футболка из трикотажного полотна'),
(6, '6.png', 'Футболка с принтом'),
(7, '7.png', 'Базовая футболка'),
(8, '8.png', 'Базовая футболка с двухслойной отделкой'),
(9, '9.png', 'Футболка с V-вырезом'),
(10, '10.png', 'Футболка с морским принтом'),
(11, '11.png', 'Футболка с морским принтом');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `idproduct` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount_price` int DEFAULT NULL,
  `promo_price` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `activity` tinyint(1) NOT NULL,
  `main_image` int NOT NULL,
  `main_category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`idproduct`, `title`, `price`, `discount_price`, `promo_price`, `description`, `activity`, `main_image`, `main_category`) VALUES
(1, 'Однотонная рубашка с коротким рукавом', 1223, 1000, 2555, 'Однотонная рубашка', 1, 1, 1),
(2, 'Базовая рубашка', 1299, 988, 2999, 'Базовая рубашка', 1, 2, 1),
(3, 'Рубашка изо льна', 799, 599, 1299, 'Рубашка изо льна', 0, 3, 1),
(4, 'Рубашка из хлопка и льна', 1299, 1199, 2500, 'Рубашка из хлопка и льна', 1, 4, 1),
(5, 'Рубашка-футболка из трикотажного полотна', 1299, 999, 3499, 'Рубашка-жакет из трикотажного полотна', 1, 5, 1),
(6, 'Футболка с принтом', 599, 499, 1299, 'Футболка с принтом рыбы', 0, 6, 2),
(7, 'Базовая футболка', 1299, 999, 1599, 'Базовая футболка с двухслойной отделкой', 1, 7, 2),
(8, 'Базовая футболка с двухслойной отделкой', 499, 555, 1499, 'Базовая футболка с двухслойной отделкой', 1, 8, 2),
(9, 'Футболка с V-вырезом', 1699, 1299, 1999, 'Футболка с V-вырезом', 1, 9, 2),
(10, 'Футболка с морским принтом ', 399, 299, 699, 'Футболка с морским принтом', 1, 10, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `product_has_image`
--

CREATE TABLE `product_has_image` (
  `idproduct` int NOT NULL,
  `idimage` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product_has_image`
--

INSERT INTO `product_has_image` (`idproduct`, `idimage`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(10, 11);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_id_UNIQUE` (`category_id`);

--
-- Индексы таблицы `category_has_product`
--
ALTER TABLE `category_has_product`
  ADD PRIMARY KEY (`category_id`,`idproduct`),
  ADD KEY `fk_category_has_product_product1` (`idproduct`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`idimage`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `fk_product_image1` (`main_image`),
  ADD KEY `fk_product_category1` (`main_category`);

--
-- Индексы таблицы `product_has_image`
--
ALTER TABLE `product_has_image`
  ADD PRIMARY KEY (`idproduct`,`idimage`),
  ADD KEY `fk_product_has_image_image1` (`idimage`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_has_product`
--
ALTER TABLE `category_has_product`
  ADD CONSTRAINT `fk_category_has_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_category_has_product_product1` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category1` FOREIGN KEY (`main_category`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_product_image1` FOREIGN KEY (`main_image`) REFERENCES `image` (`idimage`);

--
-- Ограничения внешнего ключа таблицы `product_has_image`
--
ALTER TABLE `product_has_image`
  ADD CONSTRAINT `fk_product_has_image_image1` FOREIGN KEY (`idimage`) REFERENCES `image` (`idimage`),
  ADD CONSTRAINT `fk_product_has_image_product1` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
