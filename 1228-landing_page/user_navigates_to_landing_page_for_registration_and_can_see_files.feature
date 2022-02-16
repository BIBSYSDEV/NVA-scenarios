Feature: User navigates to Landing Page for Registration and can see Files

    @TEST_NP-4171
    @needJiraTag
    Scenario: User sees the option to claim Ownership of a Resource
        When the User views the Landing Page
        Then the User sees a option to claim Ownership of current Resource

    @TEST_NP-4178
    @needJiraTag
    Scenario: User uses the option to claim Ownership of current Resource
        When the User uses the option to claim Ownership of current Resource
        Then the User must write a claim
        And a Ownership Request is sent to the Owners Curator
        And the User is notified that progress on this claim can be viewed in My Messages

    # All scenarios below is about "Anonymous User views Landing Page"
    # they belong on the "Anonymous User views Landing Page for Registration" feature

    @TEST_NP-4180
    @1530
    Scenario: Files that are Administrative Agreements are hidden
        Given Anonymous User views Landing Page for Registration
        And the Registration contains a File, which is an Administrative Agreement
        When they view the Files section
        Then they do not see the File that is an Administrative Agreement

    @TEST_NP-4173
    Scenario: Files that are part of Registration are listed
        Given Anonymous User views Landing Page for Registration
        And the Registration contains Files
        When they view the Files section
        Then they can see Files that are not Administrative Agreements are listed
        And for each File they can see:
            | Name    |
            | Size    |
            | Version |
            | License |
        And they can see a download button for Files that are not Embargoed

    @TEST_NP-4172
    @2158
    Scenario Outline: Files can be previewed
        Given Anonymous User views Landing Page for Registration
        And the Registration contains Files that are not Embargoed
        And every File has an expandable Preview panel
        When the user expands the Preview panel
        Then the selected File is downloaded
        And they see the downloaded File is of type "<FileType>"
        And they see the preview of the downloaded File
        Examples:
            | FileType         |
            | PDF              |
            | Image            |
            | Microsoft Office |

    @TEST_NP-4170
    Scenario: Automatically preview first File
        Given Anonymous User views Landing Page for Registration
        And the Registration contains Files
        When the first File is not Embargoed
        And the File's size is less than 10 MB
        Then the File's Preview panel is expanded by default
        And the File is automatically downloaded
        And the downloaded File is displayed

    @TEST_NP-4175
    Scenario: Lock Embargoed Files
        Given Anonymous User views Landing Page for Registration
        And the Registration contains a File that is Embargoed
        Then the Embargoed File does not have an expandable Preview panel
        And the Embargoed File does not have a download button
        And the user can see the date when the File will no longer be Embargoed
