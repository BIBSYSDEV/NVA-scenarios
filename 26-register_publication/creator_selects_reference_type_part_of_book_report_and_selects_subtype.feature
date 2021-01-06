Feature: Creator selects Reference type Part of book/report and selects subtype

    @395
    Scenario: Creator sees fields for subtypes compatible with Reference type Part of book/report
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select the Reference Type "Part of book/report"
        And they select the Registration Subtype "<Subtype>"
        Then they see an information box describing that a Container must be published first
        And they see a disabled field for "DOI to resource"
        And they see a Search box for "<Container>"
        And they see a preselected value for Peer review "Not peer reviewed"
        And they see field for Page number from
        And they see field for Page number to
        And they see the Norwegian Science Index (NVI) evaluation status
        Examples:
            | Subtype           | Container         |
            | Chapter in book   | Published books   |
            | Chapter in report | Published reports |