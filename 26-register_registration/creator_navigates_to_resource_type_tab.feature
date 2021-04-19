Feature: Creator navigates to Resource Type tab

  @274
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Contribution to journal"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    Then they see a list of subtypes:
      | Journal article      |
      | Short communication  |
      | Feature article      |
      | Letter to the Editor |
      | Book review          |
      | Editorial            |
      | Corrigendum          |

  @453
  Scenario: Creator navigates to Resource Type tab
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    Then they see the field for Type
    And they see the tab Description is clickable
    And they see the tab Resource Type is selected
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  Scenario: Creator sees that fields are validated on Resource Type tab
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Type |

  @393
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Report"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Report"
    Then they see a list of subtypes:
      | Research report      |
      | Policy report        |
      | Working paper        |
      | Other type of report |

  @392
  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Anthology"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Book"
    And they select Resource subtype "Anthology" from the list
    Then they see a Search box for "Publisher name"
    And they see a checkbox for "Is this a textbook?"
    And they see fields:
      | ISBN                  |
      | Total number of pages |
      | NPI discipline        |
    And they see a Search box for "Title of the Series"

  @394
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Student thesis"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Student thesis"
    Then they see a list of subtypes:
      | Bachelor thesis      |
      | Master thesis        |
      | Doctoral thesis      |
      | Other student thesis |

  @395
  Scenario: Creator sees fields for Resource subtype "Chapter in book"
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource Type 
      | Part of book/report |
    And they select the Registration Subtype "Chapter in book"
    Then they see an information box describing that a Container book must be published first
    And they see fields:
      | DOI                            |
      | Search box for published books |
      | Pages from                     |
      | Pages to                       |
      | Peer reviewed                  |
    And they see the Norwegian Science Index (NVI) evaluation status

  @1409
  Scenario Outline: Creator selects Contribution to Journal and Peer Review Details are hidden
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    When they select the Subtype "<Subtype>":
    Then they see that the Peer Review Details are hidden
    Examples:
      | Subtype              |
      | Editorial            |
      | Letter to the Editor |
      | Book review          |

  @1624
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Other publication"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Other publication"
    Then they see a list of subtypes:
      | Feature article   |
      | Map               |
      | Musical notation  |
      | Other publication |

  @1625
  Scenario: Creator sees fields for Resource subtype "Corrigendum"
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select the Resource subtype "Corrigendum"
    Then they see fields:
      | Search box for "Journal article" |
      | DOI                              |
      | Volume                           |
      | Issue                            |
      | Pages from                       |
      | Pages to                         |
      | Article number                   |
    And they see a disabled field for Journal based on selected Journal article

  Scenario: Creator sees that fields for Resource subtype "Corrigendum" are validated
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select the Resource subtype "Corrigendum"
    And they enter an invalid value in fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Search box for "Journal article" |
    And they can see "Invalid format" error messages for fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |

  @1631
  Scenario: Creator selects Resource type "Other publication" and selects subtype "Map"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Other publication"
    And they select the subtype "Map"
    Then they see fields:
      | Search box for Publisher |
      | Original version         |

  @1632
  Scenario: Creator selects Resource type "Other publication" and selects subtype "Musical notation"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Other publication"
    And they select the subtype "Musical notation"
    Then they see fields:
      | Search box for Publisher |
      | Original version         |
      | Pages from               |
      | Pages to                 |
      | ISMN                     |

  @1633
  Scenario: Creator selects Resource type "Other publication" and selects subtype "Other publication"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Other publication"
    And they select the subtype "Other publication"
    Then they see fields:
      | Original version            |
      | Search box for Published in |
      | Search box for Publisher    |
      | Pages from                  |
      | Pages to                    |
      | Total number of pages       |

  @1656
  Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) compatible Resource subtype
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    And they see fields:
      | Search-box for Journal |
      | DOI                    |
      | Volume                 |
      | Issue                  |
      | Pages from             |
      | Pages to               |
      | Article number         |
      | Peer reviewed          |
    And they see the Norwegian Science Index (NVI) evaluation status
    Examples:
      | Subtype             |
      | Journal article     |
      | Short communication |

  Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) compatible Resource subtype are validated
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    And they enter an invalid value in fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Search box for Journal |
    And they can see "Invalid format" error messages for fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    Examples:
      | Subtype             |
      | Journal article     |
      | Short communication |

  @1659
  Scenario Outline: Creator sees fields for Norwegian Science Index (NVI) incompatible Resource subtype
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    Then they see fields:
      | Search box for Journal |
      | DOI                    |
      | Volume                 |
      | Issue                  |
      | Pages from             |
      | Pages to               |
      | Article number         |
    Examples:
      | Subtype              |
      | Letter to the Editor |
      | Book review          |
      | Editorial            |
      | Feature article      |

  Scenario Outline: Creator sees that fields for Norwegian Science Index (NVI) incompatible Resource subtype are validated
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Contribution to journal"
    And they select Resource subtype "<Subtype>"
    And they enter an invalid value in fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Search box for Journal |
    And they can see "Invalid format" error messages for fields:
      | Volume         |
      | Issue          |
      | Pages from     |
      | Pages to       |
      | Article number |
    Examples:
      | Subtype              |
      | Feature article      |
      | Letter to the Editor |
      | Book review          |
      | Editorial            |
      | Feature article      |

  @1669
  Scenario: Creator selects Resource type "Other publication" and selects subtype "Feature article"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Other publication"
    And they select the subtype "Feature article"
    Then they see fields:
      | Original version            |
      | Search box for Published in |
      | Volume                      |
      | Issue                       |
      | Pages from                  |
      | Pages to                    |

  @1693
  Scenario Outline: Creator sees fields for Resource subtypes for "Report"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Report"
    And they select the subtype "<Subtype>":
    Then they see fields:
      | Search box for Publisher |
      | ISBN                     |
      | Total number of pages    |
      | Search box for Series    |
    Examples:
      | Subtype              |
      | Research report      |
      | Policy report        |
      | Working paper        |
      | Other type of report |

  Scenario Outline: Creator sees that fields are validated for Resource subtypes for "Report"
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Report"
    And they select the subtype "<Subtype>":
    And they enter an invalid value in fields:
      | ISBN                  |
      | Total number of pages |
    Then they can see the "Invalid ISBN" error message
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Search box for Publisher |
    And they can see "Invalid format" error messages for fields:
      | Total number of pages |
    Examples:
      | Subtype              |
      | Research report      |
      | Policy report        |
      | Working paper        |
      | Other type of report |

  @1694
  Scenario Outline: Creator sees fields for Resource subtypes for "Student thesis"
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource type "Student thesis"
    And they select the Subtype "<Subtype>":
    Then they see fields:
      | Search box for Publisher |
      | DOI                      |
      | Search box for Series    |
    Examples:
      | Subtype              |
      | Bachelor thesis      |
      | Master thesis        |
      | Doctoral thesis      |
      | Other student thesis |

  Scenario Outline: Creator sees that fields are validated for Resource subtypes for "Student thesis"
    Given Creator begins registering a Registration in the Wizard with a File
    And they navigate to the Resource Type tab
    And they select the Resource type "Student thesis"
    And they select the Subtype "<Subtype>":
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Search box for Publisher |
    Examples:
      | Subtype              |
      | Bachelor thesis      |
      | Master thesis        |
      | Doctoral thesis      |
      | Other student thesis |

  @1963
  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Monograph"
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Book"
    And they select Resource subtype "Monograph" from the list
    Then they see a Search box for "Publisher name"
    And they see a checkbox for "Is this a textbook?"
    And they see fields:
      | ISBN                  |
      | Total number of pages |
      | NPI discipline        |
    And they see a Search box for "Title of the Series"
    And they see a preselected value for Peer review "Not peer reviewed"
    And they see the Norwegian Science Index (NVI) evaluation status

  @2021
  Scenario: Creator sees fields for Resource subtype "Chapter in report"
    Given Creator begins registering a Registration in the Wizard with a Link
    When they navigate to the Resource Type tab
    And they select the Resource Type 
      | Part of book/report |
    And they select the Registration Subtype "Chapter in report"
    Then they see an information box describing that a Container report must be published first
    And they see fields:
      | DOI                              |
      | Search box for published reports |
      | Pages from                       |
      | Pages to                         |

  @2229
  Scenario Outline: Creator sees that fields for Book are validated on Resource Type tab
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they select the Resource type "Book"
    And they select Resource subtype "<BookType>" from the list
    And they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Publisher      |
      | NPI discipline |
    Examples:
      | BookType  |
      | Anthology |
      | Monograph |
