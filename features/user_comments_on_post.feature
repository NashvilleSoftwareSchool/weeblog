Feature: User comments on post
  As a person reading a blog post
  In order to be a troll
  I want to write a comment

  Scenario: Happy Path
    Given there is a blog post
    And I am viewing that blog post
    Then I should see "Have a thought? Comment here!"
    When I fill in "John Smith" for "Name"
    And I fill in "I think this is stupid." for "Comment"
    And I press "Create Comment"
    Then I should see "Your comment has been posted"
    And I should be viewing that blog post
    And I should see "John Smith says: I think this is stupid."

  Scenario: Skipping name and comment
    Given there is a blog post
    And I am viewing that blog post
    When I fill in "" for "Name"
    And I fill in "" for "Comment"
    And I press "Create Comment"
    Then I should see "There was a problem posting your comment"
    And I should see "Name can't be blank."
    And I should see "Comment can't be blank."

  Scenario: Skipping name doesn't remove the comment body
    Given there is a blog post
    And I am viewing that blog post
    When I fill in "" for "Name"
    And I fill in "Foo" for "Comment"
    And I press "Create Comment"
    Then I should see "There was a problem posting your comment"
    And I should see "Name can't be blank."
    And I should see "Foo" in the "Comment" field
    And I should not see "says: Foo"

