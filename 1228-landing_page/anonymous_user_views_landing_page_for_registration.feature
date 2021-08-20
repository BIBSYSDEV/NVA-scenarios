Feature: Anonymous User views Landing Page for Registration

    @881
    Scenario: Anonymous User views Landing Page for Registration
        When a Anonymous user navigate to a Landing Page for a Registration
        Then they see following
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
            | License                         |