# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::datadog::deps()
#
#>
######################################################################
p6df::modules::datadog::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    DataDog/datadog-api-claude-plugin
    datadog-labs/pup
    ahmedasmar/devops-claude-skills:monitoring-observability
  )
}

######################################################################
#<
#
# Function: p6df::modules::datadog::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::datadog::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::datadog::langs()
#
#>
######################################################################
p6df::modules::datadog::langs() {

  uv tool install datadog
  gem install dogapi
  go get github.com/DataDog/datadog-go
  npm install datadog-metrics
  luarocks install datadog
  cpanm WebService::DataDog
#  cargo install datadog # crate only

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::datadog::clones()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR
#>
######################################################################
p6df::modules::datadog::clones() {

  p6_github_cli_parallel_clone DataDog "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::datadog::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 DATADOG_API_KEY DATADOG_APP_KEY DATADOG_SITE P6_DFZ_PROFILE_DATADOG
#>
######################################################################
p6df::modules::datadog::prompt::mod() {
  local str=""
  if p6_string_blank_NOT "$P6_DFZ_PROFILE_DATADOG"; then
    str="datadog:\t  $P6_DFZ_PROFILE_DATADOG:"
    if p6_string_blank_NOT "$DATADOG_SITE"; then
      str=$(p6_string_append "$str" "$DATADOG_SITE" " ")
    fi
    if p6_string_blank_NOT "$DATADOG_API_KEY"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
    if p6_string_blank_NOT "$DATADOG_APP_KEY"; then
      str=$(p6_string_append "$str" "app" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::datadog::profile::on(profile, code)
#
#  Args:
#	profile -
#	code -
#
#  Environment:	 DATADOG_API_KEY DATADOG_APP_KEY DATADOG_SITE DD_API_KEY DD_APP_KEY DD_SITE P6_DFZ_PROFILE_DATADOG
#>
######################################################################
p6df::modules::datadog::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"
  p6_env_export "P6_DFZ_PROFILE_DATADOG" "$profile"

  # Support common DD_* aliases while keeping DATADOG_* canonical.
  if p6_string_blank "$DATADOG_API_KEY" && p6_string_blank_NOT "$DD_API_KEY"; then
    p6_env_export "DATADOG_API_KEY" "$DD_API_KEY"
  fi
  if p6_string_blank "$DATADOG_APP_KEY" && p6_string_blank_NOT "$DD_APP_KEY"; then
    p6_env_export "DATADOG_APP_KEY" "$DD_APP_KEY"
  fi
  if p6_string_blank "$DATADOG_SITE"; then
    p6_env_export "DATADOG_SITE" "datadoghq.com"
  fi
  if p6_string_blank "$DD_API_KEY" && p6_string_blank_NOT "$DATADOG_API_KEY"; then
    p6_env_export "DD_API_KEY" "$DATADOG_API_KEY"
  fi
  if p6_string_blank "$DD_APP_KEY" && p6_string_blank_NOT "$DATADOG_APP_KEY"; then
    p6_env_export "DD_APP_KEY" "$DATADOG_APP_KEY"
  fi
  if p6_string_blank "$DD_SITE" && p6_string_blank_NOT "$DATADOG_SITE"; then
    p6_env_export "DD_SITE" "$DATADOG_SITE"
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::datadog::profile::off()
#
#  Environment:	 DATADOG_API_KEY DATADOG_APP_KEY DATADOG_SITE DD_API_KEY DD_APP_KEY DD_SITE P6_DFZ_PROFILE_DATADOG
#>
######################################################################
p6df::modules::datadog::profile::off() {
  p6_env_export_un P6_DFZ_PROFILE_DATADOG
  p6_env_export_un DATADOG_API_KEY
  p6_env_export_un DATADOG_APP_KEY
  p6_env_export_un DATADOG_SITE
  p6_env_export_un DD_API_KEY
  p6_env_export_un DD_APP_KEY
  p6_env_export_un DD_SITE

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::datadog::mcp()
#
#>
######################################################################
p6df::modules::datadog::mcp() {

  p6_js_npm_global_install "datadog-mcp-server"

  p6_return_void
}
