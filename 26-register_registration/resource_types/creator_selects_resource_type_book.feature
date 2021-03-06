Feature: Creator selects Resource type Book

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Book"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Book"
        Then they see a list of subtypes:
            | Anthology           |
            | Monograph           |
            | Abstract collection |
            | Exhibition catalog  |

    @392
    Scenario Outline: Creator navigates to the Resource Type tab and selects Resource subtype
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "<BookType>"
        And they see fields:
            | Publisher             |
            | ISBN                  |
            | Total number of pages |
        Examples:
            | BookType            |
            | Anthology           |
            | Monograph           |
            | Abstract collection |
            | Exhibition catalog  |

    @2229
    Scenario Outline: Creator sees that fields for Book are validated on Resource Type tab
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "<BookType>"
        And they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Publisher |
        Examples:
            | BookType            |
            | Anthology           |
            | Monograph           |
            | Abstract collection |
            | Exhibition catalog  |

    @test
    @1963
    Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Monograph"
        Given Creator navigates to the Resource Type tab and selects Resource type "Book"
        When they select Resource subtype "Monograph"
        And they see fields:
            | NPI discipline |
            | Series title   |
            | Series number  |
        And they see a field Content Type with options:
            | Academic Monograph        |
            | Non-fiction Monograph     |
            | Popular Science Monograph |
            | Textbook                  |
            | Encyclopedia              |

    @2782
    Scenario: Creator selects Resource subtype "Monograph" and Content type Academic Monograph
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Monograph"
        When they select Content type "Academic Monograph"
        Then they see fields:
            | Peer reviewed         |
            | Presents new research |
        And they see the Norwegian Science Index (NVI) evaluation status
