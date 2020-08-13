    @1313
    Scenario: Administrator opens User Administration (Part II)
        Given that the user is logged in as Administrator
        When they click the menu item User Administration
        Then they see the User Administration page
        And they see the Sections
            | Institution Administrators |
            | Curators                   |
            | Editors                    |
        And they see each Section contains a list of all users with matching Role affiliated with their institution
        And they see each Section a Button to add a user with the Role associated with the Section
        And they see that each list has the fields
            | Authentication ID |
            | Name              |
            | ORCID             |
            | Last login        |
            | Created           |
        And they see a button Remove that is enabled for each user
        And they see a Section named Creators that contains a checkbox for Assign role Creator automatically