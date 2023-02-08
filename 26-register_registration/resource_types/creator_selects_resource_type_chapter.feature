Feature: Creator selects Resource type Chapter

    @test
    @TEST_NP-4049
    Scenario: Creator navigates to the Resource Type tab and see list of Chapter types
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Resource Type tab
        Then they can select Chapter Resource types:
            | Academic Chapter           |
            | Non-fiction Chapter        |
            | Popular Science Chapter    |
            | Textbook Chapter           |
            | Encyclopedia Chapter       |
            | Introduction               |
            | Exhibition Catalog Chapter |
            | Chapter in Report          |
            | Conference abstract        |

    @test
    @TEST_NP-4048
    Scenario Outline: Creator sees fields for Chapter subtypes
        Given Creator navigates to the Resource Type tab and see list of Chapter types
        When they select the Resource Subtype "<ChapterType>"
        Then they see an information box describing that a Container report must be published first
        And they see a field "<ContainerField>"
        And they see fields:
            | Pages from |
            | Pages to   |
        Examples:
            | ChapterType                | ContainerField                                |
            | Academic Chapter           | Search box for published Anthologies          |
            | Non-fiction Chapter        | Search box for published Anthologies          |
            | Popular Science Chapter    | Search box for published Anthologies          |
            | Textbook Chapter           | Search box for published Anthologies          |
            | Encyclopedia Chapter       | Search box for published Anthologies          |
            | Introduction               | Search box for published Anthologies          |
            | Exhibition Catalog Chapter | Search box for published Anthologies          |
            | Chapter in Report          | Search box for published Anthologies          |
            | Conference abstract        | Search box for published Anthologies          |
            | Chapter in Report          | Search box for published Reports              |
            | Conference abstract        | Search box for published Abstract Collections |

    @test
    @TEST_NP-4050
    Scenario: Creator sees extra fields for Norwegian Science Index (NVI) compatible Chapter type
        Given Creator navigates to the Resource Type tab and see list of Chapter types
        When they select Resource type "Academic Chapter"
        Then they see the Norwegian Science Index (NVI) evaluation status
