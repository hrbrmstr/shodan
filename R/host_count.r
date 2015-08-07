#' Search Shodan without Results
#'
#' This method behaves identical to "/shodan/host/search" with the only
#' difference that this method does not return any host results, it only
#' returns the total number of results that matched the query and any facet
#' information that was requested. As a result this method does not consume
#' query credits.
#'
#' Returns all services that have been found on the given host IP.
#'
#' @param query Shodan search query. The provided string is used to search the
#'        database of banners in Shodan, with the additional option to provide
#'        filters inside the search query using a \code{"filter:value"} format. For
#'        example, the following search query would find Apache webservers
#'        located in Germany: \code{"apache country:DE"}. See
#'        \url{https://developer.shodan.io/api} for all supported search filters.
#' @param facets A comma-separated list of properties to get summary information on.
#'        Property names can also be in the format of \code{"property:count"},
#'        where \code{"count"} is the number of facets that will be returned for
#'        a property (i.e. \code{"country:100"} to get the top 100 countries for
#'        a search query). See \url{https://developer.shodan.io/api} for all
#'        supported facets.
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' host_count("41.21.249.170")
host_count <- function(query=NULL, facets=NULL) {

  res <- GET(shodan_base_url,
             path="shodan/host/count",
             query=list(query=query,
                        facets=facets,
                        key=shodan_api_key()),
             verbose())

  stop_for_status(res)

  fromJSON(content(res, as="text"))

}
