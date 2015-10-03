<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(

	// TODO: Change proper urls

	'*' => array(
        'defaultImageQuality' => 80,
        'enableCsrfProtection' => true,
        'pageTrigger' => 'page/',
        'errorTemplatePrefix' => "_errors/",
        'rotateImagesOnUploadByExifData' => false,
		'cpTrigger' => 'manager',
        'errorTemplatePrefix' => 'view/',
        'omitScriptNameInUrls' => true,
        'generateTransformsBeforePageLoad' => true,
	),

	'.dev' => array(
		'siteUrl' => 'http://bootstrap.dev',
        'devMode' => true,
	),
	'bootstrap.com' => array(
		'siteUrl' => 'http://bootstrap.com/',
		'devMode' => false,
	),

	// 'bootstrap.com' => array(
	// 	'siteUrl' => 'http://bootstrap.com/',
	// 	'devMode' => false,
	// )

);
