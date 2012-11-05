Feature: User can reply to comments

  Scenario: Successful post
    Given there is a blog post
    And that post has the following comment:
      | commenter | Bob               |
      | message   | This is terrible. |
    And I am on that blog post's page
    When I click "Reply to Bob" within Bob's comment
    And I fill in "Eliza" for "Name" within Bob's comment
    And I fill in "Untrue." for "Comment" within Bob's comment
    And I press "Post Reply" within Bob's comment
    Then I should see "Your reply has been posted"
    And I should be on that blog post's page
    And I should see "Eliza says: Untrue."
