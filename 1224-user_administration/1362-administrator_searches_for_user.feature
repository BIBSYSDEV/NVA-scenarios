    @1362
    Scenario: Administrator searches for User
        Given that the Administrator opens Add Role Dialog
        When they execute a search for the employee "Kari"
        Then they see the Search result for "Kari" with Authentication ID
        And they see an Add Role button for each row