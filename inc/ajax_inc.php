<?php

include 'models/model.connection.php';

include 'models/model.crud.php';
$crud = new Crud();

include'models/model.writer.php';
$writer = new Writer();

include 'models/model.profiler.php';
$profiler = new Profiler();

?>