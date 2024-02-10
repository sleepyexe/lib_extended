fx_version 'cerulean'
game 'gta5'

name "esx_base"
description "Base Resources"
author "Sleepy Rae"
version "1.0.0"
lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'resources/status/shared/**.lua',
}

client_scripts {
	'resources/status/client/**.lua',
	'resources/basicneeds/client/**.lua',
	'resources/optionalneeds/client/**.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'resources/status/server/**.lua',
	'resources/basicneeds/server/**.lua',
	'resources/addonaccount/server/**.lua',
}

provides {
	'esx_addonaccount',
	'esx_basicneeds',
	'esx_optionalneeds',
	'esx_status'
}