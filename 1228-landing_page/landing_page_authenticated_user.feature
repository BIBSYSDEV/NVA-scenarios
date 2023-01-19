Feature: Authenticated User opens a Resource's Landing Page

	Background:
		Given a User has logged in
		And the User opens a Resource's Landing Page

	@TEST_NP-4167
	@needJiraTag
	Scenario: Authenticated User claims ownership of a Resource
		When the User claims ownership of a Resource
		Then a Ownership Request is created
		And it contains a Message where the User presents their claim

	Scenario: Privileged user sees Edit button for Resource
		When the User is a validated contributor on the Resource
		And the User has an active institusjon
		Then the User has access to an Edit option

	Scenario: Editor sees Edit button for Resource
		When a Editor view a landingpage
		Then the Editor has access to an Edit option
