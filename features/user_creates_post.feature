Feature: User creates post
  As a user
  In order to share my thoughts with the world
  I want to publish a blog post

  Acceptance Criteria:
  * Post must have title and body
  * Post must be publicly visible once saved

  Scenario: Happy Path
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I press "Publish"
    Then I should see "Your post has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"

  @wip
  Scenario: User attempts to skip title
    Given this is pending

  @wip
  Scenario: User attempts to skip body
    Given this is pending
