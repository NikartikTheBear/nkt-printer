fx_version "cerulean"
game "gta5"
lua54 "yes"

author "nikartik"
version "1.0.0"

shared_scripts {
    "@es_extended/imports.lua", "config.lua"
}


server_scripts  {
    "server.lua"
}


client_scripts {
    "client.lua"
}

ui_page "html/index.html"
files {
    "html/**.*"
}
