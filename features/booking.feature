Feature: Booking
  In order to have my finances at a glance
  As an accountant
  I want to be able to book transactions

	Background:
		Given the following account records
		 | number | account_type_id | title |
		 | 1502   | 1               | Test1 |
		 | 3102   | 2               | Test1 |


	Scenario: Create valid transaction
	  Given I have no transactions
	  And I am on the home page
		When I follow "New Transaction"
		And I fill in "Booking Date" with "241010"
		And I fill in "Debit" with "3102"
		And I fill in "Credit" with "1502"
		And I fill in "Amount" with "1,23"
		And I fill in "Title" with "Testtransaction"
		And I press "Create"
		Then I should see a transactions table
			| 24.10.2010 | 3102 | 1502 | 1,23 | Testtransaction |