cask_args appdir: "/Applications"

appdir = cask_arguments[:appdir]

tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"

brew "awscli"
brew "bat"
brew "fzf"
brew "git"
brew "gnupg"
brew "gnupg2"
brew "go"
brew "kubectx"
brew "kubernetes-cli"
brew "node"
brew "pinentry-mac"
brew "postgresql@9.6"
brew "rbenv"
brew "redis"
brew "vim"

cask "charles" unless system("test -e \"#{appdir}/Charles.app\"")
cask "docker" unless system("test -e \"#{appdir}/Docker.app\"")
cask "firefox" unless system("test -e \"#{appdir}/Firefox.app\"")
cask "google-cloud-sdk" unless system("test -e /usr/local/bin/gcloud")
cask "iterm2" unless system("test -e \"#{appdir}/iTerm.app\"")
cask "postico" unless system("test -e \"#{appdir}/Postico.app\"")
cask "slack" unless system("test -e #{appdir}/Slack.app")
cask "spectacle" unless system("test -e #{appdir}/Spectacle.app")
cask "visual-studio-code" unless system("test -e \"#{appdir}/Visual Studio Code.app\"")
