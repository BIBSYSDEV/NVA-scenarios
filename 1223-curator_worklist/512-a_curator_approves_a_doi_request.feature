Feature: A Curator approves a DOI request

    @512
    Scenario: A Curator approves a DOI request
        Given that a Curator opens a Publication from a DOI Request Worklist Item
        When they click Create DOI
        Then they see the Public Page for Publication
        And the Publication has a DOI Link
        And the Request DOI item is marked as Approved in their Worklist