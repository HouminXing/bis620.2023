
#' @title Print "hello world"
#' @description Print the hello world function to the console with parameter
#' say who to say hello to.
#' @param who Who to say hello to. (Default is "world")
#' @examples
#' hello("people in BIS620")
#' @export
hello <- function(who = "world") {
  sprintf("Hello, %s!", who)
  # paste0("Hello, ", who, "!")
}

# The license in DESCRIPTION file prevents liability and controls how the codes
# will be used.
# NAMESPACE: documents which functions will be exported
# export: not hidden to the users

# we can add datasets to the package
# CRAN monitors R packages as well as stream dependencies
