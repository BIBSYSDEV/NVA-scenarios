  Scenario: A user searches for a resource
    Given that a user is on the start page and is not logged in
    And there are three documents with the word Norway in the title
    When the user enters Norway into the search input
    And clicks Search
    Then the user sees three hits for Norway displayed in the search display
    And each hit contains information about the title, author, year, and publication type

  Scenario: A user finds a resource
    Given that a user has searched for Norway
    When they click a search result
    Then they see the resource page for that result

  Scenario: A user searches for an author ID
    Given that a user is on the start page and is not logged in
    And they know an author ID
    And there are ten publications with that author ID
    When the user searches for the author ID
    And clicks Search
    Then the user sees ten hits for the author ID displayed in the search display
    And each hit contains information about the title, author, year, and publication type

