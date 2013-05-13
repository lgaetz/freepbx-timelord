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
 
 // during development to avoid any issues with database changes between versions, drop existing table at each install.
 // THIS NEEDS TO BE FIXED
 
 $sql = "DROP TABLE IF EXISTS timelord_settings";
$check = $db->query($sql);
if (DB::IsError($check))
{
	die_freepbx( "Can not delete table: " . $check->getMessage() .  "\n");
}

// create a new table
$sql = "CREATE TABLE IF NOT EXISTS timelord_settings (
`key` varchar(255) NOT NULL default '1',
`host` varchar(255) default 'localhost',
`user` varchar(255) default 'root',
`password` varchar(255)  default 'passw0rd',
`database`  varchar(255) default 'phptimeclock',
`tableprefix` varchar(255) default '',
PRIMARY KEY (`key`)
);";

$check = sql($sql);
if (DB::IsError($check)) {
        die_freepbx( "Can not create `timelord_settings` table: " . $check->getMessage() .  "\n");
}

// populate new table with default values
$sql = "INSERT INTO `timelord_settings` (`key`, `host`, `user`, `password`, `database`, `tableprefix`) VALUES ('1' , 'localhost',  'root', 'passw0rd', 'phptimeclock', '')";
$check = $db->query($sql);
if (DB::IsError($check)) {
        die_freepbx( "Can not insert default values: " . $check->getMessage() .  "\n");
}

// Register Timelord FeatureCode - *-T-I-M-E  or *8463;
$fcc = new featurecode('timelord', 'timelord');
$fcc->setDescription('Timelord');
$fcc->setDefault('*8463');
$fcc->update();
unset($fcc);