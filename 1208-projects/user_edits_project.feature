Feature: User edits Project

    Scenario: User opens My Projects
        Given that a user is logged in
        When they navigate to the Projects Page
        Then they see a list of Projects where the User is either of:
            | Creator         |
            | Project manager |
        And each Project has an Edit Button

    @xxx
    Scenario: User opens a Project
        Given User opens My Projects
        When they click the Edit Button for a Project
        Then they see all fields for the Project:
            | Original title           |
            | Translated title         |
            | Start date               |
            | End date                 |
            | Project funding          |
            | Coordinating Institution |
            | Project manager          |
            | Participants             |
        And the see a Save Button
