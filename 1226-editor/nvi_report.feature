Feature: NVI Report

	In order to conclude the ongoing NVI process 
	As an Editor
	I want to notify that this NVI-Institution is ready to report

	In order to view past NVI reports
	As an Editor
	I want to access past NVI reports from my Institution

	Background:
		Given a logged in Editor at an NVI-Institution
		And the Editor views the Editor page

	Scenario: Editor concludes the ongoing NVI process at his Institution
		When an Editor uses the option to conclude the current NVI process
		And the Editor confirms his intention to end the current NVI process
		Then the Instituion is marked as done for current years NVI report
		And all future NVI-related actions done by Curators at Editors Institution affects next years NVI report

	Scenario: Editor view past NVI-reports from own Institution
		When an Editor uses the option to fetch a spesific past year's NVI report
		Then the Editor can choose between view the report or download it