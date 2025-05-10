require('fzf-lua').setup({
        files = {
            path_shorten   = 5,              -- 'true' or number, shorten path?
            formatter      = "path.filename_first",
            cmd            = "find", -- | "rg --files"
            find_opts      = [[-type f \! -path '*/.git/*']],
            rg_opts        = [[--color=never --hidden --files -g "!.git"]]
        }
    })
