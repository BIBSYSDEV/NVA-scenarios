Feature: Administrator views User Administration Sections with Role members (Part I)

    @359
    Scenario Outline: Administrator views User Administration Sections with Role members (Part I)
        Given that the user is logged in as Administrator
        When they click the menu item Users
        Then they see the User Administration page
        And they see the Section "<Role>"
        And they see the Section "<Role>" contains a list of all users affiliated with their institution and with with role "<Role>"
        And they see a Button "<Button>" to assign the Role "<Role>" to a another user

        And they see the list has the field "Username" for each user
        And they see a button Remove that is enabled for each user
        And they see a section Registrator with a policy for who are able to publish
        Examples:
            | Role                       | Button            |
            | Administrator              | New Administrator |
            | Curator                    | New Curator       |
            | Editor                     | New Editor        |
