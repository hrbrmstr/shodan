shodan_base_url <- "https://api.shodan.io"

#' Shows the HTTP headers that your client sends when connecting to a webserver.
#'
#' Shows the HTTP headers that your client sends when connecting to a webserver.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' http_headers()
http_headers <- function(ips=NULL) {
  res <- httr::GET(
    shodan_base_url,
    path = "tools/httpheaders ",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' My IP Address
#'
#' Get your current IP address as seen from the Internet.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' my_ip()
my_ip <- function(ips=NULL) {
  res <- httr::GET(
    shodan_base_url,
    path = "tools/myip",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' API Plan Information
#'
#' Returns information about the API plan belonging to the given API key.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' my_ip()
api_info <- function(ips=NULL) {
  res <- httr::GET(
    shodan_base_url,
    path = "api-info",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' Account Profile
#'
#' Returns information about the Shodan account linked to this API key.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' account_profile()
account_profile <- function() {
  res <- httr::GET(
    shodan_base_url,
    path = "account/profile",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' List the most popular tags
#'
#' Use this method to obtain a list of popular tags for the saved search
#' queries in Shodan.
#'
#' @param size The number of tags to return (default: \code{10}).
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' query_tags()
query_tags <- function(size=10) {
  res <- httr::GET(
    shodan_base_url,
    path = "shodan/query/tags",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}
