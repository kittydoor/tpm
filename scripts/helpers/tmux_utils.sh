#!/usr/bin/env bash

HELPERS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#shellcheck source=scripts/helpers/plugin_functions.sh
source "$HELPERS_DIR/plugin_functions.sh"

reload_tmux_environment() {
	tmux source-file "$(_get_user_tmux_conf)" >/dev/null 2>&1
}
