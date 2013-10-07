# Scopy

[![Build Status](https://api.travis-ci.org/neighborland/scopy.png)](https://travis-ci.org/neighborland/scopy)

Scopy provides common ActiveRecord utility scopes as ActiveSupport concerns.

Common scopes for the following attributes are provided:

* `created_at`
* `id`
* `name`

## Install

Add this line to your Gemfile:

```ruby
gem 'scopy'
```

Scopy works with Rails 3.2 and later.

## Usage

Include the concern modules you would like to use in your models:

```ruby
class Dog < ActiveRecord::Base
  include Scopy::CreatedAtScopes
  include Scopy::IdScopes
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

Dog.created_in_month(Date.parse("1/1/2013"))
# => dogs created in January 2013
```

##### Scopy::IdScopes

```ruby
Dog.excluding_id(123)
# => dogs excluding id 123

Dog.excluding_ids( [1, 2, 3] )
# => dogs excluding ids 1, 2, and 3

Dog.excluding(dog)
# => dogs excluding dog
```

##### Scopy::NameScopes

```ruby
Dog.name_like('snoop')
# => dogs with names containing 'snoop' (case insensitive)

Dog.name_like('snoop', case_sensitive: true)
# => dogs with names containing 'snoop' (case sensitive)

Dog.name_starts_with('snoop')
# => dogs with names starting with 'snoop' (case insensitive)

Dog.name_starts_with('snoop', case_sensitive: true)
# => dogs with names starting with 'snoop' (case sensitive)
```

