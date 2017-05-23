Feature: Determine currency exchange value using the API

As an API consumer
I want to get the exchange amount from a certain amount of one currency to another
So that I can tell the user how much currency they will get in the exchange 

Scenario: Exchange a less valuable currency for a more valuable one
  Given an exchange from USD to EUR
  When I exchange 1
  Then I get less 

Scenario: Exchange a more valuable currency for a less valuable one
  Given an exchange from GBP to INR
  When I exchange 100
  Then I get more
 
Scenario: Exchange no currency
  Given an exchange from GBP to INR
  When I exchange 0
  Then I get none

Scenario: Using lower case currency
  Given an exchange from usd to eur
  When I exchange 1
  Then I get less

Scenario: Using invalid currency
  Given an exchange from CAD to FKP
  When I exchange 100
  Then I get an invalid request