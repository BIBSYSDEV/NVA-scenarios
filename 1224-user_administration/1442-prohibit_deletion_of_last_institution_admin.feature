    @1442
    Scenario: Prohibit deletion of last Institution Admin
        Given that an App Admin or Institution Admin opens User Administration
        And they see only one current Institution Admin
        Then they see that the Delete button on its name is disabled
        And a mouse-over informs the user that the last Institution Administrator can’t be deleted

