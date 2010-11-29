# vim-config


## Modular VIM Configuration

This configuration makes use of [pathogen](http://www.vim.org/scripts/script.php?script_id=2332) to have
a well organized vim directory.

It also heavily uses vim submodules where possible for all plugins. This makes for easy updating.

It also works well on Windows, Linux and OSX without even modifying directories. Just clone and run.

## Credit  
This setup was originally forked from: [spf13/spf13-vim](https://github.com/spf13/spf13-vim) and
customized for my purposes.

## The vimrc file
The vimrc file is suited to programming. It is very well organized and folds in sections.
Each section is labeled and each option is commented.

It fixes many of the inconveniences of vanilla vim including
 * One config can be used across Windows, Mac and linux
 * Eliminates swap and backup files from littering directories, preferring to store in a central location.
 * Fixes common typos like :W, :Q, etc
 * Setup a solid set of settings for Formatting (change to meet your needs) 
 * Setup the interface to take advantage of vim's features including
   * omnicomplete
   * line numbers
   * syntax highlighting
 * Configuring included plugins

## Plugins
I compile and configure a few popular vim plugins, colors, snippets, etc


## Installation

    git clone git@github.com:cybo42/vim-config.git
    cd vim-config
    git submodule update --init

I setup symlinks after this so I can maintain the repo outside of my actual config location.

Use ln -s on mac/unix or mklink on windows.

    cd ~
    ln -s /path/to/vim-config/vimrc .vimrc
    ln -s /path/to/vim-config/vim .vim

