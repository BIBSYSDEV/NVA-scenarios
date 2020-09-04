    @1424
    Scenario Outline: Institution Administrator configures automatic Creator role
        Given that the User is logged in as Institution Administrator
        And they are on the User Administration Page
        And they see a list of checkboxes in the Registrator section with the labels:
            | Scientific employees               |
            | Techincal administrative employees |
        And they see that none of the checkboxes are selected
        When they select the checkbox with with text <Option>
        And they click the Save button
        Then they see a Notification that users matching <Option> will get the Creator role
        Examples:
            | Option                             |
            | Scientific employees               |
            | Techincal administrative employees |
# More options may be added in future