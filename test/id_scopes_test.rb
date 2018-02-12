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

  describe ".excluding" do
    it "excludes id" do
      assert_empty Dog.excluding(@dog.id)
    end

    it "does not exclude id" do
      assert_equal [@dog], Dog.excluding(@dog.id + 1)
    end

    it "excludes ids" do
      assert_empty Dog.excluding([@dog.id])
    end

    it "does not exclude ids" do
      assert_equal [@dog], Dog.excluding([@dog.id + 1])
    end

    it "excludes object" do
      assert_empty Dog.excluding(@dog)
    end

    it "does not exclude object" do
      snoop = Dog.create
      assert_equal [@dog], Dog.excluding(snoop)
    end

    it "excludes collection" do
      assert_empty Dog.excluding(Dog.all)
    end

    it "does not exclude collection" do
      snoop = Dog.create
      assert_equal [@dog], Dog.excluding(Dog.where(id: snoop.id))
    end
  end
end
