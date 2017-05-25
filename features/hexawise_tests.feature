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
    | EUR  | lower     | USD | lower   | 0      | more               |
    | GBP  | mixed     | USD | mixed   | 1      | more               |
    | INR  | lower     | USD | upper   | 1.50   | less               |
    | AUD  | mixed     | USD | upper   | 100    | less               |
    | EUR  | upper     | EUR | mixed   | -1     | an invalid request |
    | GBP  | upper     | GBP | lower   | -1     | an invalid request |
    | INR  | mixed     | INR | lower   | -1     | an invalid request |
    | CAD  | upper     | USD | upper   | 10001  | an invalid request |
    | AUD  | lower     | AUD | lower   | -1     | an invalid request |
    | CAD  | lower     | FKP | lower   | -1     | an invalid request |
    | USD  | mixed     | EUR | upper   | 0      | less               |
    | INR  | upper     | GBP | mixed   | 0      | less               |
    | GBP  | lower     | INR | upper   | 0      | more               |
    | CAD  | mixed     | AUD | mixed   | 0      | an invalid request |
    | AUD  | upper     | FKP | mixed   | 0      | an invalid request |
    | INR  | lower     | EUR | lower   | 1      | less               |
    | USD  | lower     | GBP | upper   | 1      | less               |
    | EUR  | mixed     | GBP | mixed   | 1.50   | less               |
    | EUR  | upper     | INR | upper   | 1      | more               |
    | USD  | lower     | INR | mixed   | 1.50   | more               |
    | GBP  | upper     | EUR | lower   | 1.50   | more               |
    | CAD  | upper     | EUR | lower   | 100    | an invalid request |
    | AUD  | lower     | EUR | lower   | 10001  | less               |
    | USD  | upper     | AUD | upper   | 1      | more               |
    | USD  | mixed     | FKP | upper   | 1      | an invalid request |
    | USD  | lower     | GBP | lower   | 100    | less               |
    | USD  | mixed     | GBP | mixed   | 10001  | less               |
    | EUR  | lower     | INR | mixed   | 100    | more               |
    | GBP  | upper     | AUD | lower   | 100    | more               |
    | INR  | mixed     | FKP | upper   | 100    | an invalid request |
    | INR  | upper     | AUD | lower   | 10001  | less               |
    | GBP  | mixed     | FKP | mixed   | 10001  | an invalid request |
    | EUR  | upper     | AUD | lower   | 1.50   | more               |
    | EUR  | upper     | FKP | lower   | 1.50   | an invalid request |
    | EUR  | upper     | INR | upper   | 10001  | more               |
    | AUD  | mixed     | GBP | mixed   | 1      | less               |
    | CAD  | lower     | GBP | upper   | 1      | an invalid request |
    | AUD  | lower     | INR | mixed   | 1.50   | more               |
    | CAD  | upper     | INR | upper   | 1.50   | an invalid request |