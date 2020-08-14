    @355
    Scenario: Creator opens an item in My Publication list
        Given that the user is logged in as Creator
        And is on the page My Publications
        When they click Edit on an item
        Then they see the item is opened in the Wizard
        And they see the Description tab
        And they see fields:
            | Title                        |
            | Alternative title(s)         |
            | Abstract                     |
            | Alternative abstract(s)      |
            | Description                  |
            | Date published               |
            | Primary language for content |
