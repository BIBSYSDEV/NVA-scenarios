Feature: Administrator opens user administration

@test
@359
Scenario Outline: Administrator opens User Administration
    Given that the user is logged in as Administrator
    When they click the menu item Users
    Then they see the User Administration page
    And they see that Section "<Section>" lists all users affiliated with their institution with role "<Role>"
    And they see a Button "<Button>"
    And they see that the list has the fields "Username" and "Name" for each user
    And they see a button "Remove" that is enabled for each user
    And they see the number of items viewed per page
    And they can change the number of items viewed per page
    And they see the number of items viewed of the total amount of items
    And they see that previous page of items is disabled
    And they can select next page of items
    And they see a section Registrator with a policy for who are able to publish
    Examples:
        | Section        | Role          | Button            |
        | Administrators | Administrator | Add Administrator |
        | Curators       | Curator       | Add Curator       |
        | Editors        | Editor        | Add Editor        |

Scenario: Administrator inspect a Curators scope
    Given Administrator opens User Administration
    When they see on the Curator section of the User Administration
    Then they see that each Curator has a "Scope" field
    And the "Scope" field is a dropdown containing all levels of their Institution
    Examples:
        | Section        | Role          | Button            |
        | Administrators | Administrator | Add Administrator |
        | Curators       | Curator       | Add Curator       |
        | Editors        | Editor        | Add Editor        |

@2841
Scenario: Administrator define a Curators scope
    Given Administrator opens User Administration
    When they click on the Scope dropdown for a Curator
    And they select an Institution (or subunit)
    Then the dropdown is closed
    And they see a confirmation message that the Scope was updated

@test
@363
Scenario Outline: Administrator opens the Add Role Dialog
    Given Administrator opens User Administration
    When they click "<Button>" under "<Section>"
    Then they see the Add Role Dialog 
    And they see an Information box
    And they see an input field to Search for employees
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

@test
@1362
Scenario Outline: Administrator searches for User
    Given Administrator opens the Add Role Dialog
    And they click "<Button>" under "<Section>"
    When they enter text into the Search field
    Then they see a list of employees matching the search with an "Add" button
    Examples:
        | Section       | Button            |
        | Administrator | Add Administrator |
        | Curator       | Add Curator       |
        | Editor        | Add Editor        |

@test
@1363
Scenario Outline: Administrator grants an Employee a role
    Given Administrator opens the Add Role Dialog
    And they click "<Button>" under "<Section>"
    When they click "Add" Button for an Employee
    Then they see a confirmation message
    And they see that the clicked "Add" button is disabled
    Examples:
        | Section       | Button            |
        | Administrator | Add Administrator |
        | Curator       | Add Curator       |
        | Editor        | Add Editor        |

@test
Scenario Outline: Administrator closes the Add Role Dialog 
    Given Administrator opens the Add Role Dialog
    And they click "<Button>" under "<Section>"
    When they click the "Close" button 
    Then the Add Role Dialog is closed
    Examples:
        | Section       | Button            |
        | Administrator | Add Administrator |
        | Curator       | Add Curator       |
        | Editor        | Add Editor        |
