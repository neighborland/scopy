# Scopy

[![Gem Version](http://img.shields.io/gem/v/scopy.svg)](http://rubygems.org/gems/scopy)
[![Build Status](http://img.shields.io/travis/neighborland/scopy.svg)](https://travis-ci.org/neighborland/scopy)

Scopy provides common ActiveRecord scopes as ActiveSupport model concerns.

Common scopes for the following attributes are provided:

* `created_at`
* `name`

## Install

Add this line to your Gemfile:

```ruby
gem 'scopy'
```

`scopy` works with Rails 4.0 and later.

Version 0.4 works with Rails 3.2 and later.

## Usage

Include the modules you would like to use in your models:

```ruby
class Dog < ActiveRecord::Base
  include Scopy::CreatedAtScopes
  include Scopy::NameScopes
```

The following examples assume you have a model named `Dog`:

##### Scopy::CreatedAtScopes

```ruby
Dog.newest
# => most recently created dogs are first

Dog.oldest
# => most recently created dogs are last

Dog.created_since(1.month.ago)
# => only dogs created since one month ago

Dog.created_before(1.week.ago)
# => only dogs created before 1 week ago

Dog.created_between(2.weeks.ago, 1.week.ago)
# => only dogs created between 2 weeks ago & 1 week ago

Dog.created_on_day(1.day.ago)
# => dogs created yesterday

Dog.created_in_week(Date.parse("31/10/2013"))
# => dogs created in the week Sunday-Saturday around October 31, 2013

Dog.created_in_month(Time.new(2013, 1))
# => dogs created in January 2013

Dog.created_in_year(Time.new(2013))
# => dogs created in 2013
```

##### Scopy::NameScopes

```ruby
Dog.name_like('snOOp')
# => dogs with names containing 'snoop' (case insensitive)

Dog.name_like('Snoop', case_sensitive: true)
# => dogs with names containing 'Snoop' (case sensitive)

Dog.name_starts_with('snOOp')
# => dogs with names starting with 'snoop' (case insensitive)

Dog.name_starts_with('Snoop', case_sensitive: true)
# => dogs with names starting with 'Snoop' (case sensitive)
```

#### Upgrading

##### Version 2.0

* `.excluding_ids` and `.excluding_id` scopes were removed in
version 2.0. Replace those calls with `.excluding`.

##### Version 3.0

* `Scopy::IdScopes` was removed in version 3. Instead, use:

```ruby
where.not(id: id)
where.not(id: ids)
where.not(id: model)
where.not(id: models)
```
