    @31
    Scenario: An Anonymous User searches for "Norway"
        Given that an Anonymous User is on the start page
        And there are three documents with the word "Norway" in the title
        When the user enters "Norway" into the search input
        And clicks Search
        Then the user sees three Hits for "Norway" displayed in the search display
        And each hit contains information about the title, author, year, and publication type
