local home = os.getenv('HOME')
local db = require('dashboard')
db.default_banner = {
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
    '',
}


-- db.preview_command = 'cat | lolcat -F 0.3'
-- db.preview_file_path = '~/.config/nvim/anime.txt'
-- db.preview_file_height = 30
-- db.preview_file_width = 90
db.custom_center = {
    {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'Telescope oldfiles',
    shortcut = '<,-f-r>'},
    {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = '<,-f-f>'},
    {icon = '  ',
    desc ='File Browser                            ',
    action =  'Telescope file_browser',
    shortcut = '<,-f-b>'},
    {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = '<,-f-g>'},
    {icon = '  ',
    desc = 'Change theme                              ',
    action = 'colorcheme                            ',
    shortcut = '<F3>'},
}
