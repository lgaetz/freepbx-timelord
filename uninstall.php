<?php
//Drop Tables
out("Dropping all relevant tables");
$sql = "DROP TABLE `timelord_settings`";
$result = sql($sql);

// do we need to remove the feature code set on install?