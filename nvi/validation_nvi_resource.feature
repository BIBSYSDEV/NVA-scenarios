Feature: Validation of an NVI resource

	This feature file contains scenarios where NVI-Resources are Validated as part of the NVI-process.

	In order to view current status of the NVI-prosess
	As an Curator
	I want to see how many Resources is Validated, is Nominated for Validation and is Candidate for Validation

	In order to view current status of the NVI-prosess
	As an Curator
	I want to see current status compeared with last years numbers

	In order to Validate a Nominated Resource
	As an Curator
	I want to see the list of Nominated Resources - Resources that has been Valideted by some other Institution and implays this Instituion by affiliation

	In order to Validate a Candidate Resource
	As an Curator
	I want to see the list of Candidate Resources - Resources that no other Institution has Validated yet, but qualify to be an NVI-Resource and implays this Institution by affiliation

	In order to inspect a Resource
	As an Curator
	I want to be able to navigate to the Resource landingpage from all lists

	# Skal Curator også få liste med potensielle NVI-ressurser?
	#	- Regler for at ein ressurs er "potensielle NVI-ressurser" må da avklares

	Background:
		Given an logged in Curatur at an NVI-Institution

	@needJiraTag 
	Scenario: Curator view NVI-report status at own Institution
		When a Curator uses the option to view the NVI-Report status at own Institution
		Then the Curator sees an visualization of current progress compared with last year 
		And it contains number of Resources Validated
		And it contains number of Resources Nominated
		And it contains number of Resources Candidates

	@needJiraTag 
	Scenario: Curator view list of Resources Validated to be part of the NVI-report
		When a Curator uses the option to view the list Validated Resources
		Then the Curator sees a list of Resources that is Validated by all Institutions that is affiliated to the Resource by authors

	@needJiraTag 
	Scenario: Curator view todo list of Resources Nominated to be part of the NVI-report
		When a Curator uses the option to view the list Nominated Resources
		Then the Curator sees a list of Resources that is Validated by at least one other Institution, but not his Institution
		And there is an option to inspect the Resource
		And there is an option to Validate each Resource on behalf of his Institution

	@needJiraTag 
	Scenario: Curator view total list of Resources Nominated to be part of the NVI-report
		When a Curator uses the option to view the list Nominated Resources
		And the Curator markes that also Resources Validated by own Institution shuld be listed
		Then the Curator sees a list of all Resources that is Validated by at least one other Institution, including his own Institution
		And there is an option to inspect the Resource
		And there is an option to Validate each Resource on behalf of his Institution

	@needJiraTag 
	Scenario: Curator view list of Resouerces Candidates to be part of NVI-report
		When a Curator uses the option to view the list Candidates Resources
		Then the Curatos sees a list of Resources that fullfills to be Resources
		And the Resources has authors that is affiliated to the Curators Institution
		And no other Institution has Validated the Resource yet

	@needJiraTag 
	Scenario: Curator selects to inspect an Resource from the list of Resources Nominated
		Given Curator view list of Resources Nominated to be part of the NVI-Report
		When a Curator uses the option to view details about an Resource
		Then the Curator sees a list with Validation status for all affiliated Institutions 
		And there is an option to Validate the Resource on behalf of his Institution