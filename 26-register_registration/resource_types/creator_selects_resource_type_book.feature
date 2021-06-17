Feature: Creator selects Resource type Book

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Book"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Book"
        Then they see a list of subtypes:
            | Anthology |
            | Monograph |

    @392
    Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Anthology"
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "Anthology" from the list
        Then they see a Search box for "Publisher name"
        And they see a checkbox for "Is this a textbook?"
        And they see fields:
            | ISBN                  |
            | Total number of pages |
            | NPI discipline        |
        And they see a Search box for "Title of the Series"

    @2229
    Scenario Outline: Creator sees that fields for Book are validated on Resource Type tab
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "<BookType>" from the list
        And they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Publisher      |
            | NPI discipline |
        Examples:
            | BookType  |
            | Anthology |
            | Monograph |

    @1963
    Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Monograph"
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "Monograph" from the list
        Then they see a Search box for "Publisher name"
        And they see a checkbox for "Is this a textbook?"
        And they see fields:
            | ISBN                  |
            | Total number of pages |
            | NPI discipline        |
        And they see a Search box for "Title of the Series"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see the Norwegian Science Index (NVI) evaluation status
