Feature: Research data

	In order to keep an overview of published research data
	As a User 
	I want to be able to register different types of research data

	Background:
		Given A User is logged in
		And the User starts an new registration

	@9140
	Scenario: User selects a subtype of Resource type "Research Data"
        When the User navigates to the Resource Type tab in the registration wizard
        Then the User can select a subtype of "Research Data":
            | Dataset              |
            | Data Management Plan |
