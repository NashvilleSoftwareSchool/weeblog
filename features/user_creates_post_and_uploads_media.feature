@wip
Feature: User creates post and uploads media
  As a user
  In order to share my thoughts with the world
  I want to publish a blog post with media

  Acceptance Criteria:
  * Post must have title and body
  * Post must be publicly visible once saved
  * Post must show media in the post

  
  Background:
    Given I am signed in

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
    And show me the page
    And I attach "/Users/sam/Desktop/myfile.mov" to "media_media"
    And I fill in "My video" for "Title"
    Then I should see "Your post has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    And I should see my video
