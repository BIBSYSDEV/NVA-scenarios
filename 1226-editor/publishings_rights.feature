Feature: Editor decides who gets publishing rights

	In order to decide the publishing policy at an Institution
	As an Editor
	I want to choose between different options

	Background:
		Given an Institution with one or more Editor roles

	@TEST_NP-4159
	@test
	@needJiraTag
	# - this scenario might be a duplicate to @1424
	Scenario: The logged-in User is a Registrator
		When a User is logged-in through Feide
		And the Users Feide profile contains one of the following roles:
			| Scientific employees               |
			| Technical administrative employees |
		Then the User is a Registrator

	@TEST_NP-4157
	@test
	@3196
	Scenario: Default publishing rights
		When the Editor of an Institution hasn’t chosen a policy
		Then the publications policy is:
			| Registrator has full publishing rights |

	@TEST_NP-4158
	@test
	@3197
	Scenario: Editor defines publishing rights
		Given a Editor views the Editor page
		When the Editor chooses one of the three options:
			| Registrator has full publishing rights |
			| Registrator can only publish metadata  |
			| Only Curator can publish               |
		Then the Institutions publications policy is changed accordingly
		And the Editor is notified that a new policy is activated
# The policys are used in owner_navigates_to_the_landing_page_for_their_registration.feature

