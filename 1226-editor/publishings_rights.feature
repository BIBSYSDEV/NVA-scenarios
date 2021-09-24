Feature: Editor decide who got publishing rights

	In order to decide the publishing policy at an Institution 
    As an Editor
    I want to choose between different options

    Background: 
    Given an Institution with one or more Editor roles

	@needJiraTag - this scenario might be a duplicate to @1424
	Scenario: The logged-in User is a Registrator
	When a User is logged-in through Feide
	And the Users Feide profile contains one of the following roles:
    	| Scientific employees               |
        | Technical administrative employees |
    Then the User is a Registrator

    @needJiraTag 
	Scenario: Default publishing rights
	When the Editor of an Institution hasn’t chosen a policy
	Then the publications policy is:
		| Registrator got full publishing rights |

    @needJiraTag 
	Scenario: Editor decide publishing rights
	Given a Editor views the Editor page
	When the Editor chooses one of the three options:
		| Registrator got full publishing rights |
		| Registrator can only publish metadata  |
		| Only Curator can publish               |
	Then the Institutions publications policy is changed accordingly
	# The policys are used in owner_navigates_to_the_landing_page_for_their_registration.feature 