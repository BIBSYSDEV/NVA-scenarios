Feature: Owner navigates to the Public Page for Publication and requests a DOI

    @1232
    Scenario: Owner navigates to the Landing page and requests a DOI
        Given that the Creator navigates to the Landing page for published registration without DOI
        And they are the Owner of the Publication
        And open "Request a DOI" dialog
        And optional add a message to the Curator
        When the user click the Send Button
        Then the Landing page is displayed
        And the "Request a DOI" button is no longer visible
        And the request is listed in My Messages
        
        And the request is listed in Curator Worklist
