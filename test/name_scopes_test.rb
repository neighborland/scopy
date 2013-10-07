require 'test_helper'

class NameScopesTest < Test::Unit::TestCase
  class Dog < ActiveRecord::Base
    include Scopy::NameScopes
  end
  
  setup do
    @dog = Dog.create(name: "Snoop Dogg")
  end
  
  teardown do
    Dog.delete_all
  end
  
  context ".name_like" do
    should "find case sensitive" do
      assert Dog.name_like("Dog", case_sensitive: true).include?(@dog)
      assert_empty Dog.name_like("cat", case_sensitive: true)
    end
    
    should "find case insensitive" do
      assert Dog.name_like("doG").include?(@dog)
      assert_empty Dog.name_like("cat")
    end
  end
  
  context ".name_starts_with" do
    should "find case sensitive" do
      assert Dog.name_starts_with("Snoop", case_sensitive: true).include?(@dog)
      assert_empty Dog.name_starts_with("Dogg", case_sensitive: true)
    end
    
    should "find case insensitive" do
      assert Dog.name_starts_with("snOOp").include?(@dog)
      assert_empty Dog.name_starts_with("dogg")
    end    
  end
  
end
