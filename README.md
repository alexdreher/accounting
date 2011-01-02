# Accounting
This is a basic "accounting" app. By basic I mean really basic: just gives the ability to book transactions and have a small overview over them.

You can have a look at the running software with sample data at [http://testbox.lxmedia.net/accounting](http://testbox.lxmedia.net/accounting)

## Motivation
A friend, who works as an accountant, wanted to have a small app to keep track over his private finances. All the "accounting"-apps (for private finances) out there had either too much or too less functionality. So we decided to build a new one with only the functionality needed.

First build was in Java, because the software had to be portable and multi platform (= usable from different computers with different OSs). It turned out, that the portable Java DB (Apache Derby) was way to slow to handle the fast "accountant keyboard inputs".

The second build was then a Rails 2 web application, which met the requirement to be fast enough and accessible from different computers.

## My extended motivation
This github project is a rewrite of the developed and used Rails 2 implementation in Rails 3, to get to know each other better.

## Tests
Have a look at the cucumber features in the `/features` directory and the RSpec-2 tests at the `/specs` folder. You can run the tests with:

* `cucumber` or `rake cucumber`
* `rake spec`
* `autotest` while implementing (with growl notifications)

and get coverage information with RCov by running

* `rake rcov:cucumber`
* `rake rcov:rspec` or simply:
* `rake rcov:all`

You can see the rake task at [http://gist.github.com/670111](http://gist.github.com/670111)

**Note:** The integration of all the different test plugins (RSpec-2, Cucumber, autotest, RCov) and tools was meanwhile kind of tricky with the new Rails 3 (blogpost following).

## TODO
* rewrite and finish RSpec-tests (RCov 100 on cucumber + RSpec)
* strip all unnecessary functionality, clean up (xml, scaffolded controller stuff, etc.)
* refactor javascript in [public/javascripts/transactions.js](http://github.com/alexdreher/accounting/blob/master/public/javascripts/transactions.js)
