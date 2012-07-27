## braintree_country_select

Provides a simple Rails form helper to generate an HTML select list of countries.

The country list is sourced from the braintree gem. This helper is intended for use in payment forms that submit to the Braintree payment processing gateway.

## Installation

Install as a gem using

    gem install braintree_country_select

Or put the following in your Gemfile

    gem 'braintree_country_select'

## Example

Simple use supplying model and attribute as parameters:

    braintree_country_select(:billing, :country_code_alpha3)

Supplying priority countries to be placed at the top of the list:

    braintree_country_select(:billing, :country_code_alpha3, ["United States", "United Kingdom", "France", "Germany"])

## Copyright

Original country_select plugin by:

Copyright (c) 2008 Michael Koziarski, released under the MIT license.

Braintree-based fork by:

Copyright (c) 2012 Lukas Fittl, released under the MIT license.