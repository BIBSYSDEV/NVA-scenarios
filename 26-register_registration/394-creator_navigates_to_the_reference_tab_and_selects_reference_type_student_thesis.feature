Feature: Creator navigates to the Resource Type tab and selects Reference type Student thesis

    Scenario: Creator navigates to the Resource Type tab and selects Reference type "Student thesis"
        Given Creator begins registering a Registration in the Wizard
        When they navigate to the Reference tab
        And they select the Reference type "Student thesis"
        Then they see a list of subtypes:
            | Bachelor thesis      |
            | Master thesis        |
            | Doctoral thesis      |
            | Other student thesis |