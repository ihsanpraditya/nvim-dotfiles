require("configuration")
require("plugins")
require('lualine').get_config()
require("bufferline").setup{}
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require("remap")

-- plugin configuration at after/plugins/
-- theme configuration at after/themes/
