require('dashboard').setup {
    theme = 'hyper',
    shortcut_type = 'number',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            {
                icon = ' ',
                desc = 'New file',
                group = 'DashboardCenter',
                action = 'enew!',
                key = 'n',
            },
            {
                icon = '󰱽 ',
                icon_hl = '@variable',
                desc = 'Find',
                group = '@text.note',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                icon = ' ',
                desc = 'Settings',
                group = '@text.reference',
                action = 'edit $MYVIMRC',
                key = 's',
            },
            {
                icon = '󰅘 ',
                desc = 'Exit',
                group = '@text.danger',
                action = 'quit',
                key = 'q'
            }
        },
    },
}

-- Dashboard Highlight follows default Vim highlight, view it in :Telescope highlight
            -- {
            --     icon = '󰚰 ',
            --     desc = 'Update',
            --     group = 'DevIconCsv',
            --     action = 'PackerSync',
            --     key = 'u'
            -- },
