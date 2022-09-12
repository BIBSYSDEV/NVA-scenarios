Feature: Creator selects Resource type Contribution to journal

    @TEST_NP-4060
    @test
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
    @test
    @1656
    Scenario: Creator sees fields for Journal article
        Given Creator begins registering a Registration in the Wizard with a Link
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype Journal article
        And they see fields:
            | Search-box for Journal |
            | DOI                    |
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
    @test
    Scenario: Creator sees that fields for Journal article are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype Journal article
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
            | Content                |

@TEST_NP-4054
@test
@1409
Scenario Outline: Creator selects Contribution to Journal and Peer Review Details are hidden
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    When they select the Subtype "<Subtype>"
    Then they see that the Peer Review Details are hidden
    Examples:
        | Subtype             |
        | Commentary          |
        | Book review         |
        | Editorial           |
        | Corrigendum         |
        | Journal issue       |
        | Conference abstract |

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
        | DOI                              |
        | Volume                           |
        | Issue                            |
        | Pages from                       |
        | Pages to                         |
        | Article number                   |
    And they see a disabled field for Journal based on selected Journal article

@TEST_NP-4056
@test
Scenario: Creator sees that fields for Resource subtype "Corrigendum" are validated
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select the Resource subtype "Corrigendum"
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
        | Search box for "Journal article" |

@TEST_NP-4057
@2685
@test
Scenario Outline: Creator sees extra fields for Norwegian Science Index (NVI) compatible Journal article
    Given Creator sees fields for Journal article
    When they set Content Type to "<Content Type>":
    Then they see fields:
        | Peer reviewed and presents new research |
    And they see the Norwegian Science Index (NVI) evaluation status
    Examples:
        | Content Type               |
        | Academic article           |
        | Academic literature review |


@TEST_NP-4055
@1659
@test
Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) incompatible Resource subtype
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    Then they see fields:
        | Search box for Journal |
        | DOI                    |
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
@test
Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) incompatible Resource subtype are validated
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
        | Search box for Journal |
    Examples:
        | Subtype             |
        | Commentary          |
        | Book review         |
        | Editorial           |
        | Corrigendum         |
        | Journal issue       |
        | Conference abstract |
