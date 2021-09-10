Feature: Curator opens My Worklist

  "@needJiraTag" is used in several files to enable me to locate all new scenarios that is'nt in jira.
  "@updated" is used where I have changed a scenario, that exists in jira - but not updated it there yet.
	#If a scenario is deleted, but still exists in Jira - it's noted as a comment

  Vocabulary clearification:
  - A named role is preferred over "they"
  - Resource is preferred over Registration

  Rules:
  - An Editor grant a User the Curator role at an Institution, to serve all users at the Institution
  - A Editor may define a Curators Scope to serve one or more subunits at the Institution
  - A Curator may at will change his current Scope, but not his defined Scope

  - A User belongs at an Institution (defiend by the active IDP)
  - A User may be Affilliated to a subunit at his Institution (defined in his profile)
  - A User creates Resources (thus becomes it's Owner)

  - A Resource has 0 or more Requests

  - A Request has a Submitter (the Owner or a Curator)
  - A Request has a date of creation
  - A Request is of a Type (Approval, Support, DOI or Ownership)
  - A Request is assigned a Curator
  - A Request has a Status
  - A Request has a date of status change
  - A Request have one or more Messages

  - A Message has a Submitter (the Owner or a Curator)
  - A Message has a date of creation

  The Possible values of the Requests Status:
   - New <--> Active --> [Conclusion]
   - The Conclusion value is decided by the Request Type:
    - Request Type Support : Conclusion == Answered
    - Other Request Types  : Conclusion is Approved or Declined
    - It's still pending if a final resting value is needed, like Archived and/or Deleted

  Future stuff:
  - The Custodian needs to be notified when a Request is updated (a new Message or someone adopts it)
  - There is a need to allow Curators at two Institutions to comunicate

  Background:
    Given Curator is logged in
    And Curator opens My Worklist from main menu
    And My Worklist contains Requests of each type:
      | Approval  | 
      | Support   | 
      | DOI       | 
      | Ownership |
    And Affilliation of Sender on each Requests is within the Curator´s scope of responsibility
    And the list of Approvals is in focus

  @needJiraTag
  Scenario: Curator opens their Worklist
    When the Curator opens their Worklist
    Then the Curator see that the Worklist is Scoped

  @needJiraTag
  Scenario: Curator change Scope of there Worklist
    When the Curator change Scope to the whole Institution or one or more subunits
    Then the listed Requests is updated to match the new Scope

  @357
  @updated
  #Replaces @1353, 1354, 2756 and 531
  Scenario Outline: Curator views all Requests of a type
    When Curator clicks on Requests of type "<Type>"
    Then Curator see a list of Requests displayed with:
      | Request status            |
      | Registration title        |
      | Submitter name            |
      | Request Submitter Date    |
      | Beginning of last message |
      | Owner name                |
    And they see that each Request can be opened
    Examples:
      | Type      |
      | Approval  |
			# Må handtere at Editor kan tillate alle å publisere - kva skjer da med Approvals?
      | Support   |
      | DOI       |
      | Ownership |

  @needJiraTag
  Scenario: Curator opens a unassigned Request
    When the Curator open a unassigned Request
    Then the Curator is assigned the Request
    And the Request Status is set to "Active"

  @needJiraTag
  Scenario: Curator unassigns a Request
    When the Curator selects "Mark request unread"
    Then the Request Status is set to "New"
    And the Request is unassigned the Curator

  @1252
  @updated
  Scenario: Curator open a assigned Request
    When the Curator selects a Request
    Then the Request is expanded
    And the assigned Curator is viewed
    And previous messages are displayed chronologically with:
      | Submitter name            |
      | Submitter Date and Time   |
      | The full message          |
    And the Curator can reply to a message
    And the Curator can open the Requests Resource
    And the Curator can change the Status of the Request

  @needJiraTag
  Scenario Outline: Curator open the Request's Resource
    When the Curator opens the Requests Resource
    Then the Landing Page of the Resource is viewed
    And the Resource "<Type>" Button "<Action>" is visible
    Examples:
      | Type      | Action       |
      | Approval  | Publish      |
      | Approval  | Decline      |
      | DOI       | Mint DOI     |
      | DOI       | Decline      |
      | Ownership | Change owner |
      | Ownership | Decline      |

 @needJiraTag
  Scenario: User gets an answer to a Support Request
    When the Curator sends an answer of type "Support"
    Then the Request status is set to "Answered"
    And the User can read the answer in My Messages

  @needJiraTag
  Scenario: User gets an answer to a Request
    When the Curator writes an answer
    And sends it to the User
    And the Request Type is:
      | Approval  |
      | DOI       |
      | Ownership |
    Then the User can see the answer in My Messages

  @needJiraTag
  Scenario Outline: Curator change Status on a Request
    When Curator selects a new status "<Status>" on a Request
    Then the status of the Request is set to "<Status>"
    Examples:
      | Status   |
      | Archived |
      | Deleted  |

  @needJiraTag
  Scenario: Curator receives assignment of responses to requests they have previously responded to
    When the Curator:
      | Sends an answer          |
      | Publishes a resource     |
      | Mints a DOI              |
      | Declines a DOI           |
      | Changes Owner            |
      | Declines change of owner |
    Then the Curator is Assigned the Request

  @needJiraTag
  Scenario: Curator receives Requests in their scope
    Given the Request is of type:
      | Approval |
      | Support  |
      | DOI      |
    When the Requests' Submitter is Affilliated within the Curators Scope
    Then the Request is part of the Curators Worklist

  @needJiraTag
  Scenario: Curator receives Requests they have been assigned from outside their scope
    Given the Request is of type:
      | Approval |
      | Support  |
      | DOI      |
    When the Curator is assigned the Request
    Then the Request is part of the Curators Worklist

  @needJiraTag
  Scenario: Curator receives Ownership requests within their scope
    Given the Request is of type "Ownership"
    When the Affilliation of the Owner of the Resource associated with the Request is within Curators Scope 
    Then the Request is part of the Curators Worklist

  @needJiraTag
  Scenario: Curator receives Ownership requests they have been assigned from outside their scope
    Given the Request is of type "Ownership"
    When the Curator is assigned the Request
    Then the Request is part of the Curators Worklist