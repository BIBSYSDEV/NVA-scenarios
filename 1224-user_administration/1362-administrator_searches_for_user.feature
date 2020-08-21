    @1362
    Scenario: Administrator searches for User
        Given that the Administrator opens the Add Role Dialog
        When they type "Kari" in the Search Box
        And they click the Search Button
        Then they see the Search Result for "Kari"
        And they see the field "Authentication ID"
        And they see an Add Role button for each row