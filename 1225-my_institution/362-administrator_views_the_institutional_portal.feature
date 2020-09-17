Feature: Administrator views the Institutional Portal

    @362
    Scenario: Administrator views the Institutional Portal
        Given Administrator edits an Institution
        When they visit the Institutional Portal
        Then they see the web address in their web browser is the CName + .nva.unit.no
        And they see the page title is the same as the Display Name on My Institution
