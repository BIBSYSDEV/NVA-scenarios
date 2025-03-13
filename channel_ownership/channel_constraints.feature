Feature: Channel constraints

  Scenario: Default constraints when claiming a channel
    Given a user logged in as Editor
    When a channel is claimed
    Then the policy for registering metadata is set to allow-all
    And the policy for editing metadata after file is published is set to allow-all
    And the scope is set to DegreePhd, DegreeMaster, and DegreeBachelor

  @ignore(not_part_of_first_delivery)
  Scenario: Editor can set channel constraints when claiming a channel
    Given user logged in as Editor
    When claiming a channel
    And policy for who can register metadata is set
    And policy for who can edit metadata after file is published is set
    And scope of the constraints is set
    Then the channel is claimed with these constraints

  @ignore(not_part_of_first_delivery)
  Scenario: Editor can edit constraints on a channel claimed by their institution
    Given a user logged in as Editor
    And a channel claimed by their institution
    When the policy for who can register metadata is updated
    And the policy for who can edit metadata after file is published is updated
    And the scope of the constraints are updated
    Then the constraints of the channel claim are updated

  Scenario: Editor cannot edit constraints on a channel not claimed
    Given a user logged in as Editor
    And an unclaimed channel
    When the user edits constraints on the channel
    Then they are denied

  Scenario: Editor cannot edit constraints on a channel claimed by another institution
    Given a user logged in as Editor
    And a channel claimed by another institution
    When the user edits constraints on the channel
    Then they are denied

  Scenario: Non-editor cannot edit channel constraints
    Given a user not logged in as Editor
    And a channel claim
    When the user edits constraints on the channel
    Then they are denied

  Scenario: View constraints for any claimed channel
    Given a channel claim
    When the channel claim constraints are requested
    Then the channel claim constraints are returned