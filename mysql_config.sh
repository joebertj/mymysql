#!/usr/bin/expect

set pwd [lindex $argv 0];
set lpath [lindex $argv 1];
set usr [lindex $argv 2];

spawn mysql_config_editor set --login-path=${lpath} --host=localhost --user=${usr} --password
expect -nocase "Enter password:" {send "${pwd}\r"; interact}
