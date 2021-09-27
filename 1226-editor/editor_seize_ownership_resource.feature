Feature: Editor seizes ownership of a Resource

    In order to correct a Resource, published by a User at some other Institution
    As an Editor
    I want to seize ownership of the Resource

    Background: 
    	Given a User has published a Resource

	@needJiraTag
	Scenario: Editor is sees the option to seizes ownership of a resource
		When an Editor view a Landing Page of a Published Resource
		Then the Editor sees a option to seize ownership of the Resource

	@needJiraTag
	Scenario: Editor seizes ownership of a resource
		When the Editor uses the option to seize ownership of the Resource
		Then the Editor is notified that is an excessive action
		And ask for a verification that the Editor deem it necessary
		And all other measures have been exhausted

	@needJiraTag
	Scenario: Editor verifies the intention to seizes ownership of a resource
		When the Editor acknowledge his intention to seize ownership of the Resource
		Then the Editor becomes the owner of the Resource
		And the Editors Institution becomes the Owning Institution 
		# replaces the Owners IDP Institution
		And the Editor must write a message that is sent to the previous Owner
		# Do the Editor of the previous Owner need a copy?
		# The Editor, as the new Owner, can now give ownership of the Resource to any new owner
