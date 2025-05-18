require('fzf-lua').setup({
        files = {
            formatter      = "path.filename_first",
            cmd            = "find", -- | "rg --files"
            find_opts      = [[-type f \! -path '*/.git/*']],
            rg_opts        = [[--color=never --hidden --files -g "!.git"]]
        }
    })
