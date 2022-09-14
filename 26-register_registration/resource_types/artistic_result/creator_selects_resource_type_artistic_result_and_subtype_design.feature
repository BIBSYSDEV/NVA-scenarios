Feature: Creator selects Resource type Artistic Result and subtype Design

    @test
    @TEST_NP-4039
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
        And they see that each Exhibition Place has an Edit Button
        And they see an Add Exhibition Place Button

    @test
    @TEST_NP-4042
    @2735
    Scenario: Creator adds an Exhibition Place
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        When they click the Add Exhibition Place Button
        Then they see the Add Exhibition Place Dialog
        And they see fields:
            | Exhibition place |
            | Date from        |
            | Date to          |
        And they see an Add Button
        When they fill the fields with input data
        And they click the Add Button
        Then the new Exhibition Place is listed under Exhibition places

    @test
    @TEST_NP-4041
    @2736
    Scenario: Creator Deletes an Exhibition Place
        Given Creator navigates to the Resource Type tab and selects Resource subtype "Design"
        And they see an item in the list of Exhibition Places
        When they click the Delete Exhibition Place Button
        Then the row is removed from list of Exhibition Places
