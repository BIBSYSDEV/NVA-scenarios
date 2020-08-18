    @358
    Scenario Outline: Curator opens an item in the Worklist
        Given that the Curator expands an item in the Worklist
        And they select a <Tab>
        When they click Go to Publication on an item
        Then they see the item is opened in the Wizard
        And they see the Submission tab
        And <Button> is enabled

        Examples:
            | Tab          | Button     |
            | For Approval | Publish    |
            | For Approval | Reject     |
            | DOI request  | Create DOI |