Feature: User sends email
  As a user
  In order to contact the site owner
  I want to send an email

  Acceptance Criteria:
  * Email must have from, subject and message
  * Email must sent to the given recipient

  Scenario: Happy Path
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "ben@example.com" for "From"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Message"
    And I press "Send Email"
    Then I should see "Your email was sent successfully"
    Then save and open all raw emails
    And "ben2d2@gmail.com" should receive 1 email with subject "This is a subject"
  
  Scenario: User attempts to skip from
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "" for "From"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Message"
    And I press "Send Email"
    Then I should not see "Your email was sent successfully"
    And I should see "" in the "From" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "This is a message" in the "Message" field
    And I should see "Your message could not be sent. PLease make sure you have completed all fields."

  Scenario: User attempts to skip subject
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "ben@example.com" for "From"
    And I fill in "" for "Subject"
    And I fill in "This is a message" for "Message"
    And I press "Send Email"
    Then I should not see "Your email was sent successfully"
    And I should see "ben@example.com" in the "From" field
    And I should see "" in the "Subject" field
    And I should see "This is a message" in the "Message" field
    And I should see "Your message could not be sent. PLease make sure you have completed all fields."

  Scenario: User attempts to skip message
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "ben@example.com" for "From"
    And I fill in "This is a subject" for "Subject"
    And I fill in "" for "Message"
    And I press "Send Email"
    Then I should not see "Your was sent successfully"
    And I should see "ben@example.com" in the "From" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "" in the "Message" field
    And I should see "Your message could not be sent. PLease make sure you have completed all fields."
