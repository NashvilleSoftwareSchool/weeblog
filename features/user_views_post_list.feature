Feature: User view post list

  Scenario:
    Given I have a post with title "Foo" and body "Foo Bar"
    And I have a post with title "Hello" and body "Hello, World"
    When I go to the homepage
    Then I should see the title "Foo"
    And I should see "Bar"
    And I should see the title "Hello"
    And I should see "World"

  Scenario: Linking to/from post show page
    Given I have a post with title "Foo" and body "Foo Bar"
    And I am on the homepage
    When I click "Foo"
    Then I should be on that blog post's page
    When I click "View All Posts"
    Then I should be on the homepage
