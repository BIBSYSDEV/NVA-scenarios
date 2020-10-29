Feature: Creator requests support

    @1745
    Scenario: Creator opens "Request support" dialog
        Given Creator begins registering a Registration in the Wizard
        When they click the "Request support" button
        Then the "Request support" dialog is opened
        And they see field for Message
        And they see a "Send Request" button