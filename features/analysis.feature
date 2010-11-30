Feature: Analysis
  In order to analyze my bookings
  As an accountant
  I want to have statistics
  
  Background:
		Given the following account records
		  | id | number | account_type_id | title |
		  | 1  | 1501   | 1               | Test1 |
		  | 2  | 1502   | 1               | Test1 |
		  | 3  | 3101   | 2               | Test2 |
		  | 4  | 3102   | 2               | Test2 |
  
  Scenario: Balance list
    Given the following transaction records
		  | book_date | debit | credit | amount | title                    |
		  | 241014    | 1501  | 1502   | 1.23   | asset side exchange1     |
		  | 251014    | 1501  | 1502   | 1.23   | asset side exchange2     |
		  | 261014    | 1501  | 1502   | 1.23   | asset side exchange3     |
		  | 241014    | 3101  | 3102   | 1.23   | liability side exchange1 |
		  | 251014    | 3101  | 3102   | 1.23   | liability side exchange2 |
		  | 261014    | 3101  | 3102   | 1.23   | liability side exchange3 |


    When I go to the list of account balances
    Then I should see a balances table
      | 1501 | Test1 | $3.69  | 1 |
      | 1502 | Test1 | $-3.69 | 1 |
      | 3101 | Test2 | $3.69  | 2 |
      | 3102 | Test2 | $-3.69 | 2 |