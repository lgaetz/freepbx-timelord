<?php
//Check if user is "logged in"
if (!defined('FREEPBX_IS_AUTH')) { die('No direct script access allowed'); }



// check to see if user has automatic updates enabled in FreePBX settings
$cm =& cronmanager::create($db);
$online_updates = $cm->updates_enabled() ? true : false;

// check dev site to see if new version of module is available
if ($online_updates && $foo = lenny_vercheck()) {
	print "<br>A <b>new version of this module is available</b> from the <a target='_blank' href='http://pbxossa.org'>PBX Open Source Software Alliance</a><br>";
}

//if submitting form, update database
if(isset($_POST['submit'])) {
		timelord_store(1,$_POST);
		needreload();
		redirect_standard();
	
	}


//  to add right navigation menu enclose output in <div class="rnav"> </div>
/* echo '<div class="rnav">';
echo "menu items";
echo '</div>';
*/
$config = timelord_settings();

?>

<h2>FreePbx Timeord Module</h2>

<form autocomplete="off" name="edit" action="<?php $_SERVER['PHP_SELF'] ?>" method="post" >
<table>
	<tr>			
		<td colspan="2">			
			<?php echo _('This module is used to provide an IVR voice interface to an installation of the php timeclock project.'); ?>
		</td>			
	</tr>
	<tr><td colspan="2"><h5>Module Config<hr></h5></td></tr>

	<tr>
		<td><a href="#" class="info"><?php echo _("PHP Timeclock Host")?><span><?php echo _("FQDN or IP address to the server hosting the php timeclock software")?></span></a></td>
		<td><input type="text" name="host" size=40 value="<?php echo htmlspecialchars(isset($config[0]['host']) ? $config[0]['host'] : ''); ?>" ></td>
	</tr>
	<tr>
		<td><a href="#" class="info"><?php echo _("PHP Timeclock MySQL User")?><span><?php echo _("MySQL username to access the php timeclock database")?></span></a></td>
		<td><input type="text" name="user" size=40 value="<?php echo htmlspecialchars(isset($config[0]['user']) ? $config[0]['user'] : ''); ?>" ></td>
	</tr>
	<tr>
		<td><a href="#" class="info"><?php echo _("Password")?><span><?php echo _("Password for MySQL username")?></span></a></td>
		<td><input type="text" name="password" size=40 value="<?php echo htmlspecialchars(isset($config[0]['password']) ? $config[0]['password'] : ''); ?>" ></td>
	</tr>
	<tr>
		<td><a href="#" class="info"><?php echo _("Database name")?><span><?php echo _("Name of database where PHP Timclock data is stored")?></span></a></td>
		<td><input type="text" name="database" size=40 value="<?php echo htmlspecialchars(isset($config[0]['database']) ? $config[0]['database'] : ''); ?>" ></td>
	</tr>
	<tr>
		<td><a href="#" class="info"><?php echo _("Table Prefix")?><span><?php echo _("If php timeclock was configured with a table prefiex, enter it here")?></span></a></td>
		<td><input type="text" name="tableprefix" size=40 value="<?php echo htmlspecialchars(isset($config[0]['tableprefix']) ? $config[0]['tableprefix'] : ''); ?>" ></td>
	</tr>
	<tr>
		<td colspan="2"><br><h6><input name="submit" type="submit" value="<?php echo _("Submit Changes")?>" ></h6></td>
	</tr>
</table>
</form>
