Feature: Registration of an NVI resource

	This feature file contains scenarios where a Published Resource is enhanced, or tailored into fullfilling a criteria in the NVI-process.

	In order to get the Institutions entitled NVI points
	As an Editor
	I want all qualifying academic publications to be registered with correct metadata

	In order to give due credit to all Authors and Institution
	As an Curator
	I want all Authors affiliated to NVI-Institution to be registred and Validated

	Background:
		Given an Resource is Published

	@needJiraTag 
	Scenario: Authors affiliation on a Resource grants access to change it
		Given the Resource is owned by my Institution
		When a Curator edits the Resource
		And the Curator sees an incorrect affilited Author
		Then the Curator may affilites the Author to any Institution
		And the Curators at the new Institution gains access to change this affiliation as they wish

	@needJiraTag 
	Scenario: The affiliation on a Resource is on top level
		When an Author is affiliated to the top level of my Institution
		Then a Curator at the Institution may select the corret subunit
	
	@needJiraTag 
	Scenario: The affiliation on a Resource is incorrect Institution
		When an Author is affiliated to my Institution
		Then a Curator at the Institution may select the corret Institution
		And the Curator is notified that this is a final action