    @512
    Scenario: A Curator approves a DOI request
        Given that a Curator opens a Publication from a DOI request item
        When they click Create DOI
        Then they see the Public Page for Publication with the new DOI link
        And the Request DOI item is marked as Approved in their Worklist