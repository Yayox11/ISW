-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2018 a las 05:10:12
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add materiales', 1, 'add_materiales'),
(2, 'Can change materiales', 1, 'change_materiales'),
(3, 'Can delete materiales', 1, 'delete_materiales'),
(4, 'Can add material solicitado', 2, 'add_materialsolicitado'),
(5, 'Can change material solicitado', 2, 'change_materialsolicitado'),
(6, 'Can delete material solicitado', 2, 'delete_materialsolicitado'),
(7, 'Can add obra', 3, 'add_obra'),
(8, 'Can change obra', 3, 'change_obra'),
(9, 'Can delete obra', 3, 'delete_obra'),
(10, 'Can add orden compra', 4, 'add_ordencompra'),
(11, 'Can change orden compra', 4, 'change_ordencompra'),
(12, 'Can delete orden compra', 4, 'delete_ordencompra'),
(13, 'Can add solicitud material', 5, 'add_solicitudmaterial'),
(14, 'Can change solicitud material', 5, 'change_solicitudmaterial'),
(15, 'Can delete solicitud material', 5, 'delete_solicitudmaterial'),
(16, 'Can add user', 6, 'add_myuser'),
(17, 'Can change user', 6, 'change_myuser'),
(18, 'Can delete user', 6, 'delete_myuser'),
(19, 'Can add bodeguero', 7, 'add_bodeguero'),
(20, 'Can change bodeguero', 7, 'change_bodeguero'),
(21, 'Can delete bodeguero', 7, 'delete_bodeguero'),
(22, 'Can add encargado compras', 8, 'add_encargadocompras'),
(23, 'Can change encargado compras', 8, 'change_encargadocompras'),
(24, 'Can delete encargado compras', 8, 'delete_encargadocompras'),
(25, 'Can add trabajador obra', 9, 'add_trabajadorobra'),
(26, 'Can change trabajador obra', 9, 'change_trabajadorobra'),
(27, 'Can delete trabajador obra', 9, 'delete_trabajadorobra'),
(28, 'Can add log entry', 10, 'add_logentry'),
(29, 'Can change log entry', 10, 'change_logentry'),
(30, 'Can delete log entry', 10, 'delete_logentry'),
(31, 'Can add permission', 11, 'add_permission'),
(32, 'Can change permission', 11, 'change_permission'),
(33, 'Can delete permission', 11, 'delete_permission'),
(34, 'Can add group', 12, 'add_group'),
(35, 'Can change group', 12, 'change_group'),
(36, 'Can delete group', 12, 'delete_group'),
(37, 'Can add content type', 13, 'add_contenttype'),
(38, 'Can change content type', 13, 'change_contenttype'),
(39, 'Can delete content type', 13, 'delete_contenttype'),
(40, 'Can add session', 14, 'add_session'),
(41, 'Can change session', 14, 'change_session'),
(42, 'Can delete session', 14, 'delete_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-06-20 23:35:43.459046', '2', 'bodega1@gpi.cl', 1, '[{\"added\": {}}]', 6, 1),
(2, '2018-06-20 23:36:14.402486', '3', 'trabajador1@gpi.cl', 1, '[{\"added\": {}}]', 6, 1),
(3, '2018-06-20 23:36:21.338439', '3', 'TrabajadorObra object (3)', 1, '[{\"added\": {}}]', 9, 1),
(4, '2018-06-20 23:36:48.826596', '2', 'Bodeguero object (2)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2018-06-20 23:36:59.656376', '1', 'Obra 1', 1, '[{\"added\": {}}]', 3, 1),
(6, '2018-06-20 23:37:52.443191', '1', 'hola@gpi.cl', 2, '[{\"changed\": {\"fields\": [\"is_bodeguero\", \"is_encargado_compras\", \"is_trabajador_obra\"]}}]', 6, 1),
(7, '2018-06-20 23:38:11.054722', '1', 'TrabajadorObra object (1)', 1, '[{\"added\": {}}]', 9, 1),
(8, '2018-06-28 04:06:12.382470', '2', 'bodega1@gpi.cl', 2, '[{\"changed\": {\"fields\": [\"is_bodeguero\"]}}]', 6, 1),
(9, '2018-06-28 04:06:28.361823', '2', 'bodega1@gpi.cl', 2, '[]', 6, 1),
(10, '2018-06-28 06:23:22.019935', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(11, '2018-06-28 06:52:57.043293', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(12, '2018-06-28 06:56:56.843563', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(13, '2018-06-28 06:57:56.493746', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(14, '2018-06-28 07:01:25.451154', '2', 'Obra 2', 1, '[{\"added\": {}}]', 3, 1),
(15, '2018-06-28 07:01:58.893677', '2', 'SolicitudMaterial object (2)', 1, '[{\"added\": {}}]', 5, 1),
(16, '2018-06-28 23:03:45.868880', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\", \"fecha_requerida\"]}}]', 5, 1),
(17, '2018-06-28 23:04:00.601508', '2', 'SolicitudMaterial object (2)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(18, '2018-06-28 23:04:17.696263', '3', 'SolicitudMaterial object (3)', 1, '[{\"added\": {}}]', 5, 1),
(19, '2018-06-28 23:11:10.003317', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(20, '2018-06-28 23:11:26.891936', '2', 'SolicitudMaterial object (2)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(21, '2018-06-28 23:11:36.619346', '3', 'SolicitudMaterial object (3)', 2, '[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]', 5, 1),
(22, '2018-07-12 16:41:58.787758', '1', 'SolicitudMaterial object (1)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(23, '2018-07-12 16:42:13.778866', '2', 'SolicitudMaterial object (2)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(24, '2018-07-12 16:42:19.453916', '3', 'SolicitudMaterial object (3)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(25, '2018-07-12 16:43:22.630660', '1', 'SolicitudMaterial object (1)', 2, '[]', 5, 1),
(26, '2018-07-12 16:43:43.479804', '2', 'SolicitudMaterial object (2)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(27, '2018-07-12 16:43:51.114748', '1', 'SolicitudMaterial object (1)', 2, '[]', 5, 1),
(28, '2018-07-12 16:43:57.555691', '2', 'SolicitudMaterial object (2)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(29, '2018-07-12 16:44:07.607182', '3', 'SolicitudMaterial object (3)', 2, '[]', 5, 1),
(30, '2018-07-12 16:45:54.624839', '3', 'trabajador1@gpi.cl', 2, '[]', 9, 1),
(31, '2018-07-12 16:46:11.360390', '3', 'trabajador1@gpi.cl', 2, '[{\"changed\": {\"fields\": [\"is_trabajador_obra\"]}}]', 6, 1),
(32, '2018-07-21 07:54:28.625145', '6', 'SolicitudMaterial object (6)', 3, '', 5, 1),
(33, '2018-07-21 07:54:31.885620', '5', 'SolicitudMaterial object (5)', 3, '', 5, 1),
(34, '2018-07-21 07:54:35.238678', '4', 'SolicitudMaterial object (4)', 3, '', 5, 1),
(35, '2018-07-21 07:54:38.080493', '3', 'SolicitudMaterial object (3)', 3, '', 5, 1),
(36, '2018-07-21 07:54:41.234727', '2', 'SolicitudMaterial object (2)', 3, '', 5, 1),
(37, '2018-07-21 07:54:45.770300', '1', 'SolicitudMaterial object (1)', 3, '', 5, 1),
(38, '2018-07-21 07:58:15.382158', '7', 'SolicitudMaterial object (7)', 3, '', 5, 1),
(39, '2018-07-21 07:58:18.292282', '8', 'SolicitudMaterial object (8)', 3, '', 5, 1),
(40, '2018-08-01 23:51:46.227189', '4', 'trabajador2@gpi.cl', 1, '[{\"added\": {}}]', 6, 1),
(41, '2018-08-01 23:51:48.820806', '4', 'trabajador2@gpi.cl', 1, '[{\"added\": {}}]', 9, 1),
(42, '2018-08-01 23:52:01.431902', '4', 'trabajador2@gpi.cl', 2, '[{\"changed\": {\"fields\": [\"is_trabajador_obra\"]}}]', 6, 1),
(43, '2018-08-01 23:52:38.463040', '2', 'Obra 2', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 3, 1),
(44, '2018-08-02 00:07:54.483468', '13', 'SolicitudMaterial object (13)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(45, '2018-08-02 00:07:58.731804', '12', 'SolicitudMaterial object (12)', 2, '[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]', 5, 1),
(46, '2018-08-02 22:20:13.613559', '3', 'Obra 150', 1, '[{\"added\": {}}]', 3, 1),
(47, '2018-08-02 22:33:13.866842', '1', 'Martillo', 1, '[{\"added\": {}}]', 1, 1),
(48, '2018-08-02 22:33:21.970078', '2', 'Tuercas', 1, '[{\"added\": {}}]', 1, 1),
(49, '2018-08-02 22:33:31.395255', '3', 'Ampolletas', 1, '[{\"added\": {}}]', 1, 1),
(50, '2018-08-02 22:33:52.411684', '4', 'Palos', 1, '[{\"added\": {}}]', 1, 1),
(51, '2018-08-05 05:30:17.463063', '15', 'SolicitudMaterial object (15)', 3, '', 5, 1),
(52, '2018-08-05 05:30:21.273618', '14', 'SolicitudMaterial object (14)', 3, '', 5, 1),
(53, '2018-08-05 05:30:24.076796', '13', 'SolicitudMaterial object (13)', 3, '', 5, 1),
(54, '2018-08-05 05:30:28.496502', '12', 'SolicitudMaterial object (12)', 3, '', 5, 1),
(55, '2018-08-05 05:30:31.705625', '11', 'SolicitudMaterial object (11)', 3, '', 5, 1),
(56, '2018-08-05 05:30:34.289972', '10', 'SolicitudMaterial object (10)', 3, '', 5, 1),
(57, '2018-08-05 05:30:37.092602', '9', 'SolicitudMaterial object (9)', 3, '', 5, 1),
(58, '2018-08-06 03:01:32.534919', '5', 'test@usm.cl', 2, '[{\"changed\": {\"fields\": [\"is_bodeguero\", \"is_encargado_compras\", \"is_trabajador_obra\"]}}]', 6, 5),
(59, '2018-08-06 03:02:00.833125', '5', 'test@usm.cl', 1, '[{\"added\": {}}]', 9, 5),
(60, '2018-08-06 03:02:14.751590', '5', 'test@usm.cl', 1, '[{\"added\": {}}]', 8, 5),
(61, '2018-08-06 03:02:22.638102', '5', 'test@usm.cl', 1, '[{\"added\": {}}]', 7, 5),
(62, '2018-08-06 03:05:31.521113', '2', 'Obra 2', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\", \"bodeguero\"]}}]', 3, 5),
(63, '2018-08-06 03:05:38.679120', '1', 'Obra 1', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 3, 5),
(64, '2018-08-06 03:05:43.926121', '1', 'Obra 1', 2, '[]', 3, 5),
(65, '2018-08-06 03:05:47.869600', '3', 'Obra 150', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 3, 5),
(66, '2018-08-06 03:06:01.589823', '3', 'Obra 150', 2, '[{\"changed\": {\"fields\": [\"bodeguero\"]}}]', 3, 5),
(67, '2018-08-06 03:06:06.661916', '2', 'Obra 2', 2, '[]', 3, 5),
(68, '2018-08-06 03:06:10.054048', '1', 'Obra 1', 2, '[{\"changed\": {\"fields\": [\"bodeguero\"]}}]', 3, 5),
(69, '2018-08-06 03:06:12.478545', '3', 'Obra 150', 2, '[]', 3, 5),
(70, '2018-08-06 03:06:25.200666', '18', 'SolicitudMaterial object (18)', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 5, 5),
(71, '2018-08-06 03:06:28.974807', '17', 'SolicitudMaterial object (17)', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 5, 5),
(72, '2018-08-06 03:06:32.720715', '16', 'SolicitudMaterial object (16)', 2, '[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'admin', 'logentry'),
(12, 'auth', 'group'),
(11, 'auth', 'permission'),
(13, 'contenttypes', 'contenttype'),
(7, 'GPI', 'bodeguero'),
(8, 'GPI', 'encargadocompras'),
(1, 'GPI', 'materiales'),
(2, 'GPI', 'materialsolicitado'),
(6, 'GPI', 'myuser'),
(3, 'GPI', 'obra'),
(4, 'GPI', 'ordencompra'),
(5, 'GPI', 'solicitudmaterial'),
(9, 'GPI', 'trabajadorobra'),
(14, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-06-20 22:44:08.266633'),
(2, 'contenttypes', '0002_remove_content_type_name', '2018-06-20 22:44:09.356205'),
(3, 'auth', '0001_initial', '2018-06-20 22:44:15.493889'),
(4, 'auth', '0002_alter_permission_name_max_length', '2018-06-20 22:44:16.369202'),
(5, 'auth', '0003_alter_user_email_max_length', '2018-06-20 22:44:16.440723'),
(6, 'auth', '0004_alter_user_username_opts', '2018-06-20 22:44:16.474225'),
(7, 'auth', '0005_alter_user_last_login_null', '2018-06-20 22:44:16.540943'),
(8, 'auth', '0006_require_contenttypes_0002', '2018-06-20 22:44:16.568786'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2018-06-20 22:44:16.608312'),
(10, 'auth', '0008_alter_user_username_max_length', '2018-06-20 22:44:16.651454'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2018-06-20 22:44:16.687361'),
(12, 'GPI', '0001_initial', '2018-06-20 22:44:46.182069'),
(13, 'admin', '0001_initial', '2018-06-20 22:49:13.051272'),
(14, 'admin', '0002_logentry_remove_auto_add', '2018-06-20 22:49:13.133789'),
(15, 'sessions', '0001_initial', '2018-06-20 22:49:13.941064');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_bodeguero`
--

CREATE TABLE `gpi_bodeguero` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_bodeguero`
--

INSERT INTO `gpi_bodeguero` (`user_id`) VALUES
(2),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_encargadocompras`
--

CREATE TABLE `gpi_encargadocompras` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_encargadocompras`
--

INSERT INTO `gpi_encargadocompras` (`user_id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_materiales`
--

CREATE TABLE `gpi_materiales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_materiales`
--

INSERT INTO `gpi_materiales` (`id`, `nombre`, `cantidad`) VALUES
(1, 'Martillo', 10),
(2, 'Tuercas', 1),
(3, 'Ampolletas', 5),
(4, 'Palos', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_materiales_obra`
--

CREATE TABLE `gpi_materiales_obra` (
  `id` int(11) NOT NULL,
  `materiales_id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_materiales_obra`
--

INSERT INTO `gpi_materiales_obra` (`id`, `materiales_id`, `obra_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_materialsolicitado`
--

CREATE TABLE `gpi_materialsolicitado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `urgencia` varchar(10) NOT NULL,
  `unidades` varchar(20) NOT NULL,
  `solicitud_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_materialsolicitado`
--

INSERT INTO `gpi_materialsolicitado` (`id`, `nombre`, `cantidad`, `urgencia`, `unidades`, `solicitud_id`) VALUES
(6, 'Martillo', 2, 'urgente', 'Unidades', 16),
(7, 'Martillo', 3, 'normal', 'Unidades', 17),
(8, 'Tuerca', 3, 'normal', 'Unidades', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_myuser`
--

CREATE TABLE `gpi_myuser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(254) NOT NULL,
  `second_name` varchar(254) NOT NULL,
  `apellido_paterno` varchar(254) NOT NULL,
  `apellido_materno` varchar(254) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_bodeguero` tinyint(1) NOT NULL,
  `is_trabajador_obra` tinyint(1) NOT NULL,
  `is_encargado_compras` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_myuser`
--

INSERT INTO `gpi_myuser` (`id`, `password`, `last_login`, `email`, `first_name`, `second_name`, `apellido_paterno`, `apellido_materno`, `rut`, `is_active`, `is_admin`, `is_superuser`, `is_bodeguero`, `is_trabajador_obra`, `is_encargado_compras`) VALUES
(1, 'pbkdf2_sha256$100000$PltbKg6vsV7j$+lY6VQVI6zv9/nCdV1WPjIXVzBS8VYIvKABHkaLCmMw=', '2018-08-05 05:29:59.816180', 'hola@gpi.cl', 'super1', 'hola', 'holo', 'doom', '123456-1', 1, 1, 1, 1, 1, 1),
(2, 'pbkdf2_sha256$100000$yxz5akGJNbD6$fuXYjHqa+u2xLJmFju3gfmYmC2fs1GXlpRAEBV/bZC4=', '2018-08-06 03:04:25.461503', 'bodega1@gpi.cl', 'Bodeguero1', '', 'ufmen', '', '123321-1', 1, 0, 0, 1, 0, 0),
(3, 'pbkdf2_sha256$100000$t8FQkcSfu6ZQ$LjyJi+uIw7GYsW4oaMX0qhsPfUtdk4gwY/sb/I5GZ4w=', '2018-08-05 05:33:21.883382', 'trabajador1@gpi.cl', 'Trabajador1', '', 'ufmen2', '', '123545', 1, 0, 0, 0, 1, 0),
(4, 'pbkdf2_sha256$100000$4B7lvAKjRUiP$oCfs42jF7SuUwGjIRwV118L4B8eqBcfGOkCM42PBn7I=', '2018-08-01 23:55:37.493877', 'trabajador2@gpi.cl', 'Trabajador2', '', 'ufuf', '', '123321-4', 1, 0, 0, 0, 1, 0),
(5, 'pbkdf2_sha256$100000$IvrYFdfg5Sai$E23R9tSfoqHcRRKDNf07fwG39g2j7423P3MA4iQzWao=', '2018-08-06 03:07:01.332646', 'test@usm.cl', 'test', 'test', 'test', 'test', '123', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_myuser_groups`
--

CREATE TABLE `gpi_myuser_groups` (
  `id` int(11) NOT NULL,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_myuser_user_permissions`
--

CREATE TABLE `gpi_myuser_user_permissions` (
  `id` int(11) NOT NULL,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_obra`
--

CREATE TABLE `gpi_obra` (
  `id` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `trabajadorobra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_obra`
--

INSERT INTO `gpi_obra` (`id`, `direccion`, `nombre`, `trabajadorobra_id`) VALUES
(1, 'Los menes 123', 'Obra 1', 5),
(2, 'Los menes 6969', 'Obra 2', 5),
(3, 'calle uf men', 'Obra 150', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_obra_bodeguero`
--

CREATE TABLE `gpi_obra_bodeguero` (
  `id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  `bodeguero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_obra_bodeguero`
--

INSERT INTO `gpi_obra_bodeguero` (`id`, `obra_id`, `bodeguero_id`) VALUES
(6, 1, 5),
(4, 2, 5),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_ordencompra`
--

CREATE TABLE `gpi_ordencompra` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `material` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_ordencompra_encargadocompras`
--

CREATE TABLE `gpi_ordencompra_encargadocompras` (
  `id` int(11) NOT NULL,
  `ordencompra_id` int(11) NOT NULL,
  `encargadocompras_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_ordencompra_solicitudmaterial`
--

CREATE TABLE `gpi_ordencompra_solicitudmaterial` (
  `id` int(11) NOT NULL,
  `ordencompra_id` int(11) NOT NULL,
  `solicitudmaterial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_solicitudmaterial`
--

CREATE TABLE `gpi_solicitudmaterial` (
  `numero_orden` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_requerida` date NOT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `obra_id` int(11) NOT NULL,
  `trabajadorobra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_solicitudmaterial`
--

INSERT INTO `gpi_solicitudmaterial` (`numero_orden`, `fecha_solicitud`, `fecha_requerida`, `fecha_estimada`, `obra_id`, `trabajadorobra_id`) VALUES
(16, '2018-08-05', '2018-11-01', NULL, 1, 5),
(17, '2018-08-05', '2018-12-01', NULL, 2, 5),
(18, '2018-08-05', '2018-09-08', NULL, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gpi_trabajadorobra`
--

CREATE TABLE `gpi_trabajadorobra` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gpi_trabajadorobra`
--

INSERT INTO `gpi_trabajadorobra` (`user_id`) VALUES
(1),
(3),
(4),
(5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_GPI_myuser_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `gpi_bodeguero`
--
ALTER TABLE `gpi_bodeguero`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `gpi_encargadocompras`
--
ALTER TABLE `gpi_encargadocompras`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `gpi_materiales`
--
ALTER TABLE `gpi_materiales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gpi_materiales_obra`
--
ALTER TABLE `gpi_materiales_obra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_materiales_obra_materiales_id_obra_id_6e6bcaf5_uniq` (`materiales_id`,`obra_id`),
  ADD KEY `GPI_materiales_obra_obra_id_8681c127_fk_GPI_obra_id` (`obra_id`);

--
-- Indices de la tabla `gpi_materialsolicitado`
--
ALTER TABLE `gpi_materialsolicitado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GPI_materialsolicita_solicitud_id_bb7d687b_fk_GPI_solic` (`solicitud_id`);

--
-- Indices de la tabla `gpi_myuser`
--
ALTER TABLE `gpi_myuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `gpi_myuser_groups`
--
ALTER TABLE `gpi_myuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_myuser_groups_myuser_id_group_id_da172dcf_uniq` (`myuser_id`,`group_id`),
  ADD KEY `GPI_myuser_groups_group_id_af4c4422_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `gpi_myuser_user_permissions`
--
ALTER TABLE `gpi_myuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_myuser_user_permissi_myuser_id_permission_id_65aa0738_uniq` (`myuser_id`,`permission_id`),
  ADD KEY `GPI_myuser_user_perm_permission_id_146bf5d1_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `gpi_obra`
--
ALTER TABLE `gpi_obra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GPI_obra_trabajadorobra_id_36ab3fa0_fk_GPI_traba` (`trabajadorobra_id`);

--
-- Indices de la tabla `gpi_obra_bodeguero`
--
ALTER TABLE `gpi_obra_bodeguero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_obra_bodeguero_obra_id_bodeguero_id_93d06985_uniq` (`obra_id`,`bodeguero_id`),
  ADD KEY `GPI_obra_bodeguero_bodeguero_id_3265373e_fk_GPI_bodeg` (`bodeguero_id`);

--
-- Indices de la tabla `gpi_ordencompra`
--
ALTER TABLE `gpi_ordencompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gpi_ordencompra_encargadocompras`
--
ALTER TABLE `gpi_ordencompra_encargadocompras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_ordencompra_encargad_ordencompra_id_encargado_aa76e3eb_uniq` (`ordencompra_id`,`encargadocompras_id`),
  ADD KEY `GPI_ordencompra_enca_encargadocompras_id_a83dba18_fk_GPI_encar` (`encargadocompras_id`);

--
-- Indices de la tabla `gpi_ordencompra_solicitudmaterial`
--
ALTER TABLE `gpi_ordencompra_solicitudmaterial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GPI_ordencompra_solicitu_ordencompra_id_solicitud_15d33f60_uniq` (`ordencompra_id`,`solicitudmaterial_id`),
  ADD KEY `GPI_ordencompra_soli_solicitudmaterial_id_4cc48c58_fk_GPI_solic` (`solicitudmaterial_id`);

--
-- Indices de la tabla `gpi_solicitudmaterial`
--
ALTER TABLE `gpi_solicitudmaterial`
  ADD PRIMARY KEY (`numero_orden`),
  ADD KEY `GPI_solicitudmaterial_obra_id_679e9934_fk_GPI_obra_id` (`obra_id`),
  ADD KEY `GPI_solicitudmateria_trabajadorobra_id_6977b575_fk_GPI_traba` (`trabajadorobra_id`);

--
-- Indices de la tabla `gpi_trabajadorobra`
--
ALTER TABLE `gpi_trabajadorobra`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `gpi_materiales`
--
ALTER TABLE `gpi_materiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gpi_materiales_obra`
--
ALTER TABLE `gpi_materiales_obra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gpi_materialsolicitado`
--
ALTER TABLE `gpi_materialsolicitado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `gpi_myuser`
--
ALTER TABLE `gpi_myuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `gpi_myuser_groups`
--
ALTER TABLE `gpi_myuser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gpi_myuser_user_permissions`
--
ALTER TABLE `gpi_myuser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gpi_obra`
--
ALTER TABLE `gpi_obra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `gpi_obra_bodeguero`
--
ALTER TABLE `gpi_obra_bodeguero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `gpi_ordencompra`
--
ALTER TABLE `gpi_ordencompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gpi_ordencompra_encargadocompras`
--
ALTER TABLE `gpi_ordencompra_encargadocompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gpi_ordencompra_solicitudmaterial`
--
ALTER TABLE `gpi_ordencompra_solicitudmaterial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gpi_solicitudmaterial`
--
ALTER TABLE `gpi_solicitudmaterial`
  MODIFY `numero_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`);

--
-- Filtros para la tabla `gpi_bodeguero`
--
ALTER TABLE `gpi_bodeguero`
  ADD CONSTRAINT `GPI_bodeguero_user_id_d65ec1f0_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`);

--
-- Filtros para la tabla `gpi_encargadocompras`
--
ALTER TABLE `gpi_encargadocompras`
  ADD CONSTRAINT `GPI_encargadocompras_user_id_8c6a0c88_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`);

--
-- Filtros para la tabla `gpi_materiales_obra`
--
ALTER TABLE `gpi_materiales_obra`
  ADD CONSTRAINT `GPI_materiales_obra_materiales_id_6eb74fc9_fk_GPI_materiales_id` FOREIGN KEY (`materiales_id`) REFERENCES `gpi_materiales` (`id`),
  ADD CONSTRAINT `GPI_materiales_obra_obra_id_8681c127_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`);

--
-- Filtros para la tabla `gpi_materialsolicitado`
--
ALTER TABLE `gpi_materialsolicitado`
  ADD CONSTRAINT `GPI_materialsolicita_solicitud_id_bb7d687b_fk_GPI_solic` FOREIGN KEY (`solicitud_id`) REFERENCES `gpi_solicitudmaterial` (`numero_orden`);

--
-- Filtros para la tabla `gpi_myuser_groups`
--
ALTER TABLE `gpi_myuser_groups`
  ADD CONSTRAINT `GPI_myuser_groups_group_id_af4c4422_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `GPI_myuser_groups_myuser_id_3e167e51_fk_GPI_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `gpi_myuser` (`id`);

--
-- Filtros para la tabla `gpi_myuser_user_permissions`
--
ALTER TABLE `gpi_myuser_user_permissions`
  ADD CONSTRAINT `GPI_myuser_user_perm_permission_id_146bf5d1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `GPI_myuser_user_permissions_myuser_id_49e2609e_fk_GPI_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `gpi_myuser` (`id`);

--
-- Filtros para la tabla `gpi_obra`
--
ALTER TABLE `gpi_obra`
  ADD CONSTRAINT `GPI_obra_trabajadorobra_id_36ab3fa0_fk_GPI_traba` FOREIGN KEY (`trabajadorobra_id`) REFERENCES `gpi_trabajadorobra` (`user_id`);

--
-- Filtros para la tabla `gpi_obra_bodeguero`
--
ALTER TABLE `gpi_obra_bodeguero`
  ADD CONSTRAINT `GPI_obra_bodeguero_bodeguero_id_3265373e_fk_GPI_bodeg` FOREIGN KEY (`bodeguero_id`) REFERENCES `gpi_bodeguero` (`user_id`),
  ADD CONSTRAINT `GPI_obra_bodeguero_obra_id_f5666335_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`);

--
-- Filtros para la tabla `gpi_ordencompra_encargadocompras`
--
ALTER TABLE `gpi_ordencompra_encargadocompras`
  ADD CONSTRAINT `GPI_ordencompra_enca_encargadocompras_id_a83dba18_fk_GPI_encar` FOREIGN KEY (`encargadocompras_id`) REFERENCES `gpi_encargadocompras` (`user_id`),
  ADD CONSTRAINT `GPI_ordencompra_enca_ordencompra_id_13f2d206_fk_GPI_orden` FOREIGN KEY (`ordencompra_id`) REFERENCES `gpi_ordencompra` (`id`);

--
-- Filtros para la tabla `gpi_ordencompra_solicitudmaterial`
--
ALTER TABLE `gpi_ordencompra_solicitudmaterial`
  ADD CONSTRAINT `GPI_ordencompra_soli_ordencompra_id_1ca83837_fk_GPI_orden` FOREIGN KEY (`ordencompra_id`) REFERENCES `gpi_ordencompra` (`id`),
  ADD CONSTRAINT `GPI_ordencompra_soli_solicitudmaterial_id_4cc48c58_fk_GPI_solic` FOREIGN KEY (`solicitudmaterial_id`) REFERENCES `gpi_solicitudmaterial` (`numero_orden`);

--
-- Filtros para la tabla `gpi_solicitudmaterial`
--
ALTER TABLE `gpi_solicitudmaterial`
  ADD CONSTRAINT `GPI_solicitudmateria_trabajadorobra_id_6977b575_fk_GPI_traba` FOREIGN KEY (`trabajadorobra_id`) REFERENCES `gpi_trabajadorobra` (`user_id`),
  ADD CONSTRAINT `GPI_solicitudmaterial_obra_id_679e9934_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`);

--
-- Filtros para la tabla `gpi_trabajadorobra`
--
ALTER TABLE `gpi_trabajadorobra`
  ADD CONSTRAINT `GPI_trabajadorobra_user_id_b1e1123f_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
