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

  pip install datadog # dog cli
}

######################################################################
#<
#
# Function: p6df::modules::datadog::clones()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::datadog::clones() {

  p6_github_login_clone DataDog "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::datadog::init()
#
#>
######################################################################
p6df::modules::datadog::init() {
  true
}
