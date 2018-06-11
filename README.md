# Hexawise Example BDD

This is a simple (and deeply flawed) Web Service (with some pairwise defects!). The idea is to find the bugs using a
data-driven BDD combinatorial test plan designed in Hexawise.

# Usage

First install Ruby 2.5.1, presumably with [RVM](https://rvm.io/).

Then install the gems needed for this app:

```console
gem install bundler
bundle install
```

To run the web service:

```
ruby app.rb
```

To try out the service:

```console
curl -i http://localhost:4567/exchange-rate/USD/100/AUD
```

To run the "business as usual" cucumber tests:

```console
cucumber features/business_as_usual_tests.feature
```

To run the Hexawise data-driven combinatorial tests:

```console
cucumber features/hexawise_tests.feature
```