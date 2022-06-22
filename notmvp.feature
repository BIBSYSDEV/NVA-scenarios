    @1313
    Scenario Outline: Administrator views User Administration Sections with Role members (Part II)
        Given that the user is logged in as Administrator
        When they click the menu item User Administration
        Then they see the User Administration page
        And they see the <Section>
        And they see the <Section> contains a list of all users affiliated with their institution and with with role <Role>
        And they see under each Section a Button to assign the <Role> to a another user
        And they see that each list has the fields:
            | Authentication ID |
            | Name              |
            | ORCID             |
            | Last login        |
            | Created           |
        And they see a button Remove that is enabled for each user
        And they see a checkbox for "Assign role Creator automatically"
        Examples:
            | Section                    | Role          |
            | Institution Administrators | Administrator |
            | Curators                   | Curator       |
            | Editors                    | Editor        |
            | Creators                   | Creator       |

    @1314
    Scenario Outline: Administrator assigns a Role to a User (Part II)
        Given that the user is logged in as Administrator
        And they are on the User Administration Page
        When they click Add User under the <Section>
        Then they see a new row in the <Section> with fields:
            | Authentication ID |
            | Name              |
        And they see an Add button
        Examples:
            | Section       |
            | Administrator |
            | Curator       |
            | Editor        |
