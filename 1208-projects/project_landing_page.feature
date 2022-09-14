Feature: Project Landing Page

    In order to know about a project
    As an anonymous User
    I want an overview of the projects details

    In order to publish validated information about a project
    As a logged in User
    I want to get an preview of my project, before I make it public

    In order to correct a project that is misleading
    As a logged in User with relevant access
    I want to be able to manage a published project

    In order to understand the Research Graph
    As an anonymous User
    I want to experience a high recognition between the Projects and the Outputs Landing Pages desing's

    In order to navigate the Research Graph
    As an anonymous User
    I want to get all relevant navigation options for further discovery of the project's outputs, participants, finances and approvals

    Rules:
    - A project has a persistent identifier, enabling correct citation and coining it as a entity in the Research Graph

    This file is not reviewed, yet.
    Jan Erik 14. sep.

    @TEST_NP-4083
    @test
    @2630
    Scenario: User opens Landing Page for Project
        When A Anonymous User opens a Project's Landing Page
        Then the Anonymous User see:
            | Project Title             |
            | Project Owner Institution |
            | Project Manager           |
            | Project Period            |
            | Financing                 |
        And the Anonymous User see collapsed panels:
            | Summary      |
            | Participants |
            | Results      |
        And the Anonymous User see count of Participants and Results

    @TEST_NP-4098
    @2886
    Scenario Outline: Privileged user sees Edit button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the project
        Then they can see an Edit button
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    @TEST_NP-4087
    @2885a
    Scenario Outline: Privileged user sees Delete button for Project
        Given User opens Landing Page for Project
        When the User has the "<Role>" role for the project
        Then they can see a Delete button
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |

    @TEST_NP-4087
    @2885b
    Scenario: Privileged user clicks the Delete Button for a Project
        Given Privileged user sees Delete button for Project
        When they click the Delete Button
        Then they see a Confirm Dialog

    @TEST_NP-4090
    @2885c
    Scenario: Privileged user deletes a Project
        Given Privileged user clicks the Delete Button for a Project
        When they Confirm the action
        Then the Confirm Dialog is closed
        And the Project is marked deleted
        And The Project is removed from the Projects list

    @TEST_NP-4096
    @2631
    Scenario: User opens Summary for a Project
        Given User opens Landing Page for Project
        When they expand "Summary"
        Then they see "Scientific summary"
        And they see "Popular science summary"

    @TEST_NP-4093
    @2632a
    Scenario: User opens Participants for a Project
        Given User opens Landing Page for Project
        When they expand "Participants"
        Then they see a list of Participants and their:
            | Name        |
            | Role        |
            | Affiliation |

    @TEST_NP-4097
    @2632b
    Scenario: User sees Project Manager for a Project
        Given User opens Participants for a Project
        When they see a Project Manager
        Then they see fields:
            | Start Date |

    @TEST_NP-4092
    @2633
    Scenario: User opens Results for a Project
        Given User opens Landing Page for Project
        When they expand "Results"
        Then they see a list of Results

    @TEST_NP-4094
    @2904
    Scenario Outline: User Publish a Draft Project
        Given User opens Landing Page for a Draft Project
        And it has all required fields:
            | Title                    |
            | Coordinating Institution |
            | Start Date               |
            | Project Manager          |
        And User has role "<Role>" in the project
        When the User clicks on the Publish Button
        Then the project status is Published
        And the Landing Page is publicly accessible
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |
