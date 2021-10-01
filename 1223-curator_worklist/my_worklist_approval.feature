Feature: Curator handles an Approval Request

    In order to manage the amount of resources created
    As an Editor (at a large Institution like NTNU)
    I want to allow the User to publish resources

	In order to reduce cost of training and secure high quality on all resources
    As an Editor (at a small Institution Like NINA)
    I want an Curator to approv all resources prior to publishing

    In order to remove unnessesery work and frustration from duplicate resources 
    As an Editor (at a medium Institution like SINTEF)
    I want to allow Users to publish metadata resources, then a Curator approv the resource before the content is made publicly accessable

    Rules:
     - The User got publisher privilege
     - User got publisher privilege, but all content need a Curator Approval to be publicly accessable
     - Only the Curator got publisher privilege

	Background: 
		Given a User that needs an approval to publish
		And the User has created an Approval Request
		And the Curator views the landing page of the Resource assosiated with the Request

	@3188
	Scenario: Curator approves an Approval Request to publish
		Given the User wants to publish a Resource
		And Institutional publication policy is "Only Curator can publish" 
		When the Curator approves the Request
		Then the Request status is changed to "Approved"
		And the Resource is published

	@3191
	Scenario: Curator declines an Approval Request
		When the Curator declines the Request 
		And Institutional publication policy is "Only Curator can publish" 
		Then the Request Status is set to "Declined"
		And the Curator may send an answer Message with a reason to the User

	@3189
	Scenario: Curator approves an Approval Request to grant open access to content
		Given the User has published a Resource
		And Institutional publication policy is "Registrator can only publish metadata"
		When the Curator approves the Request
		Then the Request status is changed to "Approved"
		And the the Resources' content is open accessable 
		# Don't remove the potentially original embargo on the files

	@3190
	Scenario: Curator declines access to content
		Given the User has published a Resource
		And Institutional publication policy is "Registrator can only publish metadata"
		When the Curator declines the Request
		Then the Request status is changed to "Declined"
		And the content of the Resource is still not publicly accessible