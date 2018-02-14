#' Request Shodan to crawl an IP/ netblock
#'
#' Use this method to request Shodan to crawl a network.
#'
#' This method uses API scan credits: 1 IP consumes 1 scan credit.
#' You must have a paid API plan (either one-time payment or subscription)
#' in order to use this method.
#'
#' @param ips A comma-separated list of IPs or netblocks (in CIDR notation)
#'        that should get crawled. If \code{length(ips) > 1} this funtion
#'        will concatenate the vector into a comma-separated string to
#'        send to Shodan.
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_scan("216.0.0.0/16")
shodan_scan <- function(ips=NULL) {
  ips <- paste(ips, collapse = ",")

  res <- httr::POST(
    shodan_base_url,
    path = "shodan/scan",
    query = list(
      ips = ips,
      key = shodan_api_key()
    )
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}

#' Crawl the Internet for a specific port and protocol using Shodan
#'
#' Use this method to request Shodan to crawl the Internet for a specific port.
#'
#' This method is restricted to security researchers and companies with a
#' Shodan Data license. To apply for access to this method as a researcher,
#' please email <jmath@@shodan.io> with information about your project. Access
#' is restricted to prevent abuse.
#'
#' @param port The port that Shodan should crawl the Internet for.
#' @param protocol The name of the protocol that should be used to interrogate
#'        the port. Run \link{shodan_protocols} for a list of supported protocols.
#' @export
#' @references \url{https://developer.shodan.io/api}
shodan_scan_internet <- function(port=NULL, protocol=NULL) {
  res <- httr::POST(
    shodan_base_url,
    path = "shodan/scan/internet",
    query = list(
      port = port,
      protocol = protocol,
      key = shodan_api_key()
    )
  )

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as = "text"))
}
