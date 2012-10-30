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

  Scenario: User attempts to skip title
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I press "Publish"
    Then I should not see "Your post has been published"
    And I should see "" in the "Title" field
    And I should see "Actually, they aren't" in the "Body" field
    And I should see "Title can't be blank"

  Scenario: User attempts to skip body
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "This is a title" for "Title"
    And I fill in "" for "Body"
    And I press "Publish"
    Then I should not see "Your post has been published"
    And I should see "This is a title" in the "Title" field
    And I should see "" in the "Body" field
    And I should see "Body can't be blank"

  Scenario: User creates two posts and views from home page
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I press "Publish"
    Then I should see "Your post has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    And I click "Home Page"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I press "Publish"
    Then I should see "Your post has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    And I click "Home Page"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"




