Feature: Creator registers Corresponding Author

    @1214
    Scenario: Creator registers Corresponding Author
        Given Creator begins registering a Publication in the Wizard
        And they navigate to the Contributors tab
        And they see an Author
        When they check the Corresponding checkbox
        And they see the Corresponding Author Email field
        And they enter a valid email address in the Corresponding Author Email field
        And they navigate to the Submission tab
        Then they see that the Author is registered as a Corresponding Author
