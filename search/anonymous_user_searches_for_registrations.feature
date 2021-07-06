Feature: Anonymous User searches for Registrations

    @472
    Scenario: Anonymous User opens search page
        Given an Anonymous User uses a browser
        When they navigate to the search page
        Then they see a input field for basic free text search
        And they see a section with advanced search parameters with filters for:
            | Institution       |
            | Registration Type |
        And they see a list of 10 Published Registrations matching the current search
        And they see each Registrations':
            | Title             |
            | Registration Type |
            | Published date    |
            | Contributors      |
        And they see Paging components for the list

    @32
    Scenario: Anonymous User opens a Registration Landing Page from search page
        Given Anonymous User opens search page
        When they click the Registration Title
        Then Anonymous User views Landing Page for Registration

    @31
    Scenario: Anonymous User performs a basic free text search for Registration Search
        Given Anonymous User opens search page
        When they enter a text in the search field
        And they press Enter
        Then they see only Published Registration where the search input is a substring of either of their:
            | Title             |
            | Abstract          |
            | Contributor names |
        And they see total number of search hits

    @2901
    Scenario: Anonymous User filters on Institution for Registration Search
        Given Anonymous User opens search page
        When they click on an Institution in the advanced search section
        Then they see that the Institution is selected
        And they see only Published Registrations where the selected Institution is the Publisher
        And they see total number of search hits

    @2902
    Scenario: Anonymous User filters on Registration Type for Registration Search
        Given Anonymous User opens search page
        When they click on an Registration Type in the advanced search section
        Then they see that the Registration Type is selected
        And they see only Published Registrations where the selected Type is the Registration Type
        And they see total number of search hits
