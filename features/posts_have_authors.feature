Feature: Posts have authors

  Scenario: I can't see the post link if I'm not logged in
    Given I am on the homepage
    Then I should not see "Write Post"

  Scenario: When I write a post, it is displayed with my name
    Given I am signed in as "eliza@example.com"
    And I am on the homepage
    When I click "Write Post"
    And I fill in "Foo" for "Title"
    And I fill in "Bar and Grille" for "Body"
    And I press "Publish"
    Then I should see "Your post has been published"
    And I should see "By: eliza@example.com"
    When I sign out
    Then I should be on the homepage
    When I click "Foo"
    Then I should see "By: eliza@example.com"
