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

    @395
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Chapter in anthology"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference Type Book
        And they select the Publication Subtype Chapter
        Then they see an Information box with text "Before you register the chapter, you need to register the book"
        And they see field "Link to publication"
        And they see a Search box for "Published in"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see field for Page number from
        And they see field for Page number to
        And they see a Search box for "Series title"
        And they see the Norwegian Science Index (NVI) evaluation status