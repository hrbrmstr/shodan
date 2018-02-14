#' Get or set SHODAN_API_KEY value
#'
#' The API wrapper functions in this package all rely on a Shodan API
#' key residing in the environment variable \code{SHODAN_API_KEY}. The
#' easiest way to accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @param force Force setting a new Shodan API key for the current environment?
#' @return atomic character vector containing the Shodan API key
#' @export
shodan_api_key <- function(force = FALSE) {
  env <- Sys.getenv("SHODAN_API_KEY")
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop(
      "Please set env var SHODAN_API_KEY to your Shodan API key",
      call. = FALSE
    )
  }

  message("Couldn't find env var SHODAN_API_KEY See ?shoan_api_key for more details.")
  message("Please enter your Shodan API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Shodan API key entry failed", call. = FALSE)
  }

  message("Updating SHODAN_API_KEY env var to PAT")
  Sys.setenv(SHODAN_API_KEY = pat)

  pat
}
