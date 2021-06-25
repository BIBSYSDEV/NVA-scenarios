Feature: Project Landing Page

    @2630
    Scenario: User opens Landing Page for Project
        Given Anonymous User views Landing Page for Registration
        And the Registration has a Project
        When they click the Link to a Project
        Then they see:
            | Title     |
            | Owner     |
            | Manager   |
            | Period    |
            | Financing |
            | Approvals |
        And they see collapsed panels:
            | Scientific summary |
            | Participants       |
            | Results            |
        And they see number of elements of Participants and Results

    @xxx
    Scenario: Project Manager opens Landing Page for Project
        Given User opens Landing Page for Project
        When the User is Project Manager for the Project
        Then they can see an Edit button
        And they can see a Delete button

    @2697
    Scenario: User sees Clinical Trial Phase for Drug studies
        Given User opens Landing Page for Project
        When the Project is a Drug study
        Then they can see the Project's Clinical Trial Phase

    @2631
    Scenario: User opens Scientific summary for a Project
        Given User opens Landing Page for Project
        When they expand "Scientific summary"
        Then they see the Scientific summary

    @2632
    Scenario: User opens Participants for a Project
        Given User opens Landing Page for Project
        When they expand "Participants"
        Then they see a list of Participants and their:
            | Name        |
            | Role        |
            | Affiliation |
            | Start Date |

    @2633
    Scenario: User opens Results for a Project
        Given User opens Landing Page for Project
        When they expand "Results"
        Then they see a list of Results

    @xxx
    Scenario: Project Manager clicks the Delete Button for a Project
        Given Project Manager opens Landing Page for Project
        When they click the Delete Button
        Then they see a Confirm Dialog

    @xxx
    Scenario: User deletes a Project
        Given User clicks the Delete Button for a Project
        When they Confirm the action
        Then the Confirm Dialog is closed
        And the Project is marked deleted
        And The Project is removed from the Projects list
