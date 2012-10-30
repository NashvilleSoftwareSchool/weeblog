@wip
Feature: User can reply to comments

  Scenario: Successful post
    Given there is a blog post
    And that post has the following comment:
      | commenter | Bob               |
      | message   | This is terrible. |
    And I am on that blog post's page
    # And show me the page
    When I click "Reply to Bob"
    And I fill in "Eliza" for "Name"
    And I fill in "Untrue." for "Comment"
    And I press "Post Reply"
    Then I should see "Your reply has been posted"
    And I should be on that blog post's page
    And I should see "Eliza replied: Untrue."
