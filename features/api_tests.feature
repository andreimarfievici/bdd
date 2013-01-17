@api
Feature: Last.fm API tests
  As an anonymous user
  I can make RESTful calls to get music data

  Background: User connects to the Last.fm API
    Given that I am connected to the Last.fm API

    Scenario Outline: User can search for Artists, Albums, Tracks, Tags, Labels
      When I request GET ?method=<search_filter>.search&<search_filter>=<search_string>&api_key=bded920a1248464a98a5208710aff0c5&
        Then the response status code should be 200 OK
        And I get back results
     Examples:
      |search_string|  |search_filter|
      |Radiohead    |  |artist       |
      |Prodigy      |  |album        |
      |AC/DC        |  |track        |

