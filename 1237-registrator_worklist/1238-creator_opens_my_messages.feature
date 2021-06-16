Feature: Creator opens My Messages

    @1238
    Scenario Outline: Creator opens My Messages
        Given that the user is logged in as Creator
        When they click the menu item My Messages
        Then they see the My Messages page
        And they see a list of "<RequestType>" with fields:
            | Registration title |
            | Date               |
        And they see that items' status is one of <RequestStatus>
        And they see that each item in the list is expandable
        Examples:
            | RequestType      | RequestStatus                 |
            | DoiRequests      | Approved, Rejected, Requested |
            | Support Requests | Pending, Resolved             |
            
            Voksenopplæring
