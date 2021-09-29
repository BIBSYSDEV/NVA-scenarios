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

    @needJiraTag
    Scenario: Owner wants to publish their Resource, pending Approval
        When the Owner previews the Resource's Langing Page
        And the Registraion has "Draft" Status
        And there is a pending Approval Request on the Resource
        Then they see a "Publishing pending" notice
        And the user is informed that progress can be viwed in My Messages 

    @needJiraTag
    Scenario Outline: Owner wants to publish Resource, all restrictions
        Given Owner wants to publish their Resource
        And Resource is of type "<ResourceType>" 
        And Editor has restricted publication of type "<ResourceType>" 
        When the Owner uses the Publish option
        Then an Approval Request is created
        And the User is informed that a Publishing Approval is pending and progress can be viwed in My Messages
        Examples:
            | ResourceType |
            | NVI          |
            | none-NVI     |

    @needJiraTag
    Scenario Outline: Owner wants to publish Resource, file restrictions
        Given Owner wants to publish their Resource
        And Resource is of type "<ResourceType>" 
        And the Editor has restricted access to files of Resources of "<ResourceType>"
        When the Owner uses the Publish option
        Then an extra embargo is put on all files
        And the Resource's status is "Published"
        And the Landing Page is publicly accessible
        And an Approval Request is created
        And the User is informed that the Resource is published but a Publishing Approval is pending to allow access to the files and progress can be viwed in My Messages
        Examples:
        Examples:
            | ResourceType |
            | NVI          |
            | none-NVI     |

    @needJiraTag
    Scenario: Owner uses the Publish option on Langing Page
        Given Owner wants to publish their Resource
        And the Editor has given all users publishing permissions for their own work
        When the Owner uses the Publish option
        Then the Resource's status is "Published"
        And the Landing Page is publicly accessible

    @test
    @updated - removed "Go back to schema"-button
    Scenario: Owner navigates to the Landing Page for their draft Resource with Validation Errors
        When the Creator navigates to the Landing Page
        And the Resource has Validation Errors
        And the Resource is a draft
        Then they see a List of all Validation Errors for the Resource
        And they see a "Edit registration" button

    @needJiraTag
    Scenario: Owner sees the option to transfer Ownership of a Resource
        When the Owner views the Landing Page 
        Then the Owner sees a option to transfer Ownership of Resource

    @needJiraTag
    Scenario: Owner transfers Ownership of a Resource
        When the Owner uses the option to transfer Ownership of current Resource
        Then the Owner must acknowledges that this is a final action
        And the Owner must select a new Owner
        And the ownership is transfered to new Owner