Feature: Curator handles an Approval Request

    In order to manage the amount of resources created
    As a Editor (at a large Institution like NTNU)
    I want to allow the User to publish resources

	In order to reduce cost of training and secure high quality on all resources
    As a Editor (at a small Institution Like NINA)
    I want an Curator to approv all resources prior to publishing

    In order to remove unnessesery work and frustration frome duplicate resources 
    As a Editor (at a medium Institution like SINTEF)
    I want to allow Users to publish metadata resources, then a Curator approv the resource before the content is made public accessable

    Rules:
     - The User got publisher privelige
     - User got publisher privelige, but all content need a Curator Approval to be public accessable
     - Only the Curator got publisher privelige

	Background: 
		Given a User that needs an approval to publish
		And the User has created an Approval Request
		And the Curator views the landing page of the Resource assosiated with the Request

	@needJiraTag
	Scenario: Curator approves an Approval Request to publish
		Given the User wants to publish a Resource
		And the Editor has restricted publishing rights to Curators
		When the Curator approves the Request
		Then the Request status is changed to "Approved"
		And the Resource is published

	@needJiraTag
	Scenario: Curator approves an Approval Request to grant open access to content
		Given the User has published a Resource
		And the Editor demands a Approval to open access to Resources' content
		When the Curator approves the Request
		Then the Request status is changed to "Approved"
		And the the Resources' content is open accessable 
		# Don't remove the potentially original embargo on the files

	@needJiraTag
	Scenario: Curator decline access to content
		Given the User has published a Resource
		And the Editor demands a Approval to open access to Resources' content
		When the Curator declines the Request
		Then the Request status is changed to "Declined"
		And the content of the Resource is still not public accessable
		# Eller ?!? - må snakke med referansegruppe om denne

	@needJiraTag
	Scenario: Curator decline an Approval Request
		When the Curator declines the Request 
		Then the Request Status is set to "Declined"
		And the Curator may send an answer Message with a reason to the User
