Feature: Creator selects Resource type Chapter

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        Given Creator navigates to Resource Type tab
        When they select the Resource type "Chapter"
        Then they see a list of subtypes:
            | Chapter of Anthology               |
            | Chapter of Report                  |
            | Introduction                       |
            | Summary of conference presentation |

    @2021
    Scenario Outline: Creator sees fields for Chapter subtypes
        Given Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        When they select the Resource Subtype "<ChapterType>"
        Then they see an information box describing that a Container report must be published first
        And they see fields:
            | DOI                      |
            | Search box for Publisher |
            | ISBN                     |
            | Number of pages          |
        Examples:
            | ChapterType                        |
            | Chapter of Report                  |
            | Introduction                       |
            | Summary of conference presentation |

    @395
    Scenario: Creator sees fields for Resource subtype "Chapter in Anthology"
        Given Creator navigates to the Resource Type tab and selects Resource type "Chapter"
        And they select the Resource Subtype "Chapter in Anthology"
        Then they see an information box describing that a Container book must be published first
        And they see fields:
            | DOI                                  |
            | Search box for published Anthologies |
            | NPI discipline                       |
            | Pages from                           |
            | Pages to                             |
        And they see Content type field with options:
            | Scientific chapter      |
            | Subject chapter         |
            | Popular science chapter |
            | Text book chapter       |
            | Encyclopedia chapter    |

    @2785
    Scenario: Creator selects Resource subtype "Chapter in Anthology" and Content type "Scientific chapter"
        Given Creator sees fields for Resource subtype "Chapter in Anthology"
        When they select Content type "Scientific chapter"
        Then they see fields:
            | Peer reviewed         |
            | Presents new research |
        And they see the Norwegian Science Index (NVI) evaluation status
