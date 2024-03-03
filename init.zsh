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
  )
}

######################################################################
#<
#
# Function: p6df::modules::datadog::langs()
#
#>
######################################################################
p6df::modules::datadog::langs() {

  pip install datadog
  gem install dogapi
  go get github.com/DataDog/datadog-go
  npm install datadog-metrics
  luarocks install datadog
  cpanm WebService::DataDog
  cargo install datadog

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

  p6_github_login_clone DataDog "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}
