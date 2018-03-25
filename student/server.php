<?php
$dsn      = 'mysql:dbname=mccProj;host=localhost';
$username = 'r1234';
$password = 'myPass';

// ini_set('display_errors', 1);
// error_reporting(E_ALL);

require_once 'oauth2-server-php/src/OAuth2/Autoloader.php';
OAuth2\Autoloader::register();

// $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
$storage = new OAuth2\Storage\Pdo(['dsn' => $dsn, 'username' => $username, 'password' => $password]);

// Pass a storage object or array of storage objects to the OAuth2 server class
$server = new OAuth2\Server($storage);

// Add the "Client Credentials" grant type (it is the simplest of the grant types)
$server->addGrantType(new OAuth2\GrantType\ClientCredentials($storage));
