This is my personal configuration for [Neovim](https://github.com/neovim/neovim). I prefer to use [Lua](https://www.lua.org/), than [Vimscript](http://vimscript.org/) for boost the speed (which I haven't test it until now, I will test it later).

I put a little code in my init.lua, then I imported lua files at lua folder as we taught in `:h lua.txt`. There are my plugins that I use [Packer](https://github.com/wbthomason/packer.nvim) as package manager (it isn't).

My remap or binding keys is there too, but binding for plugins is located at `after/plugin/`. There also plugins configuration and options.

**Important!**  
If you have been using nvim, backup your nvim folder before installation. If you want to uninstall Neovim firstly, you may refer to [here](https://github.com/neovim/neovim/wiki/Installing-Neovim#uninstall).

**Prerequisite**  
1. [Packer](https://github.com/wbthomason/packer.nvim#quickstart).
2. [NodeJS](https://github.com/nodejs/node#download)

**Installation**  
1. Install prerequisites, you may use [NVM](https://github.com/nvm-sh/nvm#node-version-manager---) for it.
2. Clone this repo to your Neovim configuration folder.
3. Open Neovim to install plugins. You may get some errors, just leave it.
4. After plugins installation, you may restart Neovim (recomended) or start using it.

Hope it gives you benefits as I just newbie in publication document. You may fork or pull request for the repo. Thank you.
