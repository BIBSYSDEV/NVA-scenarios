    @392
    Scenario Outline: Creator navigates to the Reference tab and selects Book
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select Publication Type Book
        And they select Publication Subtype <Subtype> from the list
            | Monograph |
            | Anthology |
            | Chapter   |
        Then they see a Search box for "Publisher name"
        And they see a checkbox for "Is this a textbook?"
        And they see fields for
            | ISBN                  |
            | Total number of pages |
        And they see a Search box for "Title of the Series"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see the NVI evaluation is Not NVI Applicable
        Examples:
            | Subtype   |
            | Monograph |
            | Anthology |