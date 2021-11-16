Feature: Creator selects Resource type Research Data and Subtype Dataset

    Scenario: Creator sees fields for Dataset subtype
        Given Creator navigates to the Resource Type tab and selects Resource type "Research Data"
        When Creator select the Resource Subtype "Dataset"
        And Creator see a question about personal information and confidential data
        And two buttons
            | Yes |
            | No  |

    Scenario: Creator registers a confidential Dataset
        Given Creator sees fields for Dataset subtype
        When Creator select "Yes"
        Then Creator see a user support dialog and is advised to seek help

    Scenario: Creator registers a Dataset
        Given Creator sees fields for Dataset subtype
        When Creator select "No"
        Then Creator see fields:
            | Publisher                   |
            | Process/method              |
            | Country                     |
            | GPS-positions               |
            | Geographic area             |
            | Data Management Plan        |
            | Registrations using Dataset |
            | Other resources             |

    Scenario: Creator adds Publisher
        Given Creator registers a Dataset
        When Creator enter the Publisher field all affiliated institutions on his profile is listed
        And the field is a search box for Kanalregisteret
        Then creator selects a Publisher from the list or search