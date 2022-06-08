Feature: Dataset

	In order to document my findings in journal articles
	As a User
	I want to be able to publish my own and others datasets

	In order to document my findings in journal articles
	As a User
	I want to be able to link published datasets to my published journal articles

	Background:
		Given User selects Resource type "Research Data"
		And they select Dataset as subtype

	@9141
	Scenario: User sees information about types of data that are illegal to publish on this service
		When the User has selected to register a Dataset
		Then the User sees information about types of data that are illegal to publish on this service

	@9141
	Scenario: User confirms to register data that are legal to publish on this service
		Given User sees information about types of data that are illegal to publish on this service
		When they confirm that the data intended to be published complies with the terms of the service
		Then the dialog is closed 
	
	@9141
	Scenario: User confirms to register data that is illegal to publish on this service
		Given User sees information about types of data that are illegal to publish on this service
		When the User confirms that the data intended to be published is illegal 
		Then the User is prohibited from publishing the Registration
		And any registered data is stored as a draft
		And the User sees the standard user support dialog where the user can ask for assistance

	@9140
	Scenario: User is informed about further support and registration process
		Given User sees information about types of data that are illegal to publish on this service
		When the User has submitted a user support request
		Then the User is informed that the registration is stored
		And can be completed at any later stage
		And answers to user support requests will be visible on "My page"

	@9140
	Scenario: User adds zero or more geographical data to the dataset
		Given User confirms to register data that are legal to publish on this service
		When the User writes some free-text geographical data
		# Future: Add support for land, region, county and map reference (line, rectangle, point)
		Then it is stored

	@9140
	Scenario: User adds zero or more use-references to resource published in NVA
		Given User confirms to register data that are legal to publish on this service
		When the User searches for published Registrations
		Then the User can store any search result as a use-reference

	@9140
	Scenario: User adds zero or more related-references to resource published in NVA
		Given User confirms to register data that are legal to publish on this service
		When the User searches for published Registrations
		Then the User can store any search result as a related-reference
		# future scenario will allow use of external IRI, not only internal

	@9140
	Scenario: User adds zero or more comply-to-references to a DMP resource published in NVA
		Given User confirms to register data that are legal to publish on this service
		When the User searches for published DMPs
		Then the User can store any search result as a comply-to-reference

	@9142
	Scenario: User sees their own published resources in NVA as default matching list
		Given User adds zero or more use-references to resources published in NVA
		When the User selects the input field to search for a resource in NVA
		Then zero to five published results, sorted newest first, are displayed for selection
		And a list of search matches will replace this list 

	@9145
	Scenario: User confirms publishing the dataset resource
		Given User is previewing a Landing Page for a Dataset
		And all required fields are filled
		When the User clicks the Publish button
		Then the User is warned about the implications of publishing sensitive data
		And the User has an option to contact user support

	@9146
	Scenario: User sees Landing Page for Dataset
		When User opens Landing Page for a Dataset
		Then the User sees geographical information
		And the User sees publications that use this dataset
		And the User sees projects assosiated with this dataset
		And the User sees DMPs this dataset complay to
		And the User sees other related resources