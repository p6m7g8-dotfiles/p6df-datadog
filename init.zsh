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
# Function: p6df::modules::datadog::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::datadog::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_DIR/ahmedasmar/devops-claude-skills/monitoring-observability"                                 "$HOME/.claude/skills/monitoring-observability"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/fluentbit-generator"               "$HOME/.claude/skills/fluentbit-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/fluentbit-validator"               "$HOME/.claude/skills/fluentbit-validator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/logql-generator"                   "$HOME/.claude/skills/logql-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/loki-config-generator"             "$HOME/.claude/skills/loki-config-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/promql-generator"                  "$HOME/.claude/skills/promql-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/promql-validator"                  "$HOME/.claude/skills/promql-validator"

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
# Function: p6df::modules::datadog::mcp()
#
#>
######################################################################
p6df::modules::datadog::mcp() {

  p6_js_npm_global_install "datadog-mcp-server"

  p6df::modules::anthropic::mcp::server::add "datadog" "npx" "-y" "datadog-mcp-server"
  p6df::modules::openai::mcp::server::add "datadog" "npx" "-y" "datadog-mcp-server"

  p6_return_void
}

######################################################################
#<
#
# Function: words datadog = p6df::modules::datadog::profile::mod()
#
#  Returns:
#	words - datadog
#
#  Environment:	 DATADOG_API_KEY DATADOG_SITE
#>
######################################################################
p6df::modules::datadog::profile::mod() {

  p6_return_words 'datadog' '$DATADOG_SITE' '$DATADOG_API_KEY' 
}
