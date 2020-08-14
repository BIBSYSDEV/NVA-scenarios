    @410
    Scenario: User opens Add Institution from My Profile
        Given user opens the page My Profile
        When they click Add Institution
        Then they see the Add Institution dialog is opened
        And they see the Autosearch box for Institutions