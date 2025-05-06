Feature: Listinf of NVI resource with different statuses

	This feature file contains scenarios related listing of NVI-resources of different statuses as view in the left menu

	In order to view the current status of the NVI-prosess
	As a Curator
	I want to see how many Resources have the status Candidate, Being checked, Approved, Rejected or Dispute.

	Background:
		Given an logged-in Curator at an NVI-Institution
		And the Curator is selecting different statuses in the left menu
		And all listed results are NVI Resources 
		And the Resources have authors that are affiliated with the Curator's Institution
		And the authors affiliation is within your Area of responibiliy

	Scenario: Candidate status is selected
		Then nor your or any other Institution has evalueted the Resources listed

	Scenario: Candidate sub-status "Waiting for your institution" is selcted 
		Then your Instituion has not evaluted the Resources listed
		And some other Institution has evaluted the Resources listed
	
	Scenario: Being checked status is selected
		Then some other Curator at your Institution is in the process of evaluating the Resources listed

	Scenario: Being checked sub-status "Waiting for your institution" is selected
		Then some other Curator at your Institution is in the process of evaluating the Resources listed
		And at least one other Institution has evaluted the Resource

	Scenario: Approved status is selected
		Then your Institution has Approved the Resources listed
		And the Resource is not in a not-Approved status on some other NVI-institution

	Scenario: Approved sub-status "Waiting for other institutions" is selected
		Then your Institution has Approved the Resources listed
		And at least one other Institution has the Resource in Candidate or Being checked status

	Scenario: Rejected status is selected
		Then your Institution has Rejected the Resources listed 
		And no other Institution has the Resource in a not-Rejected status

	Scenario: Rejected sub-status "Waiting for other institutions" is selected
		Then your Institution has Rejected the Resources listed
		And at least one other Institution has the Resource in Candidate or Being checked status

	Scenario: Dispute status is selected
		Then your Institution and some other Institution has the Resources listed in Rejected status
		And the other has it not in Rejected status