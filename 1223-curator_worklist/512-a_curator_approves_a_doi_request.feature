    @512
    Scenario: A Curator approves a DOI request
        Given that a Curator opens an item in the Worklist
        And the item is a DOI request
        When they click Create DOI
        Then the DOI is created by DataCite
        And they see the Public Page for Publication with the new Doi link
        And the Request DOI button is disabled
        And the Request DOI item is marked as Approved in the Worklist
