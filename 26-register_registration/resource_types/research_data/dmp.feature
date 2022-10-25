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

	@TEST_NP-13295
	Scenario: User sees a prefilled Publisher field
		When the User sees the Publisher field
		Then the corresponding institution is prefilled

	@TEST_NP-13296
	Scenario: User changes the prefilled Publisher
		When the User searches for a Publisher in the Publisher field
		Then the User replaces the prefilled Publisher with a Publisher from the search result

	@TEST_NP-13297
	Scenario: User adds zero or more related-references to a resource published in NVA
		When the User searches for published Registrations in NVA
		Then the User can store any search result as a related-reference
		# future scenario will allow use of external IRI, not only internal

	@TEST_NP-13298
	Scenario: User removes a related-references to resource
		Given User adds zero or more related-references to resource published in NVA
		When the User removes a related-reference resource
		Then the related-reference is removed

	@TEST_NP-16254
	Scenario: User adds an external links to a resource published in NVA
		When the user types an external link in the External link field
		And the user adds the link
		Then the user sees the saved link
		And the user sees a Remove relation button

	@TEST_NP-16255
	Scenario: User removes an external link to a resource
		Given the user adds an external links to a resource published in NVA
		When the user removes an external link
		Then the external link is removed
