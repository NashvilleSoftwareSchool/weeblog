@wip
Feature: User can schedule posts for a future date
  As a user
  In order to share my thoughts with the world
  I want to publish a blog post

  Acceptance Criteria:
  * Post must have title, body and publish date
  * Post must be publicly visible only if date is in the past

  Background:
    Given I am signed in

  Scenario: Users schedules post for future
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    And I should see "Publish date"
    When I fill in "My thoughts are the future!" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I select "2013" from "post_publish_date_1i"
    And I select "November" from "post_publish_date_2i"
    And I select "7" from "post_publish_date_3i"
    And I select "13" from "post_publish_date_4i"
    And I select "00" from "post_publish_date_5i"
    And I press "Publish"
    Then I should see "Your post has been scheduled."
    And I should see the title "My thoughts are the future!"
    And I should see "Actually, they aren't"

  Scenario: Users schedules post for the past
    Given I am on the homepage
    And I click "Write Post"
    Then I should see "Fill in your blog post here"
    And I should see "Publish date"
    When I fill in "My thoughts are so outdated!" for "Title"
    And I fill in "Actually, they aren't" for "Body"
    And I select "2012" from "post_publish_date_1i"
    And I select "October" from "post_publish_date_2i"
    And I select "7" from "post_publish_date_3i"
    And I select "13" from "post_publish_date_4i"
    And I select "00" from "post_publish_date_5i"
    And I press "Publish"
    Then I should see "Your post has been published."
    And I should see the title "My thoughts are so outdated!"
    And I should see "Actually, they aren't"
