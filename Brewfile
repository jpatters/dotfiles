cask_args appdir: "/Applications"

appdir = cask_arguments[:appdir]

tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"

brew "awscli"
brew "bat"
brew "cmake"
brew "fzf"
brew "git"
brew "git-lfs"
brew "gnupg"
brew "gnupg2"
brew "go"
brew "jq"
brew "kubectx"
brew "kubernetes-cli"
brew "libmagic"
brew "mas"
brew "openssl"
brew "node@10"
brew "pinentry-mac"
brew "postgresql"
brew "postgresql@9.6", restart_service: true
brew "rbenv"
brew "redis", restart_service: true
brew "terraform"
brew "tmux"
brew "vim"
brew "yarn", args: ["without-node"]

cask "authy" unless system("test -e \"#{appdir}/Authy Desktop.app\"")
cask "charles" unless system("test -e \"#{appdir}/Charles.app\"")
cask "docker" unless system("test -e \"#{appdir}/Docker.app\"")
cask "firefox" unless system("test -e \"#{appdir}/Firefox.app\"")
cask "google-cloud-sdk" unless system("test -e /usr/local/bin/gcloud")
cask "iterm2" unless system("test -e \"#{appdir}/iTerm.app\"")
cask "postico" unless system("test -e \"#{appdir}/Postico.app\"")
cask "postman" unless system("test -e \"#{appdir}/Postman.app\"")
cask "slack" unless system("test -e #{appdir}/Slack.app")
cask "spectacle" unless system("test -e #{appdir}/Spectacle.app")
cask "tunnelblick" unless system("test -e #{appdir}/Tunnelblick.app")
cask "spotify" unless system("test -e #{appdir}/Spotify.app")
cask "visual-studio-code" unless system("test -e \"#{appdir}/Visual Studio Code.app\"")
cask "zoomus" unless system("test -e \"#{appdir}/zoom.us.app\"")


mas "bear", id: 1091189122