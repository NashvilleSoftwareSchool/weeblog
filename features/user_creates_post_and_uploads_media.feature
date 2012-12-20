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
    #And I attach "/Users/sam/Desktop/myfile.mov" to "post_image"
    And I fill in "Nature title" for "Video title"
    And I fill in "http://www.youtube.com/watch?v=lHjttmgiW6E" for "post_video_url"
    And I press "Publish"
    Then I should see "Your post has been published"
    And I should see the title "My thoughts are grand"
    And I should see "Actually, they aren't"
    And I should see "Nature title"
    Then I should see the video "video"
    
  Scenario: User must have title for video if it has a URL
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I fill in "" for "Video title"
    And I fill in "http://www.youtube.com/watch?v=lHjttmgiW6E" for "post_video_url"
    And I press "Publish"
    Then I should see "Video title can't be blank"
    
  Scenario: User must have url for video if it has a title
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    When I fill in "My thoughts are grand" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I fill in "Vid title" for "Video title"
    And I fill in "" for "post_video_url"
    And I press "Publish"
    Then I should see "Video url can't be blank"
