Feature: Creator selects Resource type Contribution to journal

    @274
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Contribution to journal"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        Then they see a list of subtypes:
            | Journal article |
            | Feature article |
            | Comment         |
            | Book review     |
            | Leader          |
            | Corrigendum     |
            | Booklet         |

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
            | Research article        |
            | Review article          |
            | Case report             |
            | Study protocol          |
            | Professional article    |
            | Popular science article |
        And they see the Norwegian Science Index (NVI) evaluation status

    Scenario: Creator sees that fields for Journal article are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype Journal article
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
        And they can see "Invalid format" error messages for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |

    @1409
    Scenario Outline: Creator selects Contribution to Journal and Peer Review Details are hidden
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        When they select the Subtype "<Subtype>"
        Then they see that the Peer Review Details are hidden
        Examples:
            | Subtype         |
            | Feature article |
            | Comment         |
            | Book review     |
            | Leader          |
            | Corrigendum     |
            | Booklet         |

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

    Scenario: Creator sees that fields for Resource subtype "Corrigendum" are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select the Resource subtype "Corrigendum"
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for "Journal article" |
        And they can see "Invalid format" error messages for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |

    @2685
    Scenario: Creator sees extra fields for Norwegian Science Index (NVI) compatible Journal article
        Given Creator sees fields for Journal article
        When they set Content Type to one of:
            | Research article |
            | Review article   |
        Then they see fields:
            | Peer reviewed and presents new research |
        And they see the Norwegian Science Index (NVI) evaluation status

    @1659
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
            | Subtype         |
            | Feature article |
            | Comment         |
            | Book review     |
            | Leader          |
            | Corrigendum     |
            | Booklet         |

    Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) incompatible Resource subtype are validated
        Given Creator begins registering a Registration in the Wizard with a File
        And they navigate to the Resource Type tab
        And they select the Resource type "Contribution to journal"
        And they select Resource subtype "<Subtype>"
        And they enter an invalid value in fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        When they click the Save button
        Then they can see "Mandatory" error messages for fields:
            | Search box for Journal |
        And they can see "Invalid format" error messages for fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        Examples:
            | Subtype         |
            | Feature article |
            | Comment         |
            | Book review     |
            | Leader          |
            | Corrigendum     |
            | Booklet         |
