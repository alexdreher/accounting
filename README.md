# Accounting
This is a basic "accounting" app. By basic I mean really basic: just gives the ability to book transactions and have a small overview.

## Motivation
A friend, who works as an accountant, wanted to have a small app to keep track over his private finances. All the "accounting"-apps (for private finances) out there had either too much or too less functionality. So we decided to build a new one with only the functionality needed.

First build was in Java, because the software had to be portable and multi platform (= usable from different computers). It turned out, that the portable Java DB (Apache Derby) was way to slow to handle the fast "accountant keyboard inputs".

The second build was then a Rails 2 web application, which met the requirement to be fast enough and accessible from different computers.

## My extended motivation
This github project is a rewrite of the developed and used Rails 2 implementation in Rails 3, to get to know each other better.

## Tests
This time, I use behavior driven development with cucumber. Have a look at the features in the `/features` directory and the RSpec-2 tests in the `/specs` folder. You can run the tests with:

* `cucumber` or `rake cucumber`
* `rake spec`
* `autotest` while implementing (with growl notifications)

and get coverage information with RCov by running

* `rake rcov:cucumber`
* `rake rcov:rspec` or simply:
* `rake rcov:all`

**Note:** The integration of all the different test plugins (RSpec-2, Cucumber, autotest, RCov) and tools was meanwhile kind of tricky with the new Rails 3.