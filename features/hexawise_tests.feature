Feature: Determine currency exchange value using the API
As an API consumer
I want to get the exchange amount from a certain amount of one currency to another
So that I can tell the user how much currency they will get in the exchange 

Scenario Outline: Exchange an amount of currency for another currency
  Given an exchange from <From> in <From case> to <To> in <To case>
  When I exchange <Amount>
  Then I get <Result>

  Examples:
    | From | From case | To  | To case | Amount | Result             |
    | USD  | upper     | USD | upper   | -1     | an invalid request |
    | USD  | lower     | EUR | lower   | 0      | none               |
    | USD  | mixed     | GBP | mixed   | 1      | less               |
    | USD  | lower     | INR | upper   | 1.50   | more               |
    | USD  | mixed     | AUD | upper   | 100    | an invalid request |
    | EUR  | upper     | USD | mixed   | 0      | none               |
    | GBP  | upper     | USD | lower   | 1      | more               |
    | INR  | mixed     | USD | lower   | 1.50   | less               |
    | AUD  | lower     | USD | lower   | 100    | less               |
    | USD  | mixed     | FKP | lower   | -1     | an invalid request |
    | CAD  | lower     | USD | mixed   | -1     | an invalid request |
    | GBP  | upper     | EUR | mixed   | 1.50   | more               |
    | EUR  | mixed     | EUR | upper   | -1     | an invalid request |
    | INR  | lower     | EUR | upper   | 1      | less               |
    | EUR  | lower     | GBP | lower   | 1.50   | less               |
    | CAD  | upper     | EUR | upper   | 100    | an invalid request |
    | GBP  | upper     | GBP | upper   | -1     | an invalid request |
    | GBP  | mixed     | INR | mixed   | 0      | none               |
    | EUR  | upper     | FKP | mixed   | 100    | an invalid request |
    | INR  | upper     | GBP | upper   | 0      | none               |
    | AUD  | mixed     | GBP | mixed   | 0      | none               |
    | EUR  | upper     | INR | lower   | 1      | more               |
    | GBP  | lower     | AUD | mixed   | 0      | none               |
    | AUD  | upper     | EUR | upper   | -1     | none               |
    | CAD  | mixed     | GBP | lower   | 0      | an invalid request |
    | INR  | lower     | INR | mixed   | -1     | an invalid request |
    | EUR  | upper     | AUD | lower   | -1     | none               |
    | GBP  | lower     | FKP | upper   | 0      | an invalid request |
    | AUD  | lower     | AUD | lower   | 1.50   | an invalid request |
    | AUD  | upper     | INR | mixed   | 1      | more               |
    | CAD  | upper     | INR | upper   | 1      | an invalid request |
    | INR  | mixed     | AUD | mixed   | 1      | less               |
    | CAD  | upper     | AUD | mixed   | 1.50   | an invalid request |
    | INR  | lower     | FKP | upper   | 1      | an invalid request |
    | AUD  | upper     | FKP | upper   | 1.50   | an invalid request |
    | GBP  | mixed     | GBP | mixed   | 100    | an invalid request |
    | INR  | upper     | INR | upper   | 100    | an invalid request |
    | CAD  | lower     | FKP | upper   | 0      | an invalid request |