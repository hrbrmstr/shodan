#' List all ports that Shodan is crawling on the Internet.
#'
#' This method returns a list of port numbers that the crawlers are looking for.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_ports()
shodan_ports <- function() {
  res <- httr::GET(
    shodan_base_url,
    path = "shodan/ports",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' List all protocols that can be used when performing on-demand Internet
#' scans via Shodan.
#'
#' This method returns an object containing all the protocols that can be
#' used when launching an Internet scan.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_protocols()
shodan_protocols <- function() {
  res <- httr::GET(
    shodan_base_url,
    path = "shodan/protocols",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  tmp <- jsonlite::fromJSON(httr::content(res, as = "text"))

  data.frame(
    protocol = names(tmp),
    description = unlist(tmp, use.names = FALSE),
    stringsAsFactors = FALSE
  ) -> out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out
}


#' List all services that Shodan crawls
#'
#' This method returns an object containing all the services that the Shodan
#' crawlers look at. It can also be used as a quick and practical way to
#' resolve a port number to the name of a service.
#'
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_services()
shodan_services <- function() {
  res <- httr::GET(
    shodan_base_url,
    path = "shodan/services",
    query = list(key = shodan_api_key())
  )

  httr::stop_for_status(res)

  tmp <- jsonlite::fromJSON(httr::content(res, as = "text"))

  data.frame(
    service = names(tmp),
    description = unlist(tmp, use.names = FALSE),
    stringsAsFactors = FALSE
  ) -> out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out
}
