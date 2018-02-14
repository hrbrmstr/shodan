#' Host Information
#'
#' Returns all services that have been found on the given host IP.
#'
#' @param ip Host IP address
#' @param history \code{TRUE} == all historical banners should be returned
#'        (default: \code{FALSE})
#' @param minify \code{TRUE} == only return the list of ports and the general
#'        host information, no banners. (default: \code{FALSE})
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' host_info("41.21.249.170")
host_info <- function(ip, history=FALSE, minify=FALSE) {
  res <- httr::GET(
    shodan_base_url,
    path = sprintf("shodan/host/%s", ip),
    query = list(
      history = history,
      minify = minify,
      key = shodan_api_key()
    )
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}
