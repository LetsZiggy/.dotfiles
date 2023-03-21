# --- Append content to ~/.profile --- #

# ssh-agent (Ref: https://web.archive.org/web/20210506080335/https://mah.everybody.org/docs/ssh)
SSH_ENV="$HOME/.ssh/ssh_agent_environment"
function start_agent {
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi

# Default Editor
export VISUAL=/usr/bin/nano
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

# NPM path
export NPM_CONFIG_PREFIX=$HOME/.local

# PNPM path
export PNPM_HOME=$HOME/.local/share/pnpm
export PATH=$PATH:$PNPM_HOME

# PHP composer path
export PATH=$PATH:$HOME/.config/composer/vendor/bin

# Go path - https://wiki.archlinux.org/title/Go#Install_directory
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$(go env GOBIN):$(go env GOPATH)/bin

# Rust Cargo path
export PATH=$PATH:$HOME/.cargo/bin

# Neovim init.lua
export MYVIMRC=$HOME/.config/nvim/init.lua
