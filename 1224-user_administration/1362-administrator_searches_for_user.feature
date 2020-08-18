    @1362
    Scenario: Administrator searches for User
        Given that the Administrator opens the Add Role Page (Part I)
        When they type "Kari" as the first name
        And they click the Search Button
        Then they see the search result for "Kari" with fields
            | Authentication ID |
        And they see an Add Role button for each row