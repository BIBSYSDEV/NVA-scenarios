Feature: Creator navigates to the reference tab and selects Reference type Book

    @392
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Anthology"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select Reference type Book
        And they select Reference subtype "Anthology" from the list
        Then they see a Search box for "Publisher name"
        And they see a checkbox for "Is this a textbook?"
        And they see fields for
            | ISBN                  |
            | Total number of pages |
        And they see a Search box for "Title of the Series"
        And they see a preselected value for Peer review "Not peer reviewed"

    @1963
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Monograph"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select Reference type Book
        And they select Reference subtype "Monograph" from the list
        Then they see a Search box for "Publisher name"
        And they see a checkbox for "Is this a textbook?"
        And they see fields for
            | ISBN                  |
            | Total number of pages |
        And they see a Search box for "Title of the Series"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see the Norwegian Science Index (NVI) evaluation status