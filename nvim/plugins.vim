" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/themes.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/multiple-cursors.vim
source ~/.config/nvim/plugins/wordmotion.vim
source ~/.config/nvim/plugins/prettier.vim
source ~/.config/nvim/plugins/nerd-commenter.vim
source ~/.config/nvim/plugins/matchup.vim
source ~/.config/nvim/plugins/copilot.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/scroll.vim
source ~/.config/nvim/plugins/dashboard.vim
source ~/.config/nvim/plugins/git.vim
source ~/.config/nvim/plugins/easymotion.vim
source ~/.config/nvim/plugins/float-terminal.vim

call plug#end()

doautocmd User PlugLoaded
