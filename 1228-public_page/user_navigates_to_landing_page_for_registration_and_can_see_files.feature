Feature: User navigates to Landing Page for Registration and can see files

    @1530
    Scenario: Files that are Administrative Agreements are hidden
        Given a User views the Landing Page for a Registration
        And the Registration contains a File, which is an Administrative Agreement
        When they view the Files section
        Then they do not see the File that is an Administrative Agreement

    Scenario: Files that are part of Registration are listed
        Given a User views the Landing Page for a Registration
        And the Registration contains Files
        When they view the Files section
        Then they can see files that are not Administrative Agreements are listed
        And for each file they can see:
            | Name    |
            | Size    |
            | Version |
            | License |
        And they can download Files that are not Embargoed

    @2158
    Scenario Outline: Files can be previewed
        Given a User views the Landing Page for a Registration
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

    Scenario: Automatically preview first file
        Given a User views the Landing Page for a Registration
        And the Registration contains Files
        When the first file is not Embargoed
        And the file's size is less than 10 MB
        Then the file's Preview panel is expanded by default
        And the file is automatically downloaded
        And the downloaded file is displayed

    Scenario: Lock Embargoed files
        Given a User views the Landing Page for a Registration
        And the Registration contains a File that is Embargoed
        Then the Embargoed file do not have an expandable Preview panel
        And the file cannot be downloaded
        And the user can see the date for when the file will no longer be Embargoed
