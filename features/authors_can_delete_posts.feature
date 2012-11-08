Feature: Authors can delete posts

  Scenario: I can delete a post I wrote
    Given I am signed in as "eliza@example.com"
    Given I have created a blog post with title "foo" and body "bar"
    When I go to the homepage
    And I click "Delete this post"
    Then I should see "Your post has been deleted"
    And I should be on the homepage
    And I should not see the title "foo"
    And I should not see "Foo Bar"

  Scenario: I cannot delete posts if I am not signed in
    Given I am not signed in
    Given the following post:
      | title     | foo     |
      | body      | Foo Bar |
    When I go to the homepage
    Then I should not see "Delete this post"
    And I should be on the homepage
    And I should see the title "foo"
    And I should see "Foo Bar"

  Scenario: I cannot delete posts I didn't write
    Given the following post:
      | title     | foo     |
      | body      | Foo Bar |
    Given I am signed in as a user that did not write the post
    When I go to the homepage
    Then I should not see "Delete this post"
    And I should be on the homepage
    And I should see the title "foo"
    And I should see "Foo Bar"

