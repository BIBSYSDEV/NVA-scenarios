Feature: Creator navigates to Resource Type tab and selects Artistic Result

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Artistic Result"
        Then they see a list of subtypes:
            | Design |

    @xxx
    Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
        When they select Resource Subtype "Design"
        Then they see field for Type Work with options:
            | Product               |
            | Interior Architecture |
            | Clothing Design       |
            | Lighting Design       |
            | Exhibition            |
            | Graphical Design      |
            | Illustration          |
            | Interaction Design    |
            | Web Design            |
            | Service Design        |
            | Other                 |
        And they see a field for entering more information about the result
        And they see a list of Exhibition Places with fields:
            | Name       |
            | Date start |
            | Date end   |
            | Order      |
        And they see that each Exhibition Place has a Delete Button
        And they see Button to add a Exhibition Place

    Scenario: Creator adds an Exhibition Place
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        When they click Add Exhibition Place
        Then a new row are added to list of Exhibition Places

    Scenario: Creator selects Other type of work
        Given Creator navigates to the Resource Type tab and selects a Resource subtype
        When they select Other as Type Work
        Then they see a new field where they can enter actual Type
