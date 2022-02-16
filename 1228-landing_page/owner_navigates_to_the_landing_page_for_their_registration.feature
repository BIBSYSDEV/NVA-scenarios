Feature: Owner navigates to the Landing Page for their Resource

    @test
    @1231
    @TEST_NP-4168
    @TESTSET_NP-4235
    Scenario: Owner navigates to the Landing Page for their Published Resource without DOI
        Given that the Creator navigates to the Landing Page for a Resource
        And they are the Owner of the Resource
        And the Resource has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Resource"

    @needJiraTag
    @implemented
    @TEST_NP-4169
    @TESTSET_NP-4235
    Scenario: Owner wants to publish Resource
        When the Owner previews the Resource's Landing Page
        And the Registraion has "Draft" Status
        Then they see a "Publish" option

    @3192
    @TEST_NP-4182
    @TESTSET_NP-4235
    Scenario: Owner wants to publish their Resource, pending Approval
        When the Owner previews the Resource's Landing Page
        And the Registration has "Draft" Status
        And there is a pending Approval Request on the Resource
        Then they see a "Publishing pending" notice
        And the user is informed that progress can be viewed in My Messages

    @3193
    @TEST_NP-4181
    @TESTSET_NP-4235
    Scenario: Owner wants to publish Resource, all restrictions
        Given Institutions publications policy is "Only Curator can publish"
        When the Owner uses the Publish option
        Then the Owner see a Landing Page with an Unpublished Resource
        And an Approval Request is sent to his Curator
        And the Owner is notified that an Approval Request is sent to his Curator and progress can be viewed in My Messages

    @3194
    @TEST_NP-4176
    @TESTSET_NP-4235
    Scenario: Owner wants to publish Resource, file restrictions
        Given Institutions publications policy is "Registrator can only publish metadata"
        When the Owner uses the Publish option
        Then the Owner sees a Landing Page with a Published Resource
        And the Resource's status is "Published"
        And the Resource's files, license and embargo date are locked with a pending approval notification
        And the number of files is visible
        And an Approval Request is sent to the Curator
        And the Owner is notified that an Approval Request is sent to the Curator and progress can be viewed in My Messages

    @3195
    @TEST_NP-4179
    @TESTSET_NP-4235
    Scenario: Owner uses the Publish option on Langing Page
        Given Institutions publications policy is "Registrator has full publishing rights"
        When the Owner uses the Publish option
        Then the Resource's status is "Published"
        And the Owner sees a Landing Page with a Published Resource

    @test
    @updated
    @TEST_NP-4183
    @TESTSET_NP-4235
    # - removed "Go back to schema"-button
    Scenario: Owner navigates to the Landing Page for their draft Resource with Validation Errors
        When the Creator navigates to the Landing Page
        And the Resource has Validation Errors
        And the Resource is a draft
        Then they see a List of all Validation Errors for the Resource
        And they see a "Edit registration" button

    @needJiraTag
    @TEST_NP-4174
    @TESTSET_NP-4235
    Scenario: Owner sees the option to transfer Ownership of a Resource
        When the Owner views the Landing Page
        Then the Owner sees a option to transfer Ownership of Resource

    @needJiraTag
    @TEST_NP-4177
    @TESTSET_NP-4235
    Scenario: Owner transfers Ownership of a Resource
        When the Owner uses the option to transfer Ownership of current Resource
        Then the Owner must acknowledges that this is a final action
        And the Owner must select a new Owner
        And the ownership is transfered to new Owner