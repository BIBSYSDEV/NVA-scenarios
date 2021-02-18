Feature: Anonymous User views Landing Page for Registration

    @881
    Scenario Outline: Anonymous User views Landing Page for Registration
        Given the Anonymous User has opened NVA
        And they see the "<Page>"
        When they click to view a Publication
        Then the Public Page for Publication is opened
        And they see page fields for
            | Title                  |
            | Abstract               |
            | NPI                    |
            | Keywords               |
            | Publication date       |
            | Primary language       |
            | Projects               |
            | Publication type       |
            | Publication subtype    |
            | Values per sybtype     |
            | Clickable Contributors |
            | Clickable emails       |
            | Affiliations           |
            | File download link     |
            | ORCID                  |
            | DOI link               |
            | Licence                |
            | "<Licence link>"       |

        Examples:
            | Page        | Licence link                                                            |
            | Start Page  | https://creativecommons.org/licenses/by/4.0/deed.no                     |
            | Public Page | https://dlr.unit.no/licenses/ntnu-alle-rettigheter-forbeholdt-forfatter |
