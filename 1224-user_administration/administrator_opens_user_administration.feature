Feature: Administrator opens user administration

    @359
    Scenario Outline: Administrator opens User Administration
        Given that the user is logged in as Administrator
        When they click the menu item Users
        Then they see the User Administration page
        And they see the Section "<Role>"
        And each Section "<Role>" lists all users affiliated with their institution with role "<Role>"
        And they see a Button "<Button>" to assign the Role "<Role>" to another user
        And they see that the list has the fields "Username" and "Name" for each user
        And they see a third field for the Curator section, named "Scope" containing a preselected dropdown containing all institution levels
        And they see a button "Remove" that is enabled for each user
        And they see the number of items viewed per page
        And they can change the number of items viewed per page
        And they see the number of items viewed of the total amount of items
        And they see that previous page of items is disabled
        And they can select next page of items
        And they see a section Registrator with a policy for who are able to publish
        Examples:
            | Role                       | Button            |
            | Administrator              | Add Administrator |
            | Curator                    | Add Curator       |
            | Editor                     | Add Editor        |

    @363
    Scenario Outline: Administrator opens the Add Role Dialog
        Given Administrator opens User Administration
        When they click "<Button>" under "<Section>"
        Then they see the Add Role Dialog 
        And they see an Information box
        And they see a input field to Search for employees
        And they see a list of employees with an "Add" button
        And they see the number of items viewed per page
        And they can change the number of items viewed per page
        And they see the number of items viewed of the total amount of items
        And they see that previous page of items is disabled
        And they can select next page of items
        And they see a "Close" button
        Examples:
            | Section       | Button            |
            | Administrator | Add Administrator |
            | Curator       | Add Curator       |
            | Editor        | Add Editor        |

        @1362
        Scenario: Administrator searches for User
        Given Administrator opens the Add Role Dialog
        When they enter text into the Search field
        Then they see a list of employees matching the search with an "Add" button
        And they see the number of items viewed per page
        And they can change the number of items viewed per page
        And they see the number of items viewed of the total amount of items
        And they see that previous page of items is disabled
        And they can select next page of items
        And they see a "Close" button

	@?
    Scenario Outline: Administrator grants an employee a role
        Given Administrator opens the Add Role Dialog
        When the Administrator click the "Add" button under "<Section>"
        Then the relevant employee is granted the role "<Role>"
        And they see the Add Role Dialog 
        And they see an Information box
        And they see a input field to Search for employees
        And they see a list of employees with an "Add" button
        And they see the number of items viewed per page
        And they can change the number of items viewed per page
        And they see the number of items viewed of the total amount of items
        And they see that previous page of items is disabled
        And they can select next page of items
        And they see a "Close" button
        Examples:
            | Section       | Role          |
            | Administrator | Administrator |
            | Curator       | Curator       |
            | Editor        | Editor        |

	@?
    Scenario: Administrator closes the Add Role Dialog 
        Given Administrator opens the Add Role Dialog
        When the Administrator click "Close" button 
        Then the Add Role Dialog is closed
