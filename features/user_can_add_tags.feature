Feature: User can add tags.

	Background: 
		Given I am signed in
		And I am on the homepage
		
	Scenario: I can add tags
		When I click "Write Post"
		And I fill in "foo" for "Tag"
		And I fill in "hello" for "Title"
		And I fill in "world" for "Body"
		And I press "Publish"
		Then I should see "Tagged as foo"
	
	Scenario: I do not have tags
		When I click "Write Post"
		And I fill in "" for "Tag"
		And I fill in "hello" for "Title"
		And I fill in "world" for "Body"
		And I press "Publish"
		And I should not see "Tagged as"