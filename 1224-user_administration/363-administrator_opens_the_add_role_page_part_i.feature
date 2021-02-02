Feature: Administrator opens the Add Role Dialog

    @363
    Scenario Outline: Administrator opens the Add Role Dialog
        Given that the User is logged in as Administrator
        And they are on the User Administration Page
        When they click "<Button>" under "<Section>"
        Then they see the Add Role Dialog with Authentication ID
        And they see a Search box for employees
        And they see an Information box
        And they see a Close button
        Examples:
            | Section       | Button            |
            | Administrator | Add Administrator |
            | Curator       | Add Curator       |
            | Editor        | Add Editor        |
