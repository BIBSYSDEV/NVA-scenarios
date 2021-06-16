Feature: Creator navigates to Resource Type tab and selects Artistic Result

    @2732
    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
        Given Creator begins registering a Registration in the Wizard with a File
        When they navigate to the Resource Type tab
        And they select the Resource type "Artistic Result"
        Then they see a list of subtypes:
            | Artistic result - Architecture   |
            | Artistic result - Design         |
            | Artistic result - Film           |
            | Artistic result - Music          |
            | Artistic result - Performing art |
            | Artistic result - Writing art    |
            | Artistic result - Visual art     |

    @2733
    Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
        When they select Resource Subtype "Artistic result - Design"
        Then they see fields:
            | More information |
        And they see field for Type Work with options:
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
        And they see a list of Exhibition Places with fields:
            | Name       |
            | Date start |
            | Date end   |
            | Order      |
        And they see that each Exhibition Place has a Delete Button
        And they see an Add Exhibition Place Button

    @2735
    Scenario: Creator adds an Exhibition Place
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        When they click the Add Exhibition Place Button
        Then a new row are added to list of Exhibition Places

    @2736
    Scenario: Creator Deletes an Exhibition Place
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        When they click the Add Exhibition Place Button
        Then a new row are added to list of Exhibition Places

    @2739
    Scenario: Creator selects Other type of work for Resource Type "Artistic result"
        Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
        When they select Other as Type Work
        Then they see a new field where they can enter actual Type
