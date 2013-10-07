require 'test_helper'

class CreatedAtScopesTest < Test::Unit::TestCase
  class Dog < ActiveRecord::Base
    include Scopy::CreatedAtScopes
  end
  
  setup do
    @boo = Dog.create(created_at: 1.week.ago)
    @snoop = Dog.create(created_at: 1.day.ago)    
  end  
      
  teardown do
    Dog.delete_all
  end
      
  context ".newest" do
    should "sort newest first" do
      assert_equal @snoop, Dog.newest.first
      assert_equal @boo, Dog.newest.last
    end    
  end

  context ".oldest" do
    should "sort oldest first" do
      assert_equal @boo, Dog.oldest.first
      assert_equal @snoop, Dog.oldest.last
    end    
  end

  context ".created_since" do
    should "include since date" do
      assert Dog.created_since(2.days.ago).include?(@snoop)
      refute Dog.created_since(2.days.ago).include?(@boo)
    end    
  end

  context ".created_before" do
    should "include before date" do
      refute Dog.created_before(2.days.ago).include?(@snoop)
      assert Dog.created_before(2.days.ago).include?(@boo)
    end    
  end

  context ".created_between" do
    should "include between dates" do
      assert Dog.created_between(2.days.ago, Time.now).include?(@snoop)
      refute Dog.created_between(2.days.ago, Time.now).include?(@boo)
    end    
  end

  context ".created_on_day" do
    should "include on day" do
      assert Dog.created_since(2.days.ago).include?(@snoop)
      refute Dog.created_since(2.days.ago).include?(@boo)
    end    
  end

  context ".created_in_week" do
    should "include in week" do
      lassie = Dog.create(created_at: 1.month.ago)      
      assert Dog.created_in_week(1.day.ago).include?(@snoop)
      refute Dog.created_in_week(1.day.ago).include?(lassie)
    end    
  end
  
  context ".created_in_month" do
    should "include in month" do
      lassie = Dog.create(created_at: 2.months.ago)      
      assert Dog.created_in_month(1.day.ago).include?(@snoop)
      refute Dog.created_in_month(1.day.ago).include?(lassie)
    end    
  end
      
end
