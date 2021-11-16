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
            | Publisher                 |
            | Process/method            |
            | Country                   |
            | GPS-coordinates           |
            | Geographic area           |
            | Data Management Plan      |
            | Publication using Dataset |
            | Other related resources   |

    Scenario: Creator register dataset using metadata from a source
        Given Creator registers a Dataset
        And Creator started the registeration wizard with an external source
        Then a read only field named "Link to original version" is displayed
        And it contain the DOI or link that is the source of the metadata
        And Creator may optionaly delete it

    Scenario: Creator see default options for Publisher
        Given Creator registers a Dataset
        When Creator clicks the Publisher field
        Then all affiliated institutions on his profile is listed
        And the field informs "Search for publisher"

    Scenario: Creator searches for Publisher
        Given Creator see default options for Publisher
        When Creator enters a search term for Publisher
        Then they see a list of mathcing Publishers from the channel register

    Scenario: Creator adds Process/method
        Given Creator registers a Dataset
        When Creator enter some text in the Process/method field
        Then the text is stored
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds Country
        Given Creator registers a Dataset
        When Creator enter some text in the Country field
        Then Creator choose from list of relevant matches
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds GPS-coordinates
        Given Creator registers a Dataset
        When Creator enter some GPS-coordinates
        Then the GPS-coordinates is stored
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds Geographic area
        Given Creator registers a Dataset
        When Creator enter some text in the Geographic area field
        Then the text is stored
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds Data Management Plan
        Given Creator registers a Dataset
        When Creator enter some text in the Data Management Plan field
        And posible matching resources of type Data Management Plan is listed
        Then Creator may select one from the list or store the text entered
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds Publication using dataset
        Given Creator registers a Dataset
        When Creator enter some text in the Publication using dataset field
        And posible matching resources of any type is listed
        Then Creator may select one from the list or store the text entered
        And Creator may add repeated occurrences of this field

    Scenario: Creator adds Other related resources
        Given Creator registers a Dataset
        When Creator enter some text in the Other related resources field
        And posible matching resources of any type is listed
        Then Creator may select one from the list or store the text entered
        And Creator may add repeated occurrences of this field
