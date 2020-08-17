    @1232
    Scenario: Owner navigates to the Public Page for Publication and requests a DOI
        Given that the Creator navigates to the Public Page for Publication for published publication without DOI
        And they are the Owner of the Publication
        And open "Request a DOI" dialog
        And optional add a message to the Curator
        When the user click the Send Button
        Then the Public Page for Publication is displayed
        And the "Request a DOI" button is renamed to "DOI pending" and is disabled
        And the request is listed in User Worklist
        And the request is listed in Curator Worklist