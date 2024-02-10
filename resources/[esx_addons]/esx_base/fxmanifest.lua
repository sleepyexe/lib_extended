fx_version 'cerulean'
game 'gta5'

name "esx_base"
description "Base Resources"
author "Sleepy Rae"
version "1.0.0"
lua54 'yes'

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

provides {
	'esx_addonaccount',
	'esx_basicneeds',
	'esx_optionalneeds',
	'esx_status'
}