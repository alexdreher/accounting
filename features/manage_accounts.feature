Feature: Manage Accounts
	In order to have my finances at a glance
	As an accountant
	I want to create and manage accounts
	
	Scenario: Accounts List
		Given I have accounts numbered 3102, 1502
		When I go to the list of accounts
		Then I should see "3102"
		And I should see "1502"
		
	Scenario: Create valid account
		Given I have no accounts
		And I am on the list of accounts
		When I follow "New account"
		And I fill in "Number" with "1502"
		And I fill in "Title" with "Title"
		And I select "Asset account" from "Account type"
		And I press "Create"
		Then I should see "Account was successfully created"
		And I should see "1502"
		And I should see "Title"
		And I should have 1 account