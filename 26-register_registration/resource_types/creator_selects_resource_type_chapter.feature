Feature: Creator selects Resource type Chapter

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Chapter"
        Then they see a list of subtypes:
            | Chapter of Anthology |
            | Conference abstract  |

    @2021
    Scenario Outline: Creator sees fields for Chapter subtypes
        Given Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        When they select the Resource Subtype "<ChapterType>"
        Then they see an information box describing that a Container report must be published first
        And they see a field "<ContainerField>"
        And they see fields:
            | DOI        |
            | Pages from |
            | Pages to   |
        Examples:
            | ChapterType          | ContainerField                                |
            | Chapter of Anthology | Search box for published Anthologies          |
            | Conference abstract  | Search box for published Abstract collections |

    @395
    Scenario: Creator sees fields for Resource subtype "Chapter in Anthology"
        Given Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        When they select the Resource Subtype "Chapter in Anthology"
        Then they see Content type field with options:
            | Academic Chapter           |
            | Non-fiction Chapter        |
            | Popular Science Chapter    |
            | Textbook Chapter           |
            | Encyclopedia Chapter       |
            | Introduction               |
            | Exhibition Catalog Chapter |

    @2785
    Scenario: Creator selects Resource subtype "Chapter in Anthology" and Content type "Academic chapter"
        Given Creator sees fields for Resource subtype "Chapter in Anthology"
        When they select Content type "Academic chapter"
        Then they see fields:
            | Peer reviewed and presents new research |
        And they see the Norwegian Science Index (NVI) evaluation status
