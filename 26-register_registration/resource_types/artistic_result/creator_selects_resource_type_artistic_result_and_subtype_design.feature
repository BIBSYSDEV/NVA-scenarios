Feature: Creator selects Resource type Artistic Result and subtype Design

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