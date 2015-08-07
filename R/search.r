#' Search Shodan
#'
#' Search Shodan using the same query syntax as the website and use facets to
#' get summary information for different properties.
#'
#' This method may use API query credits depending on usage. If any of the
#' following criteria are met, your account will be deducated 1 query credit:
#'
#' \itemize{
#'   \item{The search query contains a filter.}
#'   \item{Accessing results past the 1st page using the "page". For every 100
#'         results past the 1st page 1 query credit is deducted.}
#' }
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
#'        supported facets. If \code{length(facets) > 1)} this function will
#'        concatenate the vector with commas to send to Shodan.
#' @param page The page number to page through results \code{100} at a time
#'        (default: \code{1})
#' @param minify \code{TRUE} == truncate some of the larger fields (default: \code{TRUE})
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_search("apache geo:42.9693,-74.1224")
shodan_search <- function(query=NULL, facets=NULL, page=1, minify=TRUE) {

  facets <- paste(facets, collapse=",")

  res <- GET(shodan_base_url,
             path="shodan/host/search",
             query=list(query=query,
                        facets=facets,
                        page=page,
                        minify=minify,
                        key=shodan_api_key()))

  stop_for_status(res)

  fromJSON(content(res, as="text"))

}

#' Break the search query into tokens
#'
#' This method lets you determine which filters are being used by the query
#' string and what parameters were provided to the filters.
#'
#' @param query Shodan search query. The provided string is used to search the
#'        database of banners in Shodan, with the additional option to provide
#'        filters inside the search query using a \code{"filter:value"} format. For
#'        example, the following search query would find Apache webservers
#'        located in Germany: \code{"apache country:DE"}. See
#'        \url{https://developer.shodan.io/api} for all supported search filters.
#' @export
#' @references \url{https://developer.shodan.io/api}
#' @examples
#' shodan_search_tokens("iis net:216.0.0.0/16")
shodan_search_tokens <- function(query=NULL) {

  res <- GET(shodan_base_url,
             path="shodan/host/search/tokens",
             query=list(query=query,
                        key=shodan_api_key()))

  stop_for_status(res)

  fromJSON(content(res, as="text"))

}

#' Search the directory of saved search queries.
#'
#' Use this method to search the directory of search queries that users have
#' saved in Shodan.
#'
#' @param query What to search for in the directory of saved search queries.
#' @param page Page number to iterate over results; each page contains 10 items
#' @references \url{https://developer.shodan.io/api}
#' @export
#' @examples
#' shodan_query_search()
shodan_query_search <- function(query=NULL, page=1) {

  res <- GET(shodan_base_url,
             path="shodan/query/search",
             query=list(query=query,
                        page=page,
                        key=shodan_api_key()))

  stop_for_status(res)

  fromJSON(content(res, as="text"))

}

#' List the saved search queries
#'
#' Use this method to obtain a list of search queries that users have saved
#' in Shodan.
#'
#' @param page Page number to iterate over results; each page contains 10 items
#' @param sort Sort the list based on a property. Possible values are:
#'        "\code{votes}", "\code{timestamp}"
#' @param order Whether to sort the list in ascending or descending order.
#'        Possible values are: "\code{asc}", "\code{desc}"
#' @references \url{https://developer.shodan.io/api}
#' @export
#' @examples
#' shodan_query_list()
shodan_query_list <- function(page=1, sort=NULL, order=NULL) {

  res <- GET(shodan_base_url,
             path="shodan/query",
             query=list(page=page,
                        sort=sort,
                        order=order,
                        key=shodan_api_key()))

  stop_for_status(res)

  fromJSON(content(res, as="text"))

}

