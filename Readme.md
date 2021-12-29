# My custom dotfiles

## How to manage dotfiles? 

I work with a bare github repository, following this tutorial: https://www.atlassian.com/git/tutorials/dotfiles

The `dotfiles` alias is added to .zshrc to manage the git repository.

How to setup a new environment:

```
git clone --bare git@github.com:emield12/dotfiles.git $HOME/dotfiles.git
# Add -f option if you want to override existing config files.
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME checkout
```
