fx_version 'cerulean'
game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',  -- Assurez-vous que mysql-async est bien installé
    'server/server.lua',           -- Script principal côté serveur
}

dependencies {
    'mysql-async',                -- Dépendance pour MySQL-async
}
