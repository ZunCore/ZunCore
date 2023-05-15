fx_version 'cerulean'
games { 'gta5' }
author 'Zuntie#5340'
client_scripts {

}

shared_scripts {
    'import.lua'
}

server_scripts {
    'server/main.lua',
    'server/modules/*.*',
    '@oxmysql/lib/MySQL.lua',
}

files {
    'import.lua'
}