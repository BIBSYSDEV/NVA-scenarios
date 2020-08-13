  @31
  Scenario: An Anonymous User searches for "Norway"
    Given that an Anonymous User is on the start page
    And there are three documents with the word "Norway" in the title
    When the user enters "Norway" into the search input
    And clicks Search
    Then the user sees three Hits for "Norway" displayed in the search display
    And each hit contains information about the title, author, year, and publication type

  @32
  Scenario: An Anonymous User selects a Hit
    Given that an Anonymous User searches for "Norway"
    When they click a Hit
    Then they see the Public Page for that Hit

  Scenario: An Anonymous User searches for an author ID
    Given that an Anonymous User is on the start page
    And they know an Author ID
    And there are ten Publications with that Author ID
    When the user searches for the Author ID
    And clicks Search
    Then the user sees ten Hits for the author ID displayed in the search display
    And each hit contains information about the title, author, year, and publication type

