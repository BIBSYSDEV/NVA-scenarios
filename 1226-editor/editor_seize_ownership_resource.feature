Feature: Editor takes ownership of a Resource

    In order to correct a Resource, published by a User at some other Institution
    As an Editor
    I want to seize ownership of the Resource

    Background: 
    	Given a User has published a Resource

	@needJiraTag
	Scenario: Editor sees the option to takes Ownership of a Resource
		When an Editor view a Landing Page of a Published Resource
		Then the Editor sees a option to takes ownership of the Resource

	@needJiraTag
	Scenario: Editor takes Ownership of a Resource
		Given Editor sees the option to takes ownership of a resource
		When the Editor uses the option to takes ownership of the Resource
		Then the Editor is notified that this is an excessive action
		And ask the Editor to verified it is deemed necessary
		And all other measures have been exhausted
		And the Editor must write a message to the current Owner

	@needJiraTag
	Scenario: Editor verifies the intention to takes Ownership of a Resource
		Given Editor takes ownership of a Resource
		When the Editor acknowledge his intention to takes Ownership of the Resource
		Then the Editor becomes the Owner of the Resource
		And the Editor's Institution becomes the Owning Institution 
		And the message is sent to the previous Owner
		# The Editor can now edit the Resource and/or give the ownership to any other User, including hand it back to the previous Owner