fx_version 'cerulean'
game 'gta5'

name "esx_base"
description "Base Resources"
author "Sleepy Rae"
version "1.0.0"
lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'shared/*.lua'
}

client_scripts {
	'resources/status/client/**.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'resources/status/server/**.lua',
	'resources/addonaccount/server/**.lua',
	'server/*.lua'
}

provides {
	'esx_addonaccount',
	'esx_basicneeds',
	'esx_optionalneeds',
	'esx_status'
}