# dotfiles

## Prerequisite

### 1. zsh
```bash
apt install zsh
```

### 2. [Homebrew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Ensure homebrew env is injected in .zprofile or other config files loaded before .zshrc file. If not, manually add the following line to .zprofile.

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### 3. zinit

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

### 4. other tools

```
brew install neovim
brew install mise
brew install fzf
```