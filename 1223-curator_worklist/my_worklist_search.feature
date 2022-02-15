Feature: Curator searches in My Worklist

    Background:
        Given Curator is logged in
        And Curator opens My Worklist from the main menu
        And My Worklist contains Requests of each type:
            | Approval  |
            | Support   |
            | DOI       |
            | Ownership |

    @TEST_NP-4135
    @2795
    @updated
    Scenario Outline: Curator searches in Requests from My Worklist
        When a Curator searches for a term that match at least one Request in their Worklist
        Then the Curator sees "<RequestStatus>" listed as "<Status>" Checkboxes
        And the search results is presented in Request Type tabs:
            | For Approval    |
            | Support         |
            | DOI request     |
            | Change ownersip |
        And each tab has a number of results corresponding to the Checked "<RequestStatus>"
        Examples:
            | RequestStatus | Status    |
            | New           | Checked   |
            | Active        | Checked   |
            | Approved      | Unchecked |
            | Declined      | Unchecked |
            | Archived      | Unchecked |
            | Deleted       | Unchecked |