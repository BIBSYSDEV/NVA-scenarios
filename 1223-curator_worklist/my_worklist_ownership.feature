Feature: Curator handles an Ownership Request

    In order to gain editorial access to a Resource someone else owns
    As a User 
    I want to be granted ownership of a Resource

    In order to manage my own work that is currently owned by someone else
    As a User
    I want to be granted ownership of a Resource

    In order to manage my own work that is currently owned by my other account at some other Institution
    As a User 
    I want to move ownership to my other account

    In order to preserve access to content published at this Institution
    As a Editor
    I want a Curator to approve all changes of ownership of Resources

    In order to document important published content at some other Institution
    As a Editor
    I want to take ownership of some other Institutions Resource

	Background: 
		Given a User has created a Request of Ownership
		And the Curator views the landing page of the Resource assosiated with the Request

	@needJiraTag
	Scenario: Curator declines an Ownership Request
		When the Curator declines a Request 
		Then the Request Status is set to "Declined"
		And the Curator may send a reason to the Request Sender

	@needJiraTag
	Scenario: Curator approves a Ownership Request
		When Curator approves the Request
		Then the Request status is "Approved"
		And the Resource's Owner is changed to the Requests' Sender
		And the Resource's Institution is changed to the Requests' Senders' Institution

	#Future stuff
		#Resource's Owner is'nt part of this Request, needs to create a new type of Request. It is identified a need to allow two Curators at same or different Institutions to communicate.
		#And the Curator may send a reason to the Resource's Owner
		# The Resource and it's Requests must tell it's history correctly - who did what, when and why
