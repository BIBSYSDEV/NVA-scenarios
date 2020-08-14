    @575
    Scenario: Administrator uploads a new Logo
        Given Administrator opens My Institution
        When they click Upload Logo
        And they select an image from their computer
        And they click OK
        Then they see the Logo on My Institution page
