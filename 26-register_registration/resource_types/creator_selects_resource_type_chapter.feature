Feature: Creator selects Resource type Chapter

    @395
    Scenario: Creator sees fields for Resource subtype "Chapter in book"
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource Type
            | Part of book/report |
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
    Scenario: Creator sees fields for Resource subtype "Chapter in report"
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource Type
            | Part of book/report |
        And they select the Registration Subtype "Chapter in report"
        Then they see an information box describing that a Container report must be published first
        And they see fields:
            | DOI                              |
            | Search box for published reports |
            | Pages from                       |
            | Pages to                         |
