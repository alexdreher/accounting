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
		# date format: ddmmyy
		And I fill in "Book date" with "241013"
		And I fill in "Debit" with "3102"
		And I fill in "Credit" with "1502"
		And I fill in "Amount" with "1.23"
		And I fill in "Title" with "Testtransaction"
		And I press "Save"
		Then I should see a transactions table
		  | 2013-10-24 | 3102 | 1502 | 1.23 | Testtransaction |
		
	Scenario Outline: Create multiple valid transactions
	  Given I have no transactions
	  And I am on the home page
		When I follow "New Transaction"
		And I fill in the following:
		 | Book date | <Book date> |
		 | Debit     | <Debit>     |
		 | Credit    | <Credit>    |
		 | Amount    | <Amount>    |
		 | Title     | <Title>     |		     
		And I press "Save"
		Then I should have 6 transactions
		
	Examples:
	 | Book date | Debit | Credit | Amount | Title |
	 | 241014    | 3102  | 1502   | 1.23   | One   |
	 | 251014    | 3102  | 1502   | 1.23   | Two   |
	 | 261014    | 3102  | 1502   | 1.23   | Three |
	 | 271014    | 3102  | 1502   | 1.23   | Four  |
	 | 281014    | 3102  | 1502   | 1.23   | Five  |
	 | 291014    | 3102  | 1502   | 1.23   | Six   |
