" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/config/plugins/themes.vim
source ~/.config/nvim/config/plugins/telescope.vim
source ~/.config/nvim/config/plugins/nerdtree.vim
source ~/.config/nvim/config/plugins/treesitter.vim
source ~/.config/nvim/config/plugins/coc.vim
source ~/.config/nvim/config/plugins/lsp.vim
source ~/.config/nvim/config/plugins/multiple-cursors.vim
source ~/.config/nvim/config/plugins/wordmotion.vim
source ~/.config/nvim/config/plugins/prettier.vim
source ~/.config/nvim/config/plugins/nerd-commenter.vim
source ~/.config/nvim/config/plugins/matchup.vim
source ~/.config/nvim/config/plugins/copilot.vim
source ~/.config/nvim/config/plugins/sayonara.vim
source ~/.config/nvim/config/plugins/scroll.vim
source ~/.config/nvim/config/plugins/dashboard.vim
source ~/.config/nvim/config/plugins/git.vim
source ~/.config/nvim/config/plugins/easymotion.vim
source ~/.config/nvim/config/plugins/float-terminal.vim

call plug#end()

doautocmd User PlugLoaded
