-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2026 a las 12:01:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `casinogg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260420102706', '2026-04-20 12:28:30', 742);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `activo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;N;i:1;N;i:2;s:249:\\\"<p>Haz clic aquí para verificar tu cuenta: <a href=\\\"http://localhost:8000/verify/bfc7aa89e692d08d290ae81ba3dd6139c4852faed993df123843ff6d26e6ed9b\\\">http://localhost:8000/verify/bfc7aa89e692d08d290ae81ba3dd6139c4852faed993df123843ff6d26e6ed9b</a></p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:19:\\\"casinogg@casino.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"mario1@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:29:\\\"Verifica tu cuenta - CasinoGG\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-04-20 12:20:54', '2026-04-20 12:20:54', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;N;i:1;N;i:2;s:249:\\\"<p>Haz clic aquí para verificar tu cuenta: <a href=\\\"http://localhost:8000/verify/43fad0fc2afa23f03ffd2ddc5b3bfd0fa9e003e1181e983600dd9fdf642bd982\\\">http://localhost:8000/verify/43fad0fc2afa23f03ffd2ddc5b3bfd0fa9e003e1181e983600dd9fdf642bd982</a></p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:19:\\\"casinogg@casino.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"mario2@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:29:\\\"Verifica tu cuenta - CasinoGG\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-04-20 12:25:54', '2026-04-20 12:25:54', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:5:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}s:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\";a:1:{i:0;O:57:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\\":1:{s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\TransportMessageIdStamp\\0id\\\";i:1;}}s:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\";a:1:{i:0;O:51:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\\":4:{s:67:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionClass\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:66:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionCode\\\";i:0;s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0exceptionMessage\\\";s:391:\\\"Connection could not be established with host \\\"sandbox.smtp.mailtrap.io:2525\\\": stream_socket_client(): Unable to connect to sandbox.smtp.mailtrap.io:2525 (Se produjo un error durante el intento de conexión ya que la parte conectada no respondió adecuadamente tras un periodo de tiempo, o bien se produjo un error en la conexión establecida ya que el host conectado no ha podido responder)\\\";s:69:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\ErrorDetailsStamp\\0flattenException\\\";O:57:\\\"Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\\":12:{s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0message\\\";s:391:\\\"Connection could not be established with host \\\"sandbox.smtp.mailtrap.io:2525\\\": stream_socket_client(): Unable to connect to sandbox.smtp.mailtrap.io:2525 (Se produjo un error durante el intento de conexión ya que la parte conectada no respondió adecuadamente tras un periodo de tiempo, o bien se produjo un error en la conexión establecida ya que el host conectado no ha podido responder)\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0code\\\";i:0;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0previous\\\";N;s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0trace\\\";a:1:{i:0;a:8:{s:9:\\\"namespace\\\";s:0:\\\"\\\";s:11:\\\"short_class\\\";s:0:\\\"\\\";s:5:\\\"class\\\";s:0:\\\"\\\";s:4:\\\"type\\\";s:0:\\\"\\\";s:8:\\\"function\\\";s:0:\\\"\\\";s:4:\\\"file\\\";s:84:\\\"C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:4:\\\"line\\\";i:154;s:4:\\\"args\\\";a:0:{}}}s:72:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0traceAsString\\\";s:7135:\\\"#0 [internal function]: Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\{closure}(2, \\\'stream_socket_c...\\\', \\\'C:\\\\\\\\Users\\\\\\\\mario\\\\\\\\...\\\', 157)\n#1 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php(157): stream_socket_client(\\\'sandbox.smtp.ma...\\\', 0, \\\'\\\', 60.0, 4, Resource id #946)\n#2 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(268): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream->initialize()\n#3 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(200): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->start()\n#4 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\AbstractTransport.php(90): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->doSend(Object(Symfony\\\\Component\\\\Mailer\\\\SentMessage))\n#5 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\SmtpTransport.php(138): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\AbstractTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), Object(Symfony\\\\Component\\\\Mailer\\\\DelayedEnvelope))\n#6 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Transports.php(51): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Smtp\\\\SmtpTransport->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#7 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Messenger\\\\MessageHandler.php(29): Symfony\\\\Component\\\\Mailer\\\\Transport\\\\Transports->send(Object(Symfony\\\\Component\\\\Mime\\\\Email), NULL)\n#8 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(148): Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\MessageHandler->__invoke(Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage))\n#9 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\HandleMessageMiddleware.php(90): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->callHandler(Object(Closure), Object(Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage), NULL, NULL)\n#10 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\SendMessageMiddleware.php(75): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\HandleMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#11 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware.php(34): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\SendMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#12 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware.php(68): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\FailedMessageProcessingMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#13 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware.php(41): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\DispatchAfterCurrentBusMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#14 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddBusNameStampMiddleware.php(35): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\RejectRedeliveredMessageMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#15 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\AddDefaultStampsMiddleware.php(33): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddBusNameStampMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#16 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Middleware\\\\TraceableMiddleware.php(36): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\AddDefaultStampsMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#17 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\MessageBus.php(69): Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableMiddleware->handle(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Object(Symfony\\\\Component\\\\Messenger\\\\Middleware\\\\TraceableStack))\n#18 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\TraceableMessageBus.php(30): Symfony\\\\Component\\\\Messenger\\\\MessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#19 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\RoutableMessageBus.php(51): Symfony\\\\Component\\\\Messenger\\\\TraceableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), Array)\n#20 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(169): Symfony\\\\Component\\\\Messenger\\\\RoutableMessageBus->dispatch(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope))\n#21 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Worker.php(118): Symfony\\\\Component\\\\Messenger\\\\Worker->handleMessage(Object(Symfony\\\\Component\\\\Messenger\\\\Envelope), \\\'async\\\')\n#22 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\messenger\\\\Command\\\\ConsumeMessagesCommand.php(283): Symfony\\\\Component\\\\Messenger\\\\Worker->run(Array)\n#23 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\console\\\\Command\\\\Command.php(341): Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand->execute(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#24 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\console\\\\Application.php(1117): Symfony\\\\Component\\\\Console\\\\Command\\\\Command->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#25 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(123): Symfony\\\\Component\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#26 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\console\\\\Application.php(356): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRunCommand(Object(Symfony\\\\Component\\\\Messenger\\\\Command\\\\ConsumeMessagesCommand), Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#27 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\framework-bundle\\\\Console\\\\Application.php(77): Symfony\\\\Component\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#28 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\console\\\\Application.php(195): Symfony\\\\Bundle\\\\FrameworkBundle\\\\Console\\\\Application->doRun(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#29 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner.php(49): Symfony\\\\Component\\\\Console\\\\Application->run(Object(Symfony\\\\Component\\\\Console\\\\Input\\\\ArgvInput), Object(Symfony\\\\Component\\\\Console\\\\Output\\\\ConsoleOutput))\n#30 C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\autoload_runtime.php(32): Symfony\\\\Component\\\\Runtime\\\\Runner\\\\Symfony\\\\ConsoleApplicationRunner->run()\n#31 C:\\\\Users\\\\mario\\\\CasinoGG\\\\bin\\\\console(15): require_once(\\\'C:\\\\\\\\Users\\\\\\\\mario\\\\\\\\...\\\')\n#32 {main}\\\";s:64:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0class\\\";s:53:\\\"Symfony\\\\Component\\\\Mailer\\\\Exception\\\\TransportException\\\";s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusCode\\\";i:500;s:69:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0statusText\\\";s:21:\\\"Internal Server Error\\\";s:66:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0headers\\\";a:0:{}s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0file\\\";s:84:\\\"C:\\\\Users\\\\mario\\\\CasinoGG\\\\vendor\\\\symfony\\\\mailer\\\\Transport\\\\Smtp\\\\Stream\\\\SocketStream.php\\\";s:63:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0line\\\";i:154;s:67:\\\"\\0Symfony\\\\Component\\\\ErrorHandler\\\\Exception\\\\FlattenException\\0asString\\\";N;}}}s:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\";a:1:{i:0;O:44:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\\":1:{s:51:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\DelayStamp\\0delay\\\";i:1083;}}s:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\";a:1:{i:0;O:49:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\\":2:{s:64:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0redeliveredAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2026-04-23 10:45:49.941698\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:61:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\RedeliveryStamp\\0retryCount\\\";i:1;}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;N;i:1;N;i:2;s:249:\\\"<p>Haz clic aquí para verificar tu cuenta: <a href=\\\"http://localhost:8000/verify/da869107141a70618f353302a90eec03c584742dd48aa7360eb0579778de7dbc\\\">http://localhost:8000/verify/da869107141a70618f353302a90eec03c584742dd48aa7360eb0579778de7dbc</a></p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:19:\\\"casinogg@casino.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"mario@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:29:\\\"Verifica tu cuenta - CasinoGG\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-04-23 08:45:49', '2026-04-23 08:45:50', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `id` int(11) NOT NULL,
  `cantidad_apostada` decimal(10,2) NOT NULL,
  `resultado_obtenido` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id`, `tipo`, `cantidad`, `fecha`, `descripcion`, `user_id`) VALUES
(1, 'bono', 1500.00, '2026-04-20 14:16:12', 'Bono bienvenida + newsletter (1500€)', 1),
(2, 'bono', 1500.00, '2026-04-20 14:20:54', 'Bono bienvenida + newsletter (1500€)', 2),
(3, 'bono', 1500.00, '2026-04-20 14:25:54', 'Bono bienvenida + newsletter (1500€)', 3),
(4, 'bono', 1500.00, '2026-04-23 10:48:56', 'Bono bienvenida + newsletter (1500€)', 4),
(5, 'bono', 1500.00, '2026-04-23 11:01:04', 'Bono bienvenida + newsletter (1500€)', 5),
(6, 'bono', 1500.00, '2026-04-23 11:02:13', 'Bono bienvenida + newsletter (1500€)', 6),
(7, 'bono', 1500.00, '2026-04-23 11:03:24', 'Bono bienvenida + newsletter (1500€)', 7),
(8, 'bono', 1500.00, '2026-04-23 11:15:07', 'Bono bienvenida + newsletter (1500€)', 8),
(9, 'bono', 1500.00, '2026-04-23 11:24:00', 'Bono bienvenida + newsletter (1500€)', 9),
(10, 'bono', 1500.00, '2026-04-23 11:29:53', 'Bono bienvenida + newsletter (1500€)', 10),
(11, 'bono', 1500.00, '2026-04-23 11:33:36', 'Bono bienvenida + newsletter (1500€)', 11),
(12, 'bono', 1500.00, '2026-04-23 11:39:13', 'Bono bienvenida + newsletter (1500€)', 12),
(13, 'bono', 1500.00, '2026-04-23 11:46:28', 'Bono bienvenida + newsletter (1500€)', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `estado_verificacion` varchar(20) NOT NULL,
  `newsletter` tinyint(4) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `verification_token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`, `estado_verificacion`, `newsletter`, `saldo`, `verification_token`) VALUES
(1, 'mario@gmail.com', '$2y$13$SWJq7lqX5u.bt/XNou7E0OQGHRThaZ8VSgLQv/N0PEdauZeU8e4bC', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'da869107141a70618f353302a90eec03c584742dd48aa7360eb0579778de7dbc'),
(2, 'mario1@gmail.com', '$2y$13$3tgoNKJVvSViTH5PVRm1OO/avXv1vs89Tc68A3cPua1PEY6MIURhS', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'bfc7aa89e692d08d290ae81ba3dd6139c4852faed993df123843ff6d26e6ed9b'),
(3, 'mario2@gmail.com', '$2y$13$xQAlG2jcQrvyquUqmVLbXeKdsxTplkaiP9jZHJ6wThLniV2CHeN86', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '43fad0fc2afa23f03ffd2ddc5b3bfd0fa9e003e1181e983600dd9fdf642bd982'),
(4, 'mario3@gmail.com', '$2y$13$l/Hw8icmGoyKX35RXkU3teZEfZCq5bUATCM8asyuM2Vt8G.Vd0qpe', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '72b0ea9a3dbaa8efa9a4bdcc8b4ab9f1230ed3d272ca1af15ceb38ed02d238b7'),
(5, 'mario4@gmail.com', '$2y$13$XsV282scnKwIh89r7W1O9eT2hwrj/Bm2uMQR/LxSgLvi6Y5.WNXRS', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '8581d24e9833cef57e25ed795f07b26fdeaeed281b1108ba4c471c263f99dd2d'),
(6, 'mario5@gmail.com', '$2y$13$wOVv6n.H/sf7k3axQbEAwOXXzhVdcKa55cQ593PuW5ovNgC9agMM2', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'a41597843b5c9046e636cf79801b6144d6c05583e0fe9fbb25230f356081b06a'),
(7, 'mario6@gmail.com', '$2y$13$Wx.fhldDznNAU0L/FBTveu748wy6DbvEx9g3eDPf50UMCC7tulfq6', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '44b7dbb5ae470273077c608a22d68ddff86e9cb375a3c3d9bc3182132ffcf329'),
(8, 'mario7@gmail.com', '$2y$13$y9eco0FT2lj7.bef5NEE3OGcpp.5Onc/x8hxjh1BLxGmdLXaGPrmm', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'a0715a3c1c93a190fde234f413904c056c8adea4a238e4c974f7f2f834beea07'),
(9, 'mario8@gmail.com', '$2y$13$rYTWtmXV53uJ4yjWqHP3ie/FpZmZmqpaTpe0v84xasZw5P5xAfzWe', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'a9dc78f9618f0eeeced93a91791749872bb39cbc9db0d8768fc53e2efd7a1167'),
(10, 'mario9@gmail.com', '$2y$13$LwzXl/5DViQykwyMZiDSGOED8JNhASlJjFvK2W32oEbQ4KuvA63Cq', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '057032da285e3a5b4e1226df7b30112f55bbf95c94ec927c9fbba5cef5a2c9db'),
(11, 'mario10@gmail.com', '$2y$13$nSuH4d7.xbKcmhqiFFG1lugzivUepT4YYDDUG8.A0Cbd7V26tqLy.', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, '45d125f1475208db245351e181b342ce0e1788c9ea508ef81e08e10fdae316a9'),
(12, 'mario11@gmail.com', '$2y$13$ZBTvJf6arOjB.IFBLfyYLuxPEmTMOdJB8lSHOJQtN7M1XfaLn9xGa', '[\"ROLE_USER\"]', 'pendiente', 1, 1500.00, 'a8a115c0e4cddefe215f3e9d1251b4d651cd10b7d1d470aded3f95f0c91745bb'),
(13, 'mario21@gmail.com', '$2y$13$5O1FwTFu57AJkozbHFcpeOewEPiqb8aVsUyL1I.mo.GoL.yJAdVK.', '[\"ROLE_USER\"]', 'verificado', 1, 1500.00, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A9C1580CA76ED395` (`user_id`),
  ADD KEY `IDX_A9C1580C13375255` (`juego_id`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BFF96AF7A76ED395` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `FK_A9C1580C13375255` FOREIGN KEY (`juego_id`) REFERENCES `juego` (`id`),
  ADD CONSTRAINT `FK_A9C1580CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `FK_BFF96AF7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
