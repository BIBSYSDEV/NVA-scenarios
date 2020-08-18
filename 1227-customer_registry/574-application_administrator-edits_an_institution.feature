    @574
    Scenario Outline: Application Administrator edits an Institution
        Given Application Administrator views an Institution
        When they make a change in <Field>
        And they add a new Logo
        And they click Save
        Then they see a Notification that the changes are saved
        And they see the <Field> has the new value in the page
        And they see the new Logo in the page

        Examples:
            | Field                         |
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | CNAME                         |
            | Institution DNS               |
            | Administration ID             |
            | Feide Organization ID         |