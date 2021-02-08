Feature: Creator selects Reference type Contribution to journal and selects subtype

    @1656
    Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) compatible Reference subtype
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select Reference subtype "<Subtype>"
        And they see fields:
            | Search-box for Journal |
            | DOI                    |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
            | Peer reviewed          |
        And they see the Norwegian Science Index (NVI) evaluation status
        Examples:
            | Subtype             |
            | Journal article     |
            | Short communication |

    Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) compatible Reference subtype are validated
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select Reference subtype "<Subtype>"
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error message for fields:
            | Search box for Journal |
        And they can see "Invalid format" error message for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        Examples:
            | Subtype             |
            | Journal article     |
            | Short communication |

    @1625
    Scenario: Creator sees fields for Reference subtype "Corrigendum"
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Corrigendum"
        Then they see fields:
            | Search box for "Journal article" |
            | DOI                              |
            | Volume                           |
            | Issue                            |
            | Pages from                       |
            | Pages to                         |
            | Article number                   |
        And they see a disabled field for Journal based on selected Journal article

    Scenario: Creator sees that fields for Reference subtype "Corrigendum" are validated
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select the Reference subtype "Corrigendum"
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error message for fields:
            | Search box for "Journal article" |
        And they can see "Invalid format" error message for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |

    @1659
    Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) incompatible Reference subtype
        Given Creator begins registering a Publication in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select Reference subtype "<Subtype>"
        Then they see fields:
            | Search box for Journal |
            | DOI                    |
            | Volume                 |
            | Issue                  |
            | Pages from             |
            | Pages to               |
            | Article number         |
        Examples:
            | Subtype              |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
            | Feature article      |
            | Interview            |

    Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) incompatible Reference subtype are validated
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Reference tab
        And they select the Reference type "Contribution to journal"
        And they select Reference subtype "<Subtype>"
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
        And they can see "Invalid format" error message for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        Examples:
            | Subtype              |
            | Feature article      |
            | Letter to the Editor |
            | Book review          |
            | Editorial            |
            | Feature article      |
            | Interview            |