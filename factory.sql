-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 11 2020 г., 07:54
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `factory`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `rating` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`id`, `surname`, `name`, `patronymic`, `address`, `phone`, `rating`) VALUES
(1, 'Петров', 'Петр', 'Петрович', 'К.Маркса 12-1', '89090976567', 0),
(2, 'Иванов', 'Иван', 'Иванович', 'К.Маркса 81-12', '89090213567', 0),
(3, 'Стрельников', 'Никита', 'Владиславович', 'Ворошилова 31-21', '89092233467', 0),
(4, 'Крыжевников', 'Антон', 'Владимирович', 'Б.Ручьева 12-8', '89090223145', 0),
(5, 'Песоцкий', 'Станислав', 'Константинович', 'Ленина 123-23', '89090123997', 0),
(6, 'Омельченко', 'Светлана', 'Николаевна', 'Ленинградская 5-4', '89310213625', 0),
(7, 'Кожевникова', 'Александра', 'Викторовна', 'Вокзальная 66-6', '89191834567', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `furniture`
--

CREATE TABLE `furniture` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_f` varchar(45) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `prod_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `id_type` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `furniture`
--

INSERT INTO `furniture` (`id`, `name_f`, `qty`, `prod_date`, `price`, `id_type`) VALUES
(1, 'Компьютерный стул', 100, '2018-10-19', '1000.00', 5),
(2, 'Офисный стул', 120, '2019-09-29', '3500.00', 5),
(3, 'Обеденный стул', 2000, '2019-09-09', '1200.00', 5),
(4, 'Компьютерный стол', 240, '2018-04-14', '4020.00', 4),
(5, 'Обеденный стол', 1300, '2020-01-16', '2600.00', 4),
(6, 'Офисный стол', 155, '2019-08-05', '4500.00', 4),
(7, 'Кровать Аскона', 320, '2020-02-17', '23000.00', 6),
(8, 'Детская кровать', 430, '2019-08-09', '15000.00', 6),
(9, 'Железная дверь', 250, '2020-01-01', '30450.00', 3),
(10, 'Детская тумба', 300, '2019-08-08', '3600.00', 1),
(11, 'Пенал', 410, '2019-04-04', '5600.00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ddata` date DEFAULT NULL,
  `id_staff` bigint(20) UNSIGNED NOT NULL,
  `id_cust` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `ddata`, `id_staff`, `id_cust`) VALUES
(1, '2019-02-17', 3, 6),
(2, '2019-11-16', 4, 1),
(3, '2019-12-14', 5, 5),
(4, '2019-09-08', 4, 2),
(5, '2019-10-11', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `id_orders` bigint(20) UNSIGNED NOT NULL,
  `id_furniture` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `qty`, `id_orders`, `id_furniture`) VALUES
(1, 4, 5, 3),
(2, 1, 3, 8),
(3, 2, 4, 11),
(4, 1, 1, 2),
(5, 1, 2, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `description`) VALUES
('Администратор', 'Администрирование сайта');

-- --------------------------------------------------------

--
-- Структура таблицы `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `age` date DEFAULT NULL,
  `gender` enum('Мужской','Женский') DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `pas_data` varchar(45) DEFAULT NULL,
  `password` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `staff`
--

INSERT INTO `staff` (`id`, `surname`, `name`, `patronymic`, `age`, `gender`, `address`, `phone`, `pas_data`, `password`) VALUES
(1, 'Степаненков', 'Николай', 'Евгеньевич', '0000-00-00', 'Мужской', 'Ворошилова 32-22', '89023456783', '1234-123456', '8492662bdac3cfaecadc11db93e025bd'),
(2, 'Андрюшин', 'Павел', 'Викторович', '1962-04-01', 'Мужской', 'Ленина 31-52', '89023456873', '1264-123457', NULL),
(3, 'Валина', 'Рената', 'Каримовна', '1992-12-19', 'Женский', 'Ленинградская 18-15', '89093456783', '4334-122156', NULL),
(4, 'Просёлова', 'Анна', 'Евгеньевна', '1990-08-20', 'Женский', 'Московская 13-10', '89029326783', '9424-624456', NULL),
(5, 'Линяев', 'Михаил', 'Андреевич', '1978-11-24', 'Мужской', 'К.Маркса 134-57', '89023456545', '7564-123121', NULL),
(6, 'Нестеров', 'Олег', 'Александрович', '1981-05-20', 'Мужской', 'Ворошилова 15-92', '89029083454', '1542-622456', NULL),
(8, '', '', '', '0000-00-00', '', '', '', '', NULL),
(9, 'Васильев', 'Леонид', 'Викторович', '2008-02-20', 'Мужской', 'Ручьева 10-52', '89238722342', '2423-567635', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `type_f`
--

CREATE TABLE `type_f` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_f`
--

INSERT INTO `type_f` (`id`, `name_type`) VALUES
(1, 'Тумба'),
(2, 'Шкаф'),
(3, 'Дверь'),
(4, 'Стол'),
(5, 'Стул'),
(6, 'Кровать');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_staff` (`id_staff`),
  ADD KEY `id_cust` (`id_cust`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_orders` (`id_orders`),
  ADD KEY `id_furniture` (`id_furniture`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `type_f`
--
ALTER TABLE `type_f`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `type_f`
--
ALTER TABLE `type_f`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `furniture`
--
ALTER TABLE `furniture`
  ADD CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_f` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_cust`) REFERENCES `customer` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`id_furniture`) REFERENCES `furniture` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
