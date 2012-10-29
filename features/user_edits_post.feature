Feature: User edits post

  Background:
    Given I have a post with title "Foo" and body "Bar"
    And I am on that blog post's page

  Scenario: Successful edit
    When I click "Edit Post"
    And I fill in "Food" for "Title"
    And I fill in "At a bar-b-que" for "Body"
    And I press "Update Post"
    Then I should be on that blog post's page
    And I should see the title "Food"
    And I should see "At a bar-b-que"

  Scenario: Unsuccessful edit
    When I click "Edit Post"
    And I fill in "This will be there" for "Title"
    And I fill in "" for "Body"
    And I press "Update Post"
    Then I should see "Body can't be blank"
    And I should see "This will be there" in the "Title" field
