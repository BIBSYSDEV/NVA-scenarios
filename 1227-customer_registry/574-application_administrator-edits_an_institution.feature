    @574
    Scenario Outline: Application Administrator edits an Institution
        Given Application Administrator views an Institution
        When they make a change in <Field>
        And they click Save
        Then they see a Notification that the changes are saved
        And they see the <Field> has the new value in the page

        Examples:
            | Field                         |
            | Name in organization registry |
            | Display name                  |
            | Short display name            |
            | CNAME                         |
            | Institution DNS               |
            | Feide Organization ID         |