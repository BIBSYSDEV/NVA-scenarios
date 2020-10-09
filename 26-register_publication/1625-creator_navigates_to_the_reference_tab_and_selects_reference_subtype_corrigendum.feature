Feature: Creator navigates to the Reference tab and selects Reference subtype "Corrigendum"

    @1625
    Scenario: Creator navigates to the Reference tab and selects Reference subtype "Corrigendum"
        Given that a Creator navigates to the Reference tab
        And they have selected "Contribution to journal" as Reference type
        When they select "Corrigendum" as Publication Subtype
        Then they see mandatory fields:
            | Link to Journal article |
        And they see optional fields:
            | Volume         |
            | Issue          |
            | Pages from     |
            | Pages to       |
            | Article number |
        And they see a disabled field for Journal based on selected Journal article