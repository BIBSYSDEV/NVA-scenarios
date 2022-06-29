Feature: NVI Report

	In order to view current status on ongoing NVI process
	As an Editor
	I want to see the current NVI report (as if I would conclude now)

	In order to conclude the ongoing NVI process
	As an Editor
	I want to notify that this NVI-Institution is ready to report

	In order to view past NVI reports
	As an Editor
	I want to access past NVI reports from my Institution

	Background:
		Given a logged-in Editor at an NVI-Institution
		And the Editor views the Editor page

  @needJiraTag
	Scenario: Editor views current status on the ongoing NVI process at their Institution
		When an Editor uses the option to view the current status of the NVI process
		Then the Editor recives the NVI report at this point of time

	@TEST_NP-4154
	Scenario: Editor concludes the ongoing NVI process at their Institution
		When an Editor uses the option to conclude the current NVI process
		And the Editor confirms their intention to conclude the current NVI process
		Then the Institution is marked as concluded for current year's NVI report
		And all future NVI-related actions performed by Curators at Editor's Institution affect the next reporting period

	@TEST_NP-4155
	Scenario: Editor view past NVI-reports from own Institution
		When an Editor uses the option to fetch an NVI report for a given year
		Then the Editor can choose between "view the report" or "download"
