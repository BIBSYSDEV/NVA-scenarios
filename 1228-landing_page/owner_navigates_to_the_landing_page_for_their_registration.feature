Feature: Owner navigates to the Landing Page for their Resource

    @test 
    @1231
    Scenario: Owner navigates to the Landing Page for their Published Resource without DOI
        Given that the Creator navigates to the Landing Page for a Resource
        And they are the Owner of the Resource
        And the Resource has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Resource"

    @needJiraTag
    @implemented
    Scenario: Owner wants to publish Resource
        When the Owner previews the Resource's Langing Page
        And the Registraion has "Draft" Status
        Then they see a "Publish" option

    @needJiraTagApproval
    Scenario: Owner wants to publish their Resource, pending Approval
        When the Owner previews the Resource's Langing Page
        And the Registraion has "Draft" Status
        And there is a pending Approval Request on the Resource
        Then they see a "Publishing pending" notice
        And the user is informed that progress can be viwed in My Messages 

    @needJiraTagApproval
    Scenario: Owner wants to publish Resource, all restrictions
        Given Institutions publications policy is "Only Curator can publish"
        When the Owner uses the Publish option
        Then the Owner see a Landing Page with an Unpublished Resource
        And an Approval Request is sent to his Curator
        And the Owner is notified that a Approval Request is sent to his Curator and progress can be viwed in My Messages

    @needJiraTagApproval
    Scenario: Owner wants to publish Resource, file restrictions
        Given Institutions publications policy is "Registrator can only publish metadata"
        When the Owner uses the Publish option
        Then the Owner sees a Landing Page with a Published Resource
        And the Resource's status is "Published"
        And the Resource's content is locked with a pending approval notification
        And an Approval Request is sent to the Curator
        And the Owner is notified that a Approval Request is sent to the Curator and progress can be viwed in My Messages

    @needJiraTagApproval
    Scenario: Owner uses the Publish option on Langing Page
        Given Institutions publications policy is "Registrator has full publishing rights"
        When the Owner uses the Publish option
        Then the Resource's status is "Published"
        And the Owner sees a Landing Page with a Published Resource

    @test
    @updated - removed "Go back to schema"-button
    Scenario: Owner navigates to the Landing Page for their draft Resource with Validation Errors
        When the Creator navigates to the Landing Page
        And the Resource has Validation Errors
        And the Resource is a draft
        Then they see a List of all Validation Errors for the Resource
        And they see a "Edit registration" button