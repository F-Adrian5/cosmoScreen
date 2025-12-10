<?php

require_once("../../../common/php/environment.php");

$db = new Database("cosmoscreen");

$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];

$query = " INSERT INTO users (name, email, password)
                VALUES ('$name', '$email', '$password')";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);