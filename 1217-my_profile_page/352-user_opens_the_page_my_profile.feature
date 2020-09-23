Feature: User opens the page My Profile

    @352
    Scenario: User opens the page My Profile
        Given that the user is logged in
        When they click the menu item My Profile
        Then they see My Profile
        And they see their Profile page which includes information for
            | Real name          |
            | Feide ID           |
            | Email              |
            | ORCID              |
            | Role(s)            |
            | Institution        |
            | Contact info       |
            | Preferred language |