require "test_helper"

class IdScopesTest < MiniTest::Spec
  class Dog < ActiveRecord::Base
    include Scopy::IdScopes
  end

  before do
    @dog = Dog.create
  end

  after do
    Dog.delete_all
  end

  describe ".excluding_id" do
    it "excludes" do
      assert_empty Dog.excluding_id(@dog.id)
    end

    it "does not exclude" do
      assert_equal [@dog], Dog.excluding_id(@dog.id + 1)
    end
  end

  describe ".excluding_ids" do
    it "excludes" do
      assert_empty Dog.excluding_ids([@dog.id])
    end

    it "does not exclude" do
      assert_equal [@dog], Dog.excluding_ids([@dog.id + 1])
    end
  end

  describe ".excluding" do
    it "excludes" do
      assert_empty Dog.excluding(@dog)
    end

    it "does not exclude" do
      snoop = Dog.create
      assert_equal [@dog], Dog.excluding(snoop)
    end
  end
end
