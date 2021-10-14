Feature: Configure NVI Institutions

	In order to activate the NVI process 
	As an System Administrator
	I want to mark some Institutions as an NVI-Institution

	Background:
		Given a logged in Sikt System Administrator

	Scenario: Create a new Institution
		When a System Administrator create a new Institution
		Then there must be an option to mark the new Institution as an NVI-Institution

	Scenario: Make an existing Institution an NVI-Institution
		When a System Administrator view the settings of an Institution
		Then there must be an option to mark the existing Institution as an NVI-Institution