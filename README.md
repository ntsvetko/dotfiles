# My Setup 🌟

I'm including some config files as well as general lists of things that I use here.

## Included in Repo
* `.vimrc`
* `.zshrc`
* `.tmux.conf`
* `.theme.conf` -- tmux theme file

## Things To Download
* iTerm2 (if it's a Mac)
* oh-my-zsh (currently using "agnoster", which requires powerline fonts, but in the past I edited the alanpeabody prompt to include an emoji by changing the PROMPT line to PROMPT="${user} ${pwd} $emoji[spiral_shell]")
  * this will generate a new .zshrc so I like to just edit the new .zshrc to use agnoster as a theme and plugins=(git web-search vi-mode emoji history-substring-search go osx)
* homebrew (if it's a Mac)
* tmux (2.1 or above, via homebrew)
* reattach-to-user-namespace (use homebrew -- fixes some issues between tmux and Mac, ex. copy/paste)
* vundle (package manager for vim -- https://github.com/VundleVim/Vundle.vim )
* coreutils on mac for ls colors! (using homebrew)
* vim!
  * if it's a mac, use MacVim (just alias vim to point to the one in MacVim because it's newer and shinier and YouCompleteMe wants it)
  * if it's not a mac, use the shiniest vim you can get or else YouCompleteMe will complain
    * if it's a department machine, cry.
* some kind of powerline font, which can be downloaded here: https://github.com/powerline/fonts
  * (Meslo Powerline, perhaps)

## Other Stuff
* I'm using the "Afterglow" color scheme and I like it! (you can get it in iTerm2-Color-Schemes at https://github.com/mbadolato/iTerm2-Color-Schemes and there are many great ones and it includes a mode to toggle them all in order to find the one you like)
* Remap Caps Lock to Control
* make sure that iTerm2 allows applications to access the clipboard
* Airline themes I like: alduin, raven, bubblegum, sierra, understated

*WARNING* don't just copy the files! A lot of things in them are specific to the setup of this laptop. I'm just including them to remind myself some of the things that I do to customize my setup.

## LOOK AT THIS BEAUTY
* it's actually from last year but oh well
![alt text](https://user-images.githubusercontent.com/12420326/27706897-569c093c-5ce1-11e7-890e-5368744e180d.png)
