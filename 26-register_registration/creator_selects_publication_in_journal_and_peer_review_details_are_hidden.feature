Feature: Creator selects Contribution to Journal and Peer Review Details are hidden

    @1409
    Scenario Outline: Creator selects Contribution to Journal and Peer Review Details are hidden
        Given that a Creator navigates to the Resource Type tab
        And they select type Contribution to Journal
        When they select "<Subtype>"
        Then they see that the Peer Review Details are hidden
        Examples:
            | Subtype              |
            | Editorial            |
            | Letter to the Editor |
            | Book review          |