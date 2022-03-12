######################################################################
#<
#
# Function: p6df::modules::datadog::deps()
#
#>
######################################################################
p6df::modules::datadog::deps() {
  ModuleDeps=(
    p6m7g8/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::datadog::langs()
#
#  Depends:	 p6_github
#>
######################################################################
p6df::modules::datadog::langs() {

  pip install datadog # dog cli

  p6_github_util_org_repo_clone DataDog
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
