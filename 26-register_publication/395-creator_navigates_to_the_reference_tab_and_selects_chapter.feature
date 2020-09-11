    @395
    Scenario: Creator navigates to the Reference tab and selects Chapter
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
        And they see the NVI evaluation is Not NVI Applicable