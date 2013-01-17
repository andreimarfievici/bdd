@gui
Feature: Last.fm GUI tests
  As an anonymous user
  I can search for data
  So that I can listen to my favorite music

  Background: Navigate to Home Page
    Given I navigate to http://www.last.fm

    Scenario: User can search for music data
      When I search for Johnny Cash
      Then I get results back

    @t
    Scenario Outline: : User can search for Artists
    When I search for <search_string>
    And I filter for <filter>
    Then I get filtered results back
    Examples:
      |search_string| |filter       |
      |Radiohead    | |Artists      |
      |Prodigy      | |Albums       |
      |AC/DC        | |Tracks       |

