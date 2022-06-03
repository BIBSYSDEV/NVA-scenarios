Feature: Data Management Plan (DMP)

	#also know as Research Output Plan
	# https://whimsical.com/nva-wireframes-YPhaVjNfbZ5wgCXgAPdpuq

	In order to fulfil demands from funders and own institution
	As a User (researcher)
	I want to publish my DMP

	In order to fulfil demands from funders and own institution
	As a User (researcher)
	I want to publish new versions of my DMP

	Background:
		Given User selects Resource type "Research Data"
		And they select DMP as subtype

	Scenario: User sees a prefilled Publisher field
		When the User sees the Publisher field
		Then the coresponding institution is prefilled

	Scenario: User changes the prefilled Publisher
		When the User search for a Publisher in the Publisher field
		Then the User may select an other Publisher 

	Scenario: User adds zero or more related-references to resource published in NVA
		When the User search for published Registrations in NVA
		Then the User can store any search result as a related-reference
		# future scenario will allow use of external IRI, not only internal

    Scenario: User removes an related-references to resource
        Given User adds zero or more related-references to resource published in NVA
        When the User removes an related-reference resource 
        Then the related-reference is removed 