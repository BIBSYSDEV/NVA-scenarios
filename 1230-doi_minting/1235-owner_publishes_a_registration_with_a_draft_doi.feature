Feature: Owner publishes a Registration with a Draft DOI

    @1235
    Scenario: Owner publishes a Registration with a Draft DOI
        Given that the Owner navigates to the Landing Page for a Registration
        And the Registration is a Draft
        And the Registration has a Reserved DOI
        When the Owner clicks the Publish button
        Then they see that the Registration is Published
        And the DOI request is listed in the Owner's My Messages
        And the DOI request is listed in the Curator's Worklist
