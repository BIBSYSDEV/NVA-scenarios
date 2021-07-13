The Worklist is the Curators main tool to keep an overview of requests from the Users. Each request is a part of a registration (drafted or published).

The Editors decide how many Curators the Institution needs. Curators have access to the worklist and share responsibillity to answer requests from Users. A Editor may down-scope a Curators responsibiblity to any formal part of the organization and thus reduce the group of Users this Curator need to handle. The Curator may override this scope to view and assist the other Curators (at the same Institution).

The Worklist offer a seach that enable the Curator to locate request, regardless of type, but results are viewed by types. The result list can then be filterd on the requests current status.

The worklist is diveded into four types of requests:
    Approvals to publish:
        - The Editor decide who can publish and how it is done
            - Default can any User publish.
            - Editor may impose a temporly embargo on any files, untill a Curator have review ther content and there lisesens
            - Editor may restruct all publishing reaght 
        - If restrictions to publish is relevant, a User's request to publish results in a Approval request to a Curator
        - The Curator may review and update and/or have a dialog with the user, before the content is published or the request is declined
    Support request:
        - The User may request support from a Curator from any steps in the registration flow
    DOI Request:
        - The User may request a DOI on any published registration (the Curator, is a User, and may also request a DOI)
        - The Curator views the content and decide if a DOI is apropriate and may initiate a dialog, decline the request or mint a DOI.
        - The User may mint a draft DOI, on a draft (unpublished) registration. If the registration is published, then a DOI request is automaticly sendt.
    Ownership request:
        - Each registration is owned by a User and his active institution affiliation decide the owning institution.
        - The active institution affiliation is decided by the log in method (current Feide IDP).
        - Curator at the current owning institution decide if ownerhip should be granted or not in the two cases:
            - Any authenicated User can claim ownership to any registration.
            - Any owner can give ownership to any known User.

The Worklist is described by following feature files:
        my_worklist:
            - Opens the Worklist with the Curators scope at the Institution
            - Shows the first type of requests that has status New, or the Approval requests
            - Curator can handle requsts of all types
            - When the User opens a request, it gets Owned by this Curator. This is visible to other Curators.
            - A Curator may view a request that is Owned by other.
            - If a Curator handles a request that is Owned by someone else, they automaticly claims Ownership of the request.
        approval_requests:
            - Curator can read the request, review the registration and update it, start a dialog with the User or approv publication as it is.
        support_requests:
            - Curator can read the request, review the registration and update it, start a dialog with the User or delete the request.
        doi_requests:
            - 
        ownership_request:
            - Curator can read the request, review the registration and update it, start a dialog with the User or delete the request.






