Feature: Authenticated User opens a Resource's Landing Page

	Background:
		Given a User has logged in
		And the User opens a Resource's Landing Page

	@needJiraTag
	Scenario: Authenticated User claims ownership of a Resource
		When the User claims ownership of a Resource
		Then a Ownership Request is created
		And it contains a Message where the User presents their claim