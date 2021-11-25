Feature: Registration of an NVI resource

	This feature file contains scenarios related to the enhancement or tailoring of Published Resources to match criteria in the NVI-process.

	In order to get the Institution's entitled NVI points
	As an Editor
	I want all qualifying academic publications to be registered with correct metadata

	In order to give due credit to all Authors and Institutions
	As a Curator
	I want all Authors affiliated with an NVI-Institution to be registred and Validated

	Background:
		Given an Resource is Published

	@needJiraTag 
	Scenario: Author's affiliation grants access to Curators at the affilated Institution to modify the Resource
		Given a Resource is owned by an Institution
		When a Curator at the Institution changes a Resource Author's affiliation to a different institution
		Then the Curators at the new Institution gain access to change this affiliation as they wish

	@needJiraTag 
	Scenario: An affiliation on a Resource is a top-level Institution
		When an Author is affiliated to the top level of an Institution
		Then a Curator at the Institution can select the correct subunit
	
	@needJiraTag 
	Scenario: The affiliation on a Resource is incorrect
		When an Author is affiliated to an Institution
		Then a Curator at the Institution may select a different Institution
		And the Curator is notified that this is a final action
