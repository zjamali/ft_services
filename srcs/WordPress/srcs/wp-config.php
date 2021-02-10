<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'zjamali' );

/** MySQL database password */
define( 'DB_PASSWORD', 'Zouhair' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '#kWpV/9DSw:-pyZ:WH?H~J}<,_NQ2;@?P>8FCW]VAf>6VhfyoMP,w_-R8Bz927eM' );
define( 'SECURE_AUTH_KEY',  '9glo?oHW(^[_w2-aWG~Y[7+BbzUuS:LF-8VLs_i4Lu.~x5cB{A1@jjJw$c=-oaj:' );
define( 'LOGGED_IN_KEY',    'I!Zk5gEOCK;jiB8@Rb=_%aE^wv5!6G[yOt9si@n7W~;_n*EOkRIOexGmx?8kn#~A' );
define( 'NONCE_KEY',        'z?DO#z(q/#q||x:.B/c,u;fZgPX7<v[{{q5y#:33+o=A|hD>^}4ceI*9, $vl(Xw' );
define( 'AUTH_SALT',        'JTRFq}85}<8*CVABbw5ZBC.q4<3qyv=7`#|-y{lOc9.1}MB[M/eUs{-hl`cs-)g-' );
define( 'SECURE_AUTH_SALT', '1;1/#U;vuwE~nG[qjV#L&&qLk[8sA4DdsB)L0Y4?VkUi=%vO5?.:,)-6slYeJ&t&' );
define( 'LOGGED_IN_SALT',   '-UGH=R>x/t!}|T1;e=Eg2W.KC_{Xe+gUPBPv`npiv?w|i4j/y?3Mlf}XIbZwZa/M' );
define( 'NONCE_SALT',       'a,&aO=;]8,/QV#bX;HKxE<t<w7n@=!s0E?HUi&>+JJi={Z<wrDYLDx]8|!3)z{uY' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
