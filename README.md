# Config Neovim

## Yang Digunakan

1. [Neovim](https://github.com/neovim/neovim), yang dipakai di config ini: 0.11.4
1. [lazy.nvim](https://github.com/folke/lazy.nvim), yang dipakai di config ini: 11.17.1

### LSP yang Dipakai

1. astro-ls
1. Deno's built-in language server
1. emmet-ls
1. intelephense
1. lua-ls
1. svelte-language-server
1. ts-ls
1. vue-ls

Sebagian besar bisa di-install dengan [npm](https://nodejs.org/) atau dengan
Mason yang sudah ada di config ini.

## Langkah Instalasi

1. Clone repo ini.
1. Buka Neovim seperti biasa. lazy.nvim akan memulai instalasi dirinya dan semua
   plugin yang ada di `./lua/plugins/`.

## Catatan

1. Jika Neovim dijalankan dengan option `--noplugin`, semua plugin tidak akan
   di-load. Config yang ada di `./lua/config/` tetap akan di-load.
1. LSP atau Formatter yang di-install dengan Mason akan tersedia setelah Neovim
   berjalan. Tidak tersedia di luar environment Neovim.
