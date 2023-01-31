Feature: Owner navigates to the Landing Page for their Resource

    @test
    @1231
    @TEST_NP-4168
    @TESTSET_NP-4235
    Scenario: Owner Requests a DOI
        Given the owner opens the Landing Page of their Registration
        And the Registration has no DOI
        When they request a DOI
        Then they can see a reserved DOI

    @needJiraTag
    @implemented
    @TEST_NP-4169
    @TESTSET_NP-4235
    @test
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
    Scenario: Owner uses the Publish option on Landing Page
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

    @TEST_NP-4200
    @1235
    @test
    Scenario: Owner navigates to the Landing Page and publish a Registration with a drafted DOI
        Given that the Owner navigates to a Registration's Landing Page
        And the Registration has status Draft
        And the Registration has a Draft DOI
        When the Owner publishes the Registration
        Then the Landing Page for Registration is displayed
        And the option to draft a DOI is displayed as "DOI pending" and is disabled
        And the Landing Page for Registration lists the Draft DOI
        And the Draft DOI is still not a link
        And the DOI request is listed in the Owners work list
        And the DOI request is listed in the Curators work list

    @TEST_NP-4199
    @1234
    @test
    Scenario: Owner drafts a DOI for an unpublished Registration
        Given that the Owner View Landing Page for Registration for unpublished Registration without DOI
        And they are the Owner of the Registration
        When they draft a DOI
        Then the Landing Page for Registration is displayed
        And the option to draft a DOI is displayed as "DOI pending" and is disabled
        And the Draft DOI is added to the metadata
        And the Landing Page for Registration contains the Draft DOI
        And the Draft DOI is not a link

    @TEST_NP-4191
    @1233
    @test
    Scenario: Owner navigates to the Landing Page for Registration for unpublished Registration without DOI
        Given that the Owner view Landing Page for Registration
        And the Registration is not Published
        And the Registration has no DOI
        When they look at the Status Bar
        Then they see options for Draft a DOI and Edit Registration

    @TEST_NP-4184
    @1232
    @test
    Scenario: Owner navigates to the Landing page and requests a DOI
        Given that the Creator navigates to the Landing page for published Registration without DOI
        And they are the Owner of the Registration
        When they request a DOI
        And optional add a message to the Curator
        Then the Landing page is displayed
        And the "Request a DOI" button is no longer visible
        And the request is listed in My Messages
        And the request is listed in Curator Worklist

