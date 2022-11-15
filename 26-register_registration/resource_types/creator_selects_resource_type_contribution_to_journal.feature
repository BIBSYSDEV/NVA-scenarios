Feature: Creator selects Resource type Contribution to journal

    @TEST_NP-4060
    @274
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Contribution to journal"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        Then they see a list of subtypes:
            # Artikkel i tidsskrift (JournalArticle)
            | Journal article     |
            # Kommentar (JournalLetter)
            | Commentary          |
            # Bokanmeldelse (JournalReview)
            | Book review         |
            # Leder (JournalLeader)
            | Editorial           |
            # Corrigendum (JournalCorrigendum)
            | Corrigendum         |
            # Hefte i tidsskrift (JournalIssue)
            | Journal issue       |
            # Konferanseabstrakt (ConferenceAbstract)
            | Conference abstract |

    @TEST_NP-4052
    @1656
    Scenario: Creator sees fields for Journal article
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype Journal article
        And they see fields:
            | Search-box for Journal |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
        And they see a dropdown for Content Type with options:
            | Academic article           |
            | Academic literature review |
            | Case report                |
            | Study protocol             |
            | Professional article       |
            | Popular science article    |
        And they see the Norwegian Science Index (NVI) evaluation status

    @TEST_NP-4053
    Scenario: Creator sees that fields for Journal article are validated
        Given Creator begins registering a Registration in the Wizard
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype Journal article
        And they enter numbers for "Pages from" and "Pages to"
        And the number for "Pages from" is greater than the number for "Pages to"
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
        And they can see an error messages for field "Pages from"

    @TEST_NP-4059
    @test
    @1625
    Scenario: Creator sees fields for Resource subtype "Corrigendum"
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select the Resource subtype "Corrigendum"
        Then they see fields:
            | Search box for "Journal article" |
            | Volume                           |
            | Issue                            |
            | Pages from                       |
            | Pages to                         |
            | Article number                   |
        And they see a disabled field for Journal based on selected Journal article

    @TEST_NP-4056
    Scenario: Creator sees that fields for Resource subtype "Corrigendum" are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select the Resource subtype "Corrigendum"
        And the number for "Pages from" is greater than the number for "Pages to"
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for "Journal article" |
        And they can see an error message for fields "Pages from"

    @TEST_NP-4057
    @2685
    Scenario: Creator sees extra fields for Norwegian Science Index (NVI) compatible Journal article
        Given Creator sees fields for Journal article
        When they set Content Type to one of:
            | Academic article           |
            | Academic literature review |
        And they see the Norwegian Science Index (NVI) evaluation status

    @TEST_NP-4055
    @1659
    Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) incompatible Resource subtype
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype "<Subtype>"
        Then they see fields:
            | Search box for Journal |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
        Examples:
            | Subtype             |
            | Commentary          |
            | Book review         |
            | Editorial           |
            | Corrigendum         |
            | Journal issue       |
            | Conference abstract |

    @TEST_NP-4058
    Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) incompatible Resource subtype are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype "<Subtype>"
        And the number for "Pages from" is greater than the number for "Pages to"
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
        And they can see an error message for fields "Pages from"
        Examples:
            | Subtype             |
            | Commentary          |
            | Book review         |
            | Editorial           |
            | Corrigendum         |
            | Journal issue       |
            | Conference abstract |
