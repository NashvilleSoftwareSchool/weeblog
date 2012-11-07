Feature: Authors can delete posts

  Scenario: I can delete a post I wrote
    Given I am signed in as "eliza@example.com"
    Given the following posts:
      | title | body         |
      | Foo   | Foo Bar      |
    When I go to the homepage
    And I click "Delete this post"
    Then I should see "Your post has been deleted"
    And I should be on the homepage
    And I should not see the title "Foo"
    And I should not see "Foo Bar"

  Scenario: I cannot delete posts if I am not signed in
    Given I am not signed in
    Given the following posts:
      | title | body         |
      | Foo   | Foo Bar      |
    When I go to the homepage
    Then I should not see "Delete this post"
    And I should be on the homepage
    And I should see the title "Foo"
    And I should see "Foo Bar"

