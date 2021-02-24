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
            | NPI discipline        |
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
            | NPI discipline        |
        And they see a Search box for "Title of the Series"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see the Norwegian Science Index (NVI) evaluation status

    @2229
    Scenario: Creator sees that fields for Book are validated on Reference tab
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select Reference type "Book"
        And they select Reference subtype "<BookType>" from the list
        And they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Publisher      |
            | NPI discipline |
        Examples:
            | BookType  |
            | Anthology |
            | Monograph |