<?php
//Drop Tables
out("Dropping all relevant tables");
$sql = "DROP TABLE `timeclock_settings`";
$result = sql($sql);