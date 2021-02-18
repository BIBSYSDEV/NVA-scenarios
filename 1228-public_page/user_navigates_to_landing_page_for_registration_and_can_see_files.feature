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
        Then they can see files that are not Administrative Agreement are listed
        And for each file they can see:
            | name    |
            | size    |
            | version |
            | license |
        And they can download files that are not embargoed

    @2158
    Scenario: Files can be previewed
        Given a User views the Landing Page for a Registration
        And the Registration contains Files that are not embargoed
        And every file has an expandable Preview panel
        When the user expands the Preview panel
        Then the selected file is downloaded
        And the downloaded file is of type "<FileType>"
        And the downloaded file is displayed
        Examples:
            | FileType         |
            | PDF              |
            | Image            |
            | Microsoft Office |

    Scenario: Automatically preview first file
        Given a User views the Landing Page for a Registration
        And the Registration contains Files
        When the first file is not embargoed
        And the file's size is less than 10 MB
        Then the file's Preview panel is expanded by default
        And the file is automatically downloaded
        And the downloaded file is displayed

    Scenario: Lock embargoed files
        Given a User views the Landing Page for a Registration
        And the Registration contains a File that is embargoed
        Then the embargoed file do not have an expandable Preview panel
        And the file cannot be downloaded
        And the user can see the date for when the file will no longer be embargoed