<?php
/**
 * Configuración básica de WordPress.
 *
 * Este archivo contiene las siguientes configuraciones: ajustes de MySQL, prefijo de tablas,
 * claves secretas, idioma de WordPress y ABSPATH. Para obtener más información,
 * visita la página del Codex{@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} . Los ajustes de MySQL te los proporcionará tu proveedor de alojamiento web.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Ajustes de MySQL. Solicita estos datos a tu proveedor de alojamiento web. ** //
/** El nombre de tu base de datos de WordPress */
define('DB_NAME', 'wordpress');

/** Tu nombre de usuario de MySQL */
define('DB_USER', 'root');

/** Tu contraseña de MySQL */
define('DB_PASSWORD', 'password');

/** Host de MySQL (es muy probable que no necesites cambiarlo) */
define('DB_HOST', 'mysql');
define( 'WP_HOME', 'http://192.168.99.101:5050/' );
define( 'WP_SITEURL', 'http://192.168.99.101:5050/' );


/** Codificación de caracteres para la base de datos. */
define('DB_CHARSET', 'utf8');

/** Cotejamiento de la base de datos. No lo modifiques si tienes dudas. */
define('DB_COLLATE', '');

/**#@+
 * Claves únicas de autentificación.
 *
 * Define cada clave secreta con una frase aleatoria distinta.
 * Puedes generarlas usando el {@link https://api.wordpress.org/secret-key/1.1/salt/ servicio de claves secretas de WordPress}
 * Puedes cambiar las claves en cualquier momento para invalidar todas las cookies existentes. Esto forzará a todos los usuarios a volver a hacer login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'E&o-|u,I[ ]bC}+vfEW!pPnZ7LE(1]]{54Xcy8>](^-+URy2!`S9-B^@GD6GpUT!');
define('SECURE_AUTH_KEY',  'S9?T|-C91Z=vDJxYqD>j@{g[r*KBoQ.0%zVRAe2>z,+HZ+MPA>|g2C={7cZdq6kM');
define('LOGGED_IN_KEY',    'UL-t:#*BjoTFR4#!l.-8 +KUJ.EG8@Szd4GXtj][vRZKLeMp}[>.2ba>l6ddFmN:');
define('NONCE_KEY',        '$@N-;8y{h?,xI{1QLq2U|4hjm;#&r!uE*!-2-69c.#k#IwSP7m|[2{{egw-ou^XG');
define('AUTH_SALT',        ';QDuwcEqX0WzC.eQ+=-N,B+260a>l#y!oKmrWZ=_]Izv{-gyvO.k3]nR*/`u?GWy');
define('SECURE_AUTH_SALT', '+E$t-n?M0!cy(s5va,8SQ`]0U_3Kuxd_uqSg0Ps]c#j-@-Sf7jxihfD9PbUwUYIW');
define('LOGGED_IN_SALT',   ']XFW+Iyx*:x23KH;2xQ[-(r@Exg1]F`;bIq<UMV@wsPH=h|4My+t07cPdbUsXCv|');
define('NONCE_SALT',       'u@bD^_JDC-2VK(rP F%f9@gfPuSslfLxp7TK2T-g3s?_-9s+,5t3%/d7R^0!,A|R');

/**#@-*/

/**
 * Prefijo de la base de datos de WordPress.
 *
 * Cambia el prefijo si deseas instalar multiples blogs en una sola base de datos.
 * Emplea solo números, letras y guión bajo.
 */
$table_prefix = 'wp_';


/**
 * Para desarrolladores: modo debug de WordPress.
 *
 * Cambia esto a true para activar la muestra de avisos durante el desarrollo.
 * Se recomienda encarecidamente a los desarrolladores de temas y plugins que usen WP_DEBUG
 * en sus entornos de desarrollo.
 */
define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz blogging */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');