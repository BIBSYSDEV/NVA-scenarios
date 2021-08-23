Feature: Anonymous User views Landing Page for Registration

    @881
    Scenario: Anonymous User views Landing Page for Registration
        Given the Anonymous User has opened NVA
        When they navigate to Landing Page for a Registration
        Then they see page fields for:
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
