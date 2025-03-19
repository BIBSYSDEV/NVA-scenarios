Feature: Channel ownership enforced

  Scenario Outline: An unclaimed channel should not have constraints
    When a Registrator selects an unclaimed channel
    Then they have the option to <Action>

    Examples:
      | Action                                |
      | Register metadata                     |
      | Edit metadata after file is published |

  Scenario Outline: Claimed channel with allow-all policy for registering metadata
    Given a channel X owned by institution A
    And the channel claim has an allow-all policy on registering metadata
    And the channel claim has scope DegreePhd, DegreeMaster, and DegreeBachelor
    When a Registrator from <Institution> selects category <Instance type>
    And selects channel X as publisher
    Then the Registrator have the option to register the metadata

    Examples:
      | Institution   | Instance type |
      | Institution A | DegreePhd     |
      | Institution A | Anthology     |
      | Institution B | DegreePhd     |
      | Institution B | Anthology     |

  Scenario Outline: Claimed channel with deny-others policy for editing metadata after file is published
    Given a channel X owned by institution A
    And the channel claim has an deny-others policy on editing metadata after file is published
    And the channel claim has scope DegreePhd, DegreeMaster, and DegreeBachelor
    And a publication Y registered by a Registrator from institution A
    And publication Y has category <Instance type>
    And publication Y has contributor from institution B
    And channel X is the publisher of publication Y
    When a file on publication Y is published
    Then only Curators from <Institutions> have the option to edit the metadata

    Examples:
      | Institutions                    | Instance type |
      | Institution A                   | DegreePhd     |
      | Institution A and Institution B | Anthology     |

  @ignore(not_part_of_first_delivery)
  Scenario: Claimed channel with deny-others for registering and allow-all for editing metadata after file is published