@wip
Feature: User adds rss feed

  Scenario: User sees rss feed
    Given I am on the homepage
    And I click "RSS Feed"
    Then I should be on the rss feed page
    Then I should see all rss feeds
