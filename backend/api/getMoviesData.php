<?php

require_once("../../../common/php/environment.php");

$db = new Database("cosmoscreen");

$query = "SELECT `id`,`title`,`genre`,`runtime`,`director`,
                 `production`,`age_restriction`,`showing_in`,
                 `poster`,`trailer`,`description`,`release_date` 
          FROM `movies`";

$result = $db->execute($query);

$db = null;

//TODO: Adat ellenörzés




Util::setResponse($result);