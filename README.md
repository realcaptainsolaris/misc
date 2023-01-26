# MISC
Diverse Settings und Dotfiles für Online-Schulungen.

## Settings für VS Code
Für VS Code muss die `Python Extension` und der `Mypy-Daemon` installiert sein,
damit die Settings fehlerfrei funktionieren.

## Settings für VIM
Für VIM müssen `Vundle` und `Vim Plug` auf dem System installiert sein:

### Vundle
https://github.com/VundleVim/Vundle.vim

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### Vim Plug
https://github.com/junegunn/vim-plug

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


### Pakete, damit VIM richtig funktioniert 

    pip install pyls-black
    pip install flake8
    pip install mypy 


### Coc.nvim Make your Vim/Neovim as smart as VSCode. 
Node 12 must be installed

https://github.com/neoclide/coc.nvim

Hint: Autocomplete setup improvment:
https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion


### Coc.nvim python Language Serverinstall (deprecated)
https://github.com/neoclide/coc-python
  
    :CocInstall coc-python

### Coc vim Extensions

    :CocInstall ...
    coc-pyright 
    coc-json
    coc-snippets
    coc-rls

### Coc-Settings.json
(set up config file)
:CocConfig 


