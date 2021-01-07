Feature: Creator selects Reference type Part of book/report and selects subtype

    @395
    Scenario: Creator sees fields for Reference subtype "Chapter in book"
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select the Reference Type "Part of book/report"
        And they select the Registration Subtype "Chapter in book"
        Then they see an information box describing that a Container book must be published first
        And they see fields:
            | DOI                            |
            | Search box for published books |
            | Pages from                     |
            | Pages to                       |
            | Peer reviewed                  |
        And they see the Norwegian Science Index (NVI) evaluation status

    @2021
    Scenario: Creator sees fields for Reference subtype "Chapter in report"
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select the Reference Type "Part of book/report"
        And they select the Registration Subtype "Chapter in report"
        Then they see an information box describing that a Container report must be published first
        And they see fields:
            | DOI                              |
            | Search box for published reports |
            | Pages from                       |
            | Pages to                         |