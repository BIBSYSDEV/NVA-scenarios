Feature: Configure NVI Institutions

	In order to activate the NVI process 
	As an System Administrator
	I want to mark some Institutions as NVI-Institutions

	Background:
		Given a logged-in Sikt System Administrator

	Scenario: Create a new Institution
		When a System Administrator creates a new Institution
		Then they assert that the new Institution is an NVI-Institution

	Scenario: Make an existing Institution an NVI-Institution
		When a System Administrator view the settings of an Institution
		Then they assert that the Institution is an NVI-Institution
