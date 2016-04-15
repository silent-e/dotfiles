" }}}-------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

" Allow vim to break compatibility with vi
set nocompatible  " This must be first, because it changes other options

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

set number        " Show line numbers
set ruler         " Show line and column number
set noswapfile
set laststatus=2  " Always display the status line

" ***********************
" syntax highlighting
" ***********************
syntax enable     " Turn on syntax highlighting allowing local overrides

" drupal install files
au BufNewFile,BufRead *.install set filetype=php

" }}}-------------------------------------------------------------------------
"   whitespace                                                            {{{
" ----------------------------------------------------------------------------

set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
" set list                          " Show invisible characters

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots

" }}}-------------------------------------------------------------------------
"   searching                                                             {{{
" ----------------------------------------------------------------------------

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" }}}-------------------------------------------------------------------------
"   wild settings                                                         {{{
" ----------------------------------------------------------------------------

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" }}}-------------------------------------------------------------------------
"   Plugin                                                                {{{
" ----------------------------------------------------------------------------

" Installing the Plug plugin manager, and all the plugins are included in this
" other file.
source $HOME/.vim/plug.vim

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
