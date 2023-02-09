Feature: Creator selects Resource tyoe "Exhibition"

    Scenario: Creator navigates to the Resource Type tab and selects Resource type "Exhibition"
        Given Creator starts registering a Registration
        When they navigates to the Resource type tab
        Then they see a list of Exhibition types:
            | "Basisutstilling"    |
            | Temporary exhibition |
            | Popup exhibition     |
            | "Vandreutstilling"   |
            | Digital exhibition   |
            | "Historisk interiør" |
            | Other Exhibition     |

    Scenario: Creator navigates to the Resource Type tab and selects a subtype for "Exhibition"
        Given Creator navigates to the Resource Type tab
        When they select an Exhibition type
        Then they can add information of type:
            | Publication/mention |
            | Exhibition place    |
            | "Formidling"        |
            | Exhibition catalog  |

    Scenario: Creator adds "Publikasjoner/omtale" to registration of subtype "Exhibition"
        Given Creator select an Exhibition type
        When they add "Publication/mention"
        Then they can add information about:
            | Journal/book/medium |
            | Issue               |
            | Page(s)             |
            | Date                |
            | Other information   |

    Scenario: Creator adds "Exhibition place" to registration of subtype "Exhibition"
        Given Creator select an Exhibition type
        When they add "Exhibition place"
        Then they can add information about:
            | Institution name |
            | Place            |
            | From date        |
            | To Date          |

    Scenario: Creator adds "Formidling" to registration of subtype "Exhibition"
        Given Creator select an Exhibition type
        When they add "Formidling"
        Then they can add information about:
            | Type                |
            | Place               |
            | Publisher/organizer |
            | More information    |
            | Date                |

    Scenario: Creator adds "Exhibition catalog" to registration of subtype "Exhibition"
        Given Creator select an Exhibition type
        When they add "Exhibition catalog"
        Then they search for "Exhibition catalog" and add it to the Exhibition


