fx_version 'cerulean'
game 'gta5'

description 'QB-Gathering'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

server_scripts {
	'server/main.lua',
}

client_scripts {
	'client/main.lua',
}
