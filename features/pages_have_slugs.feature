Feature: Pages have fantastic slugs
  Background:
    Given I am signed in

  Scenario: Slugs are made from title
    Given the following post:
      |title| foo |
      |body | Bar |
    And I am on that blog post's page
    Then my URL slug should be "foo"

  Scenario: Slugs are prettified
    Given the following post:
      |title|Batman & Robin|
      |body |slugs         |
    And I am on that blog post's page
    Then my URL slug should be "batman-robin"

  Scenario: Legacy Slugs Redirect
    Given the following post:
      |title| foo |
      |body | Bar |
    And I am on that blog post's page
    And I click "Edit Post"
    And I fill in "foo2" for "Title"
    And I press "Update Post"
    When I go to "foo"
    Then I should be on "/posts/foo2"

