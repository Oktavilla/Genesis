install_homebrew () {
  curl -fsSk https://raw.github.com/mxcl/homebrew/go > /tmp/brew_install.sh &&
    ruby /tmp/brew_install.sh &&
    rm /tmp/brew_install.sh
}

update_homebrew () {
  brew update
}

ensure_homebrew () {
  if command_exists brew; then
    installed_homebrew_version="$(brew --version)"

    if ! version_above_or_equal $installed_homebrew_version $GENESIS_HOMEBREW_VERSION; then
      printf "Updating homebrew to latest version, version %b is to old" $installed_homebrew_version
      update_homebrew;
    fi
  else
    echo "Unable to find homebrew, installing .."
    install_homebrew;
  fi
}