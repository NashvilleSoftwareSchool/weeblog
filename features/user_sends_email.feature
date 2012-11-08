Feature: User sends email
  As a user
  In order to contact the site owner
  I want to send an email

  Acceptance Criteria:
  * Email must have Email, subject and message
  * Email must sent to the given recipient

  Scenario: Happy Path
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "Ben" for "Name"
    When I fill in "ben@example.com" for "Email"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Body"
    And I press "Send Email"
    Then I should see "Your email was sent successfully"
    Then save and open all raw emails
    And "ben2d2@gmail.com" should receive 1 email with subject "This is a subject"


  Scenario: User attempts to skip name
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "" for "Name"
    When I fill in "ben@example.com" for "Email"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Body"
    And I press "Send Email"
    Then I should not see "Your email was sent successfully"
    And I should see "" in the "Name" field
    And I should see "ben@example.com" in the "Email" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "This is a message" in the "Body" field
    And I should see "Your message could not be sent. Please make sure you have completed all fields."
 
  
  Scenario: User attempts to skip email
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "Ben" for "Name"
    When I fill in "" for "Email"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Body"
    And I press "Send Email"
    Then I should not see "Your email was sent successfully"
    And I should see "Ben" in the "Name" field
    And I should see "" in the "Email" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "This is a message" in the "Body" field
    And I should see "Your message could not be sent. Please make sure you have completed all fields."

 
  Scenario: User attempts to skip subject
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "Ben" for "Name"
    When I fill in "ben@example.com" for "Email"
    And I fill in "" for "Subject"
    And I fill in "This is a message" for "Body"
    And I press "Send Email"
    Then I should not see "Your email was sent successfully"
    And I should see "Ben" in the "Name" field
    And I should see "ben@example.com" in the "Email" field
    And I should see "" in the "Subject" field
    And I should see "This is a message" in the "Body" field
    And I should see "Your message could not be sent. Please make sure you have completed all fields."

  
  Scenario: User attempts to skip message
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "Ben" for "Name"
    When I fill in "ben@example.com" for "Email"
    And I fill in "This is a subject" for "Subject"
    And I fill in "" for "Body"
    And I press "Send Email"
    Then I should not see "Your was sent successfully"
    And I should see "Ben" in the "Name" field
    And I should see "ben@example.com" in the "Email" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "" in the "Body" field
    And I should see "Your message could not be sent. Please make sure you have completed all fields."


 Scenario: User attempts to enter invalid email
    Given I am on the homepage
    And I click "Contact Us"
    Then I should see "Fill in your email here"
    When I fill in "Ben" for "Name"
    When I fill in "ben@example" for "Email"
    And I fill in "This is a subject" for "Subject"
    And I fill in "This is a message" for "Body"
    And I press "Send Email"
    Then I should not see "Your was sent successfully"
    And I should see "Ben" in the "Name" field
    And I should see "ben@example" in the "Email" field
    And I should see "This is a subject" in the "Subject" field
    And I should see "This is a message" in the "Body" field
    And I should see "Please type a valid email address"
