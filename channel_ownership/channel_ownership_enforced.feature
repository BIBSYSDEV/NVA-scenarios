Feature: Channel ownership enforced

  Scenario Outline: An unclaimed channel should not have constraints
    Given a user is Registrator
    And they select an uclaimed channel
    When they <Action>
    Then they are allowed

    Examples:
      | Action                                |
      | Register metadata                     |
      | Edit metadata after file is published |

  Scenario Outline: Claimed channel with allow-all policy
    Given a user is Registrator
    And they select a channel claimed by <Channel claimed by>
    And the selected channel has an allow-all policy on <Action>
    And they select a Publication Instance Type <Instance Type included in scope> in the channel claim scope
    When they register metadata
    Then they are <Permission>

    Examples:
      | Action                                | Channel claimed by  | Instance Type included in scope | Permission |
      | Register metadata                     | Own institution     | Included                        | Allowed    |
      | Register metadata                     | Own institution     | Not included                    | Allowed    |
      | Register metadata                     | Another institution | Included                        | Allowed    |
      | Register metadata                     | Another institution | Not included                    | Allowed    |
      | Edit metadata after file is published | Own institution     | Included                        | Allowed    |
      | Edit metadata after file is published | Own institution     | Not included                    | Allowed    |
      | Edit metadata after file is published | Another institution | Included                        | Allowed    |
      | Edit metadata after file is published | Another institution | Not included                    | Allowed    |

  @ignore(not_part_of_first_delivery)
  Scenario Outline: Claimed channel with deny-others policy
    Given a user is Registrator
    And they select a channel claimed by <Channel claimed by>
    And the selected channel has a deny-others policy on <Action>
    And they select a Publication Instance Type <Instance Type included in scope> in the channel claim scope
    When they register metadata
    Then they are <Permission>

    Examples:
      | Action                                | Channel claimed by  | Instance Type included in scope | Permission |
      | Register metadata                     | Own institution     | Included                        | Allowed    |
      | Register metadata                     | Own institution     | Not included                    | Allowed    |
      | Register metadata                     | Another institution | Included                        | Denied     |
      | Register metadata                     | Another institution | Not included                    | Allowed    |
      | Edit metadata after file is published | Own institution     | Included                        | Allowed    |
      | Edit metadata after file is published | Own institution     | Not included                    | Allowed    |
      | Edit metadata after file is published | Another institution | Included                        | Denied     |
      | Edit metadata after file is published | Another institution | Not included                    | Allowed    |