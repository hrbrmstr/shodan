#' Honeypot or not?
#'
#' Calculates a honeypot probability score ranging from 0 (not a honeypot) to 1.0 (is a honeypot).
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' honeyscore("194.46.36.223")
honeyscore <- function(ip) {
  res <- httr::GET(
    shodan_base_url,
    path = sprintf("/labs/honeyscore/%s", ip[1]),
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}
