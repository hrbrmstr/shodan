#' DNS Lookup
#'
#' Look up the IP address for the provided list of hostnames.
#'
#' @param hostnames Comma-separated list of hostnames; example
#'        \code{"google.com,bing.com"}. If \code{length(hostnames) > 1}
#'        the entire vector will be converted to a comma-separated parameter
#'        to pass to Shodan.
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' resolve("google.com,bing.com")
#' resolve(c("google.com", "bing.com"))
resolve <- function(hostnames=NULL) {

  hostnames <- paste(hostnames, collapse=",")

  res <- GET(shodan_base_url,
             path="dns/resolve",
             query=list(hostnames=hostnames,
                        key=shodan_api_key()))

  stop_for_status(res)

  tmp <- fromJSON(content(res, as="text"))

  data.frame(host=names(tmp),
             ip=unlist(tmp, use.names=FALSE),
             stringsAsFactors=FALSE)

}

#' Reverse DNS Lookup
#'
#' Look up the hostnames that have been defined for the given list of IP
#' addresses.
#'
#' @param ips Comma-separated list of IP addresses; example
#'        \code{"74.125.227.230,204.79.197.200"}. If \code{length(ips) > 1}
#'        the entire vector will be converted to a comma-separated parameter
#'        to pass to Shodan.
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' reverse("74.125.227.230,204.79.197.200")
#' reverse(c("74.125.227.230", "204.79.197.200"))
reverse <- function(ips=NULL) {

  ips <- paste(ips, collapse=",")

  res <- GET(shodan_base_url,
             path="dns/reverse",
             query=list(ips=ips,
                        key=shodan_api_key()))

  stop_for_status(res)

  tmp <- fromJSON(content(res, as="text"))

  data.frame(ip=names(tmp),
             host=unlist(tmp, use.names=FALSE),
             stringsAsFactors=FALSE)

}
