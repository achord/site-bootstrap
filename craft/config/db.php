<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(

    // TODO: Add proper db connection
	'*' => array(
		'tablePrefix' => 'craft'
	),

	// '.dev' => array(
	// 	'server' => 'localhost',
	// 	'user' => 'root',
	// 	'password' => 'root',
	// 	'database' => 'nataliemancuso',
	// ),

	'.dev' => array(
		'server' => 'localhost',
		'password' => 'root',
		'database' => 'root',
	),

	'bootstrap.com' => array(
		'server' => 'localhost',
		'user' => 'vectorliving',
		'password' => '4u4zySGv',
		'database' => 'db320_nmdev',
	),

	// 'nataliemancuso.com' => array(
	// 	'server' => 'localhost',
	// 	'user' => 'natali42_craft',
	// 	'password' => '3b45%caw6TT+',
	// 	'database' => 'natali42_craft',
	// ),



);
