require 'test_helper'

class IdScopesTest < Test::Unit::TestCase
  class Dog < ActiveRecord::Base
    include Scopy::IdScopes
  end
  
  setup do
    @dog = Dog.create(name: "Boo")
  end
  
  teardown do
    Dog.delete_all
  end
  
  context ".excluding_id" do
    should "exclude" do
      assert_empty Dog.excluding_id(@dog.id)
    end
    
    should "not exclude" do
      assert_equal [@dog], Dog.excluding_id(@dog.id + 1)
    end    
  end

  context ".excluding_ids" do
    should "exclude" do
      assert_empty Dog.excluding_ids([@dog.id])
    end
    
    should "not exclude" do
      assert_equal [@dog], Dog.excluding_ids([@dog.id + 1])
    end    
  end

  context ".excluding" do
    should "exclude" do
      assert_empty Dog.excluding(@dog)
    end
    
    should "not exclude" do
      snoop = Dog.create(name: "Snoop")
      assert_equal [@dog], Dog.excluding(snoop)
    end    
  end
  
end
