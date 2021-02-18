Feature: Anonymous User views Landing Page for Registration

    @881
    Scenario Outline: Anonymous User views Landing Page for Registration
        Given the Anonymous User has opened NVA
        And they see the "<Page>"
        When they click to view a Registration
        Then the Landing Page for Registration is opened
        And they see page fields for
            | Title                           |
            | Abstract                        |
            | NPI                             |
            | Keywords                        |
            | Publication date                |
            | Primary language                |
            | Projects                        |
            | Publication type                |
            | Publication subtype             |
            | Fields corresponding to subtype |
            | Contributors                    |
            | Files                           |
            | DOI link                        |
            | License                         |
        Examples:
            | Page        |
            | Start Page  |
            | Public Page |
