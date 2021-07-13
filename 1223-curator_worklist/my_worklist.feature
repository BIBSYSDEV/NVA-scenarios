Feature: Curator opens My Worklist

	Background: 
		Given Curator is loged in
		And Curators Scope is set on a part of the Institution
		And Curator opens My Worklist
		And My Worklist contains Requests of all four types
		And all Requsts are sendt by a User Affilliated at Curators Scope
		And the list of Approvals are in focus

	Scenario: Curator opens a Request in My Worklist
		When Curator selects one of the Request types:
			| Approvals |
			| Support   |
			| DOI       |
			| Ownership |
		And Requests have it's Resources' title
		And the Users name is visible
		And the Date of it's creation is visible
		And the start of the last Message in the Request is visible
		And the Status of the Message is visible
		And Curator select one Request 
		Then the full message is visible
		And possible previous messages in the Request is visible
		And the Curator can change Status on the Request
		And the Curator can write and send an answer
		And the Curator can open the requests Resource 
		And the Owner of the Request is viewed

	Scenario: Curator opens a Request without owner
		Given Curator opens a Request in My Worklist
		When the Owner of the Request is undefined
		Then the Requests Status is set to "Under work"
		And the Curator is the Owner of the request

	Scenario: Curator declines Ownership of a Request
		When the Curator selects "Mark request unread" 
		Then the Requests Status is updated 
		And the Owner is set to undefined

	Scenario Outline: Curator open the Requests Resource
		When the Curator opens the Requests Resource
		Then the Landing Page of the Resourcs is opened
		And the Button "<Action>" of the "<Type>" is visible 
		Examples:
			| Action       | Type      |
			| Publish      | Approval  |
			| Decline      | Approval  | 
			| Mint DOI     | DOI       |
			| Decline      | DOI       |
			| Change owner | Ownership |
			| Decline      | Ownership |

	Scenario: Curator decliens a Request
		When the Curator declines an Request of type:
			| Approval  | 
			| DOI       |
			| Ownership |
		Then the Status of the Request is set to "Declined"

	Scenario: Curator claims a Request
		When the Curator do either: 
			| send an answer        |
			| Publish               |
			| Mint a DOI            |
			| Decline a DOI         |
			| Change Owner          |
			| Decline a Ownerchange |
		Then the Curator is stored as Owner of the Request
		# the Owner wish to be informed about changes on his requests

	Scenario: Curator writes an answer to a message in a Request
		When the Curator writes an answer 
		And sends it to the User 
		And the Request Type is:
			| Approval  |
			| DOI       |
			| Ownership |
		Then the User can see the answer in My Messages
		# These Requests Types demands other actions to become "Answered"

	Scenario: Curator writes an answer to a message in a Support Request
		When the Curator writes an answer 
		And sends it to the User 
		And the Request type is Support
		Then the User can see the answer in My Messages
		And the Request status is set to "Answered"

	Scenario: Curator markes an Request as Deleted
		When the Curator selects "Deleted" 
		Then the Requests Status is updated 
		# Request marked deleted may be permanetly deleted at some point

	Scenario: Curator markes an Request as Archived
		When the Curator selects "Archived" 
		Then the Requests Status is updated
		# An archived Request contains valuable information about the resource
		# and/or decisions regarding the documentation, liscens, ownership etc.
