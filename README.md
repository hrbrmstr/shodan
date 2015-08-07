<!-- README.md is generated from README.Rmd. Please edit that file -->
shodan is an R package interface to the [Shodan API](https://developer.shodan.io/api/requirements).

NOTE that the [Shodan Streaming API](https://developer.shodan.io/api/stream) function are *not* implemented.

Also, most of the functions return `list` data structures given the nested structure of the Shodan query results. Functions like `shodan_ports()` will sanely return simple vectors and others like `shodan_protocols()` will return plain `data.frames`. I am *very* open to collaboration to ensure the return types are as useful to callers. File an issue or e-mail/tweet me if interested.

The package expects `SHODAN_API_KEY` to be in the environment and the easiest way to do that is to stick it in your `.Renviron` file.

The following functions are implemented:

-   `account_profile`: Account Profile
-   `api_info`: API Plan Information
-   `host_count`: Search Shodan without Results
-   `host_info`: Host Information
-   `my_ip`: My IP Address
-   `query_tags`: List the most popular tags
-   `resolve`: DNS Lookup
-   `reverse`: Reverse DNS Lookup
-   `shodan_api_key`: Get or set SHODAN\_API\_KEY value
-   `shodan_exploit_search`: Search for Exploits
-   `shodan_exploit_search_count`: Search for Exploits without Results
-   `shodan_ports`: List all ports that Shodan is crawling on the Internet.
-   `shodan_protocols`: List all protocols that can be used when performing on-demand Internet scans via Shodan.
-   `shodan_query_list`: List the saved search queries
-   `shodan_query_search`: Search the directory of saved search queries.
-   `shodan_scan`: Request Shodan to crawl an IP/ netblock
-   `shodan_scan_internet`: Crawl the Internet for a specific port and protocol using Shodan
-   `shodan_search`: Search Shodan
-   `shodan_search_tokens`: Break the search query into tokens
-   `shodan_services`: List all services that Shodan crawls

### News

-   Version 0.0.0.9000 released

### Installation

``` r
devtools::install_github("hrbrmstr/shodan")
```

### Usage

``` r
library(shodan)

# current verison
packageVersion("shodan")
#> [1] '0.0.0.9000'

shodan_ports()
#>   [1]     7    11    13    15    17    19    21    22    23    25    26    37    53    67    79    80    81    82    83
#>  [20]    84    88   102   110   111   119   123   129   137   143   161   179   195   311   389   443   444   445   465
#>  [39]   500   502   503   515   520   523   554   623   626   631   666   771   789   873   902   992   993   995  1010
#>  [58]  1023  1025  1177  1200  1234  1311  1434  1471  1604  1723  1883  1900  1911  1962  1991  2067  2082  2083  2086
#>  [77]  2087  2123  2152  2181  2222  2323  2332  2375  2376  2404  2455  2480  2628  3000  3128  3306  3386  3388  3389
#>  [96]  3460  3689  3749  3780  3784  3790  4000  4022  4040  4369  4443  4444  4500  4848  4911  4949  5000  5001  5006
#> [115]  5007  5008  5009  5060  5094  5222  5353  5357  5432  5555  5560  5632  5900  5901  5985  5986  6000  6379  6664
#> [134]  6666  7071  7218  7474  7547  7548  7657  7777  8000  8069  8080  8081  8086  8087  8089  8090  8098  8099  8112
#> [153]  8139  8140  8181  8333  8334  8443  8554  8649  8834  8888  9000  9001  9002  9051  9080  9100  9151  9160  9191
#> [172]  9200  9443  9595  9600  9943  9944  9981  9999 10000 10001 10243 11211 12345 14147 16010 18245 20000 20547 21379
#> [191] 23424 25565 27015 27017 28017 32400 32764 37777 44818 47808 49152 49153 50100 51106 55553 55554 62078 64738

shodan_protocols()
#>                        protocol
#> 1                    andromouse
#> 2           apple-airport-admin
#> 3          automated-tank-gauge
#> 4                        bacnet
#> 5                           bgp
#> 6                       bitcoin
#> 7                   blackshades
#> 8                     cassandra
#> 9                   citrix-apps
#> 10                      codesys
#> 11                    dahua-dvr
#> 12                         dhcp
#> 13                   dictionary
#> 14                         dnp3
#> 15                      dns-tcp
#> 16                      dns-udp
#> 17                     echo-udp
#> 18                         epmd
#> 19                   ethernetip
#> 20               ethernetip-udp
#> 21                          fox
#> 22                          ftp
#> 23        general-electric-srtp
#> 24                       gtp-v1
#> 25                  hart-ip-udp
#> 26                        hbase
#> 27                    hbase-old
#> 28                         http
#> 29                   http-check
#> 30             http-rcs-galileo
#> 31                  http-simple
#> 32              http-supermicro
#> 33                        https
#> 34                  ibm-db2-das
#> 35                      idevice
#> 36                      iec-104
#> 37                    iec-61850
#> 38                          ike
#> 39                    ike-nat-t
#> 40                         imap
#> 41                     imap-ssl
#> 42                         ipmi
#> 43                     kamstrup
#> 44                     kerberos
#> 45                         ldap
#> 46          line-printer-daemon
#> 47                 matrikon-opc
#> 48                         mdns
#> 49                 melsec-q-tcp
#> 50                 melsec-q-udp
#> 51                     memcache
#> 52                    minecraft
#> 53                       modbus
#> 54                      mongodb
#> 55                         mqtt
#> 56               ms-sql-monitor
#> 57                mumble-server
#> 58                        munin
#> 59                        mysql
#> 60                       natpmp
#> 61                      netbios
#> 62                  netmobility
#> 63                  newline-tcp
#> 64                  newline-udp
#> 65                        njrat
#> 66                         nntp
#> 67                   nodata-tcp
#> 68                          ntp
#> 69                  nuclear-rat
#> 70                    omron-tcp
#> 71            pcanywhere-status
#> 72                       pcworx
#> 73                         plc5
#> 74               poison-ivy-rat
#> 75                         pop3
#> 76                     pop3-ssl
#> 77                  portmap-tcp
#> 78                   postgresql
#> 79                         pptp
#> 80         printer-job-language
#> 81                     proconos
#> 82                        rdate
#> 83                          rdp
#> 84                     realport
#> 85                        redis
#> 86             redlion-crimson3
#> 87                         riak
#> 88                          rip
#> 89                        rsync
#> 90                     rtsp-tcp
#> 91                           s7
#> 92                   secure-fox
#> 93               serialnumbered
#> 94                          sip
#> 95                          smb
#> 96                         smtp
#> 97                        smtps
#> 98                         snmp
#> 99                          ssh
#> 100 steam-dedicated-server-rcon
#> 101                      telnet
#> 102                     telnets
#> 103                 tor-control
#> 104                tor-versions
#> 105                 toshiba-pos
#> 106                       udpxy
#> 107                        upnp
#> 108                    ventrilo
#> 109                   voldemort
#> 110                      wdbrpc
#> 111                   wemo-http
#> 112                         x11
#> 113                        xmpp
#> 114               yahoo-smarttv
#> 115                   zookeeper
#>                                                                                                description
#> 1                                Checks whether the device is running the remote mouse AndroMouse service.
#> 2                                   Check whether the device is an Apple AirPort administrative interface.
#> 3                                                           Get the tank inventory for a gasoline station.
#> 4                                                           Gets various information from a BACnet device.
#> 5                                                                Checks whether the device is running BGP.
#> 6                         Grabs information about a Bitcoin daemon, including any devices connected to it.
#> 7                                                  Determine whether a server is running a Blackshades C&C
#> 8                                             Get cluster information for the Cassandra database software.
#> 9    This module attempts to query Citrix Metaframe ICA server to obtain a published list of applications.
#> 10                                                                       Grab a banner for Codesys daemons
#> 11                                                         Grab the serial number from a Dahua DVR device.
#> 12                   Send a DHCP INFORM request to learn about the lease information from the DHCP server.
#> 13                                                Connects to a dictionary server using the DICT protocol.
#> 14                                                                   A dump of data from a DNP3 outstation
#> 15                                   Try to determine the version of a DNS server by grabbing version.bind
#> 16                                   Try to determine the version of a DNS server by grabbing version.bind
#> 17                                                              Checks whether the device is running echo.
#> 18                                       Get a list of Erlang services and the ports they are listening on
#> 19                                          Grab information from a device supporting EtherNet/IP over TCP
#> 20                                          Grab information from a device supporting EtherNet/IP over UDP
#> 21                                                  Grabs a banner for proprietary FOX protocol by Tridium
#> 22                                                                                     Grab the FTP banner
#> 23                                              Check whether the GE SRTP service is active on the device.
#> 24                                                     Checks whether the device is running a GPRS Tunnel.
#> 25                                                             Checks whether the IP is a HART-IP gateway.
#> 26                                                       Grab the status page for HBase database software.
#> 27                                       Grab the status page for old, deprecated HBase database software.
#> 28                                                                             HTTP banner grabbing module
#> 29                                                      HTTP banner grabbing module for Supermicro servers
#> 30                        Checks whether the web server is actually a Remote Control Server by HackingTeam
#> 31                             Grabs the HTTP banner for a server but doesnt grab robots or anything else.
#> 32                                                      HTTP banner grabbing module for Supermicro servers
#> 33                                                                            HTTPS banner grabbing module
#> 34                                               Grab basic information about the IBM DB2 Database Server.
#> 35                                                     Connects to an iDevice and grabs the property list.
#> 36                                                                Banner grabber for the IEC-104 protocol.
#> 37                                                                                            MMS protocol
#> 38                                                      Checks wheter a device is running a VPN using IKE.
#> 39                                    Checks wheter a device is running a VPN using IKE and NAT traversal.
#> 40                                                              Get the welcome message of the IMAP server
#> 41                                                       Get the welcome message of the secure IMAP server
#> 42                                     Checks whether a device is running IPMI remote management software.
#> 43                                                                                   Kamstrup Smart Meters
#> 44                                  Checks whether a device is running the Kerberos authentication daemon.
#> 45                                                                             LDAP banner grabbing module
#> 46                                Get a list of jobs in the print queue to verify the device is a printer.
#> 47                                                      Checks whether the device is running Matrikon OPC.
#> 48                                                Perform a DNS-based service discovery over multicast DNS
#> 49                                        Get the CPU information from a Mitsubishi Electric Q Series PLC.
#> 50                                        Get the CPU information from a Mitsubishi Electric Q Series PLC.
#> 51                                                       Get general information about the Memcache daemon
#> 52                                              Gets the server status information from a Minecraft server
#> 53                                             Grab the Modbus device information via functions 17 and 43.
#> 54                                                    Collects system information from the MongoDB daemon.
#> 55                                                     Grab a list of recent messages from an MQTT broker.
#> 56                                                                          Pings an MS-SQL Monitor server
#> 57                                    Grabs the version information for the Murmur service (Mumble server)
#> 58                                               Check whether a Munin node is active and list its plugins
#> 59                                                           Grabs the version of the running MySQL server
#> 60                                                        Checks whether NAT-PMP is exposed on the device.
#> 61                                                     Grab NetBIOS information including the MAC address.
#> 62                                                             Checks whether the device is a NetMobility.
#> 63                                                        Connect to a server with TCP and send a newline.
#> 64                                                        Connect to a server with UDP and send a newline.
#> 65                                                       Determine whether a server is running a njRAT C&C
#> 66                                                        Get the welcome message of a Network News server
#> 67                             Connect to a server without sending any data and store whatever it returns.
#> 68                             Get a list of IPs that NTP server recently saw and try to get version info.
#> 69                                                      Checks whether the device is a C2 for Nuclear RAT.
#> 70                                                                   Gets information about the Omron PLC.
#> 71                                               Asks the PC Anywhere status daemon for basic information.
#> 72                                                                   Gets information about the Omron PLC.
#> 73                                                        Checks whether the device is running Poison Ivy.
#> 74                                                        Checks whether the device is running Poison Ivy.
#> 75                                                                           Grab the POP3 welcome message
#> 76                                                                    Grab the secure POP3 welcome message
#> 77                                               Get a list of processes that are running and their ports.
#> 78                                                  Collects system information from the PostgreSQL daemon
#> 79                                                                                        Connect via PPTP
#> 80                                             Get the current output from the status display on a printer
#> 81                                               Gets information about the PLC via the ProConOs protocol.
#> 82                                                                 Get the time from a remote rdate server
#> 83                                                                              RDP banner grabbing module
#> 84                                                             Get the banner for the Digi Realport device
#> 85                                                                            Redis banner grabbing module
#> 86                                            A fingerprint for the Red Lion HMI devices running CrimsonV3
#> 87                                                                      Sends a ServerInfo request to Riak
#> 88                                  Checks whether the device is running the Routing Information Protocol.
#> 89                                                             Get a list of shares from the rsync daemon.
#> 90                                                         Determine which options the RTSP server allows.
#> 91                                  Communicate using the S7 protocol and grab the device identifications.
#> 92                                                  Grabs a banner for proprietary FOX protocol by Tridium
#> 93     Checks for other servers with the same serial number on the local network. AAAAAA is a dummy value.
#> 94                                                          Gets the options that the SIP device supports.
#> 95                                  Grab a list of shares exposed through the Server Message Block service
#> 96                                                                          Get basic SMTP server response
#> 97                                                         Grab a banner and certificate for SMTPS servers
#> 98                                                            Gets the sysDescr.0 MIB of the SNMP service.
#> 99                                                        Get the SSH banner, its host key and fingerprint
#> 100   Checks whether an IP is running as a Steam dedicated game server with remote authentication enabled.
#> 101                                                                          Telnet banner grabbing module
#> 102                                                           Telnet wrapped in SSL banner grabbing module
#> 103                                            Checks whether a device is running the Tor control service.
#> 104                                              Checks whether the device is running the Tor OR protocol.
#> 105                                                    Grabs device information for the IBM/ Toshiba 4690.
#> 106                                                                           Udpxy banner grabbing module
#> 107                                                                  Collects device information via UPnP.
#> 108                                           Gets the detailed status information from a Ventrilo server.
#> 109                                                                          Pings the Voldemort database.
#> 110                      Checks whehter the WDB agent (used for debugging) is enabled on a VxWorks device.
#> 111                                                     Connect to a Wemo Link and grab the setup.xml file
#> 112                                               Connect to X11 w/ no auth and grab the resulting banner.
#> 113                                                               Sends a hello request to the XMPP daemon
#> 114                  Checks whether the device is running the Yahoo Smart TV device communication service.
#> 115                                                     Grab statistical information from a Zookeeper node

resolve("dds.ec")
#>     host            ip
#> 1 dds.ec 162.243.111.4

reverse("162.243.111.4")
#>              ip   host
#> 1 162.243.111.4 dds.ec

query_tags()$matches
#>    count  value
#> 1     73 webcam
#> 2     68  scada
#> 3     52   test
#> 4     51   http
#> 5     47 router
#> 6     46    cam
#> 7     45    ftp
#> 8     41 camera
#> 9     30  cisco
#> 10    28      1

shodan_query_list()$matches
#>    votes             description             title                  timestamp         tags             query
#> 1      1 busqueada simple gamesa            Gamesa 2015-08-07T12:36:57.892000       gamesa            gamesa
#> 2      7             Spy webcams               spy 2015-08-07T02:11:46.658000          cam        tablet cam
#> 3      8                  dsfdas           Uruguay 2015-08-05T12:03:48.784000           25        country:UY
#> 4     17             Hidden cams       Hidden cams 2015-08-04T09:17:30.992000 hidden, cams        Hidden cam
#> 5      2                     500 Matrix VoIPServer 2015-08-04T02:21:01.857000          500 Matrix VoIPServer
#> 6      2                     xml               xml 2015-08-03T19:19:47.140000          xml               xml
#> 7     20                     php               php 2015-08-01T15:15:31.954000          php       ericsson.se
#> 8      5                   chile           Cortexa 2015-08-01T02:43:13.565000        chile           Cortexa
#> 9      6                    gnam              xmls 2015-07-31T22:07:55.437000          xml             xmlns
#> 10    33                     hts                eh 2015-07-30T13:19:00.807000          str   118.171.213.215
```

### Test Results

``` r
library(shodan)
library(testthat)

date()
#> [1] "Fri Aug  7 09:46:26 2015"

test_dir("tests/")
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
