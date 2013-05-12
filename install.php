<?php
/* FreePBX installer file
 * This file is run when the module is installed through module admin
 *
 * Note: install.sql is depreciated and may not work. Its recommended to use this file instead.
 * 
 * If this file returns false then the module will not install
 * EX:
 * return false;
 *
 */
$sql = "CREATE TABLE IF NOT EXISTS timeclock_settings (
`key` varchar(255) NOT NULL default '1',
`host` varchar(255) NOT NULL default 'localhost',
`user` varchar(255) NOT NULL default 'root',
`password` varchar(255) NOT NULL default 'passw0rd',
PRIMARY KEY (`key`)
);";

$check = sql($sql);
if (DB::IsError($check)) {
        die_freepbx( "Can not create `timeclock_settings` table: " . $check->getMessage() .  "\n");
}