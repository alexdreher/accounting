Feature: Analysis
  In order to analyze my bookings
  As an accountant
  I want to have statistics
  
  Background:
		Given the following account records
		  | id | number | account_type_id | title |
		  | 1  | 1502   | 1               | Test1 |
		  | 2  | 3102   | 2               | Test2 |
  
  # TODO: tests only asset/liability accounts, NOT revenue/expense accounts
  Scenario: Balance list
    Given the following transaction records
		  | book_date | debit_id | credit_id | amount | title |
		  | 241014    | 2        | 1         | 1.23   | One   |
		  | 251014    | 2        | 1         | 1.23   | Two   |
		  | 261014    | 2        | 1         | 1.23   | Three |
		  | 271014    | 2        | 1         | 1.23   | Four  |
		  | 281014    | 2        | 1         | 1.23   | Five  |
		  | 291014    | 2        | 1         | 1.23   | Six   |

    When I go to the list of account balances
    Then show me the page
    Then I should see a balances table
      | 1502 | Test1 | -7.38 | 1 |
      | 3102 | Test2 | 7.38  | 2 |





  
  
  