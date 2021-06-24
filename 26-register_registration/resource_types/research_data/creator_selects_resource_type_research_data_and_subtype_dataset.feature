Feature: Creator selects Resource type Research Data and Subtype Dataset

    Scenario: Creator sees fields for Dataset subtype
        Given Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        When they select the Resource Subtype "Dataset"
        And they see Radio groups for:
            | Contains personal information |
            | Contains confidential data    |
        And the Radio groups has options:
            | Yes        |
            | No         |
            | Don't know |

    Scenario: Creator registers a confidential Dataset
        Given Creator sees fields for Dataset subtype
        When they select "Yes" or "Don't know" for any of the Radio groups
        Then they see an info box describing what they should do next

    Scenario: Creator registers a non-confidential Dataset
        Given Creator sees fields for Dataset subtype
        When they select "No" for both Radio groups
        Then they see fields:
            | Publisher                   |
            | Process/method              |
            | Geographic area             |
            | Data Management Plan        |
            | Registrations using Dataset |
            | Other resources             |
