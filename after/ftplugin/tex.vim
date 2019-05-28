setlocal textwidth=79

nnoremap <leader>pp :w<CR>:!rubber --short --pdf %<CR>
noremap <leader>pe :!zathura %:r.pdf &<CR><CR>
