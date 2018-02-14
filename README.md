
![](shodan.png)

<!-- README.md is generated from README.Rmd. Please edit that file -->

shodan is an R package interface to the [Shodan
API](https://developer.shodan.io/api/requirements).

NOTE that the [Shodan Streaming
API](https://developer.shodan.io/api/stream) function are *not*
implemented.

Also, most of the functions return `list` data structures given the
nested structure of the Shodan query results. Functions like
`shodan_ports()` will sanely return simple vectors and others like
`shodan_protocols()` will return plain `data.frames`. I am *very* open
to collaboration to ensure the return types are as useful to callers.
File an issue or e-mail/tweet me if interested.

The package expects `SHODAN_API_KEY` to be in the environment and the
easiest way to do that is to stick it in your `.Renviron` file.

The following functions are implemented:

  - `account_profile`: Account Profile
  - `api_info`: API Plan Information
  - `honeyscore` : Honeyport or not?
  - `host_count`: Search Shodan without Results
  - `host_info`: Host Information
  - `my_ip`: My IP Address
  - `query_tags`: List the most popular tags
  - `resolve`: DNS Lookup
  - `reverse`: Reverse DNS Lookup
  - `shodan_api_key`: Get or set SHODAN\_API\_KEY value
  - `shodan_exploit_search`: Search for Exploits
  - `shodan_exploit_search_count`: Search for Exploits without Results
  - `shodan_ports`: List all ports that Shodan is crawling on the
    Internet.
  - `shodan_protocols`: List all protocols that can be used when
    performing on-demand Internet scans via Shodan.
  - `shodan_query_list`: List the saved search queries
  - `shodan_query_search`: Search the directory of saved search queries.
  - `shodan_scan`: Request Shodan to crawl an IP/ netblock
  - `shodan_scan_internet`: Crawl the Internet for a specific port and
    protocol using Shodan
  - `shodan_search`: Search Shodan
  - `shodan_search_tokens`: Break the search query into tokens
  - `shodan_services`: List all services that Shodan crawls

## Installation

``` r
devtools::install_github("hrbrmstr/shodan")
```

## Usage

``` r
library(shodan)
library(tibble) # for printing

# current verison
packageVersion("shodan")
#> [1] '0.0.0.9000'

shodan_ports()
#>   [1]     7    11    13    15    17    19    21    22    23    25    26    37    49    53    69    70    79    80    81
#>  [20]    82    83    84    88   102   104   110   111   113   119   123   129   137   143   161   175   179   195   311
#>  [39]   389   443   444   445   465   500   502   503   515   520   523   554   587   623   626   631   636   666   771
#>  [58]   789   873   902   992   993   995  1010  1023  1025  1099  1177  1200  1234  1311  1400  1434  1471  1515  1521
#>  [77]  1599  1604  1723  1741  1777  1883  1900  1911  1962  1991  2000  2067  2081  2082  2083  2086  2087  2123  2152
#>  [96]  2181  2222  2323  2332  2375  2376  2379  2404  2455  2480  2628  3000  3001  3128  3260  3283  3299  3306  3310
#> [115]  3386  3388  3389  3460  3541  3542  3689  3702  3749  3780  3784  3790  4000  4022  4040  4063  4064  4070  4369
#> [134]  4443  4444  4500  4567  4664  4730  4782  4786  4800  4840  4848  4911  4949  5000  5001  5006  5007  5008  5009
#> [153]  5060  5094  5222  5269  5353  5357  5432  5555  5560  5577  5601  5632  5672  5683  5800  5801  5858  5900  5901
#> [172]  5938  5984  5985  5986  6000  6001  6379  6664  6666  6667  6881  6969  7071  7218  7474  7547  7548  7657  7777
#> [191]  7779  8000  8001  8008  8009  8010  8060  8069  8080  8081  8086  8087  8089  8090  8098  8099  8112  8126  8139
#> [210]  8140  8181  8333  8334  8443  8554  8649  8800  8834  8880  8888  8889  9000  9001  9002  9009  9042  9051  9080
#> [229]  9100  9151  9160  9191  9200  9306  9418  9443  9595  9600  9869  9943  9944  9981  9999 10000 10001 10243 10554
#> [248] 11211 11300 12345 13579 14147 16010 16992 16993 17000 18081 18245 20000 20547 21025 21379 23023 23424 25105 25565
#> [267] 27015 27016 27017 28015 28017 30718 32400 32764 37777 44818 47808 48899 49152 49153 50070 50100 51106 53413 54138
#> [286] 55443 55553 55554 62078 64738

shodan_protocols()
#> # A tibble: 169 x 2
#>    protocol             description                                                                     
#>    <chr>                <chr>                                                                           
#>  1 amqp                 Grab information from an AMQP service                                           
#>  2 andromouse           Checks whether the device is running the remote mouse AndroMouse service.       
#>  3 apple-airport-admin  Check whether the device is an Apple AirPort administrative interface.          
#>  4 ard                  Query the Apple Remote Desktop service for information about the device         
#>  5 automated-tank-gauge Get the tank inventory for a gasoline station.                                  
#>  6 bacnet               Gets various information from a BACnet device.                                  
#>  7 beanstalk            Get general information about the Beanstalk daemon                              
#>  8 bgp                  Checks whether the device is running BGP.                                       
#>  9 bitcoin              Grabs information about a Bitcoin daemon, including any devices connected to it.
#> 10 bittorrent-tracker   Check whether there is a BitTorrent tracker running.                            
#> # ... with 159 more rows

resolve("google.com")
#> # A tibble: 1 x 2
#>   host       ip           
#>   <chr>      <chr>        
#> 1 google.com 172.217.11.14

reverse("172.217.3.110")
#> # A tibble: 1 x 2
#>   ip            host                     
#>   <chr>         <chr>                    
#> 1 172.217.3.110 lga34s18-in-f14.1e100.net

query_tags()$matches
#>    count  value
#> 1    155 webcam
#> 2    112 camera
#> 3    111    cam
#> 4     77  scada
#> 5     75 router
#> 6     63    ftp
#> 7     61     ip
#> 8     59 server
#> 9     48   test
#> 10    40   http

shodan_query_list()$matches
#>    votes                              description                         tags                  timestamp
#> 1      2                                                                       2018-02-14T15:27:28.897000
#> 2      2                                                                       2018-02-14T07:43:47.392000
#> 3      3                                                                       2018-02-13T11:16:24.108000
#> 4      4 They are controlled cameras, mostly open      webcam, ip-cam, cameras 2018-02-12T21:46:10.954000
#> 5      3             Dahua DVR IPCAMS admin/admin webcam, netcam, surveillance 2018-02-12T16:38:27.835000
#> 6      1                                                                       2018-02-12T08:26:01.008000
#> 7      1                                   Doosan                              2018-02-11T21:18:33.365000
#> 8      2                                    tò mò                     viet nam 2018-02-11T18:53:07.799000
#> 9      1                                    tò mò                            h 2018-02-11T18:38:05.345000
#> 10     4                                     cams                              2018-02-11T15:22:14.649000
#>                        title                    query
#> 1                   eurocell                     hare
#> 2                  magdeburg    Logitech Media Server
#> 3                    türkiye             192.168.1.36
#> 4  Controllable AXIS cameras title:"Live view - AXIS"
#> 5                      Dahua port:37777 product:dahua
#> 6                     twonky      Twonky country:"us"
#> 7                     Doosan                   doosan
#> 8                   viet nam   http.title:"Hacked by"
#> 9                 thành viên               org:Google
#> 10                   celular                  popular
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
