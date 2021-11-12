Feature: Anonymous User views Landing Page for Registration

    @test
    @881
    Scenario: Anonymous User views Landing Page for Registration
        When an Anonymous user navigates to a Landing Page for a Resource
        Then they see
            | Title                           |
            | Abstract                        |
            | NPI                             |
            | Keywords                        |
            | Publication date                |
            | Primary language                |
            | Projects                        |
            | Registration subtype            |
            | Fields corresponding to subtype |
            | Contributors                    |
            | Files                           |
            | DOI link                        |
            | Related Registrations           |
            | License                         |
        And they see sharing Buttons for:
            | Email    |
            | LinkedIn |
            | Facebook |
            | Twitter  |
