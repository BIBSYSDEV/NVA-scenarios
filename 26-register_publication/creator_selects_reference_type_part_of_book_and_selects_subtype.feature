Feature: Creator navigates to the reference tab and selects Reference type Part of book/report

    @395
    Scenario: Creator navigates to the Reference tab and selects Reference subtype
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select the Reference Type "Part of book/report"
        And they select the Registration Subtype "<Subtype>"
        Then they see an information box describing that a Container be published first
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