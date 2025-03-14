Feature: Channel constraints

  Scenario: Default constraints when claiming a channel
    When a channel is claimed
    Then the policy for registering metadata is set to allow-all
    And the policy for editing metadata after file is published is set to allow-all
    And the scope is set to DegreePhd, DegreeMaster, and DegreeBachelor

  @ignore(not_part_of_first_delivery)
  Scenario Outline: Editor can edit channel constraints when claiming a channel
    When an Editor claims a channel
    Then they have the option to edit <Constraint>

    Examples:
      | Constraint                                    |
      | Who can register metadata                     |
      | Who can edit metadata after file is published |
      | The scope of the constraints                  |

  @ignore(not_part_of_first_delivery)
  Scenario Outline: Editor can edit constraints on a channel owned by their institution
    When an Editor edits a channel owned by their institution
    Then they have the option to edit <Constraint>

    Examples:
      | Constraint                                    |
      | Who can register metadata                     |
      | Who can edit metadata after file is published |
      | The scope of the constraints                  |

  Scenario: Editor cannot edit constraints on a channel owned by another institution
    When an Editor at institution A claims a channel
    Then an Editor at institution B cannot edit the constraints of that channel claim

  Scenario Outline: Non-editor cannot edit channel constraints
    Given a user is not Editor
    When they inspect a channel claim
    Then they don not have the option to edit <Constraint>

    Examples:
      | Constraint                                    |
      | Who can register metadata                     |
      | Who can edit metadata after file is published |
      | The scope of the constraints                  |

  Scenario: View constraints for a claimed channel
    When requesting the constraints of a channel claim
    Then the constraints of the channel claim are returned