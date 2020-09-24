Feature: Files that are Administrative Agreements are hidden

    @1530
    Scenario: Files that are Administrative Agreements are hidden
        Given any User views the Landing Page for a Publication
        And the Publication contains a File, which is an Administrative Agreement
        When they view the Files section
        Then they do not see the File that is an Administrative Agreement