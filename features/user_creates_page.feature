Feature: User creates page
  As a user
  In order to share my thoughts with the world
  I want to publish a blog page

  Acceptance Criteria:
  * Post must have title and content
  * Post must be publicly visible once saved

  Background:
    Given I am signed in

  Scenario: Happy Path
    Given I am on the homepage
    And I click "Write Page"
    Then I should see "Fill in your blog page here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Content"
    And I press "Publish"
    Then I should see "Your page has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"

  Scenario: User attempts to skip title
    Given I am on the homepage
    And I click "Write Page"
    Then I should see "Fill in your blog page here"
    When I fill in "" for "Title"
    And I fill in "Actually, they aren't" for "Content"
    And I press "Publish"
    Then I should not see "Your page has been published"
    And I should see "" in the "Title" field
    And I should see "Actually, they aren't" in the "Content" field
    And I should see "Title can't be blank"

  Scenario: User attempts to skip content
    Given I am on the homepage
    And I click "Write Page"
    Then I should see "Fill in your blog page here"
    When I fill in "This is a title" for "Title"
    And I fill in "" for "Content"
    And I press "Publish"
    Then I should not see "Your page has been published"
    And I should see "This is a title" in the "Title" field
    And I should see "" in the "Content" field
    And I should see "Content can't be blank"
