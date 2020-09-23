Feature: Creator cancels deletion of an item in My Publications list

    @576
    Scenario: Creator cancels deletion of an item in My Publications list
        Given that the user is logged in as Creator
        And is on the My Publications page
        When they click Delete on an item
        And they click No in the confirmation dialog
        Then they see the publication in My Publications list
