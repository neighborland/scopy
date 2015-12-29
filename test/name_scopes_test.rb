require 'test_helper'

class NameScopesTest < MiniTest::Spec
  class Dog < ActiveRecord::Base
    include Scopy::NameScopes
  end

  before do
    @dog = Dog.create(name: "Snoop Dogg")
  end

  after do
    Dog.delete_all
  end

  describe ".name_like" do
    it "finds case sensitive" do
      assert Dog.name_like("Dog", case_sensitive: true).include?(@dog)
      assert_empty Dog.name_like("cat", case_sensitive: true)
    end

    it "finds with quotes" do
      o_dogg = Dog.create(name: "Snoop O'Doggly")
      assert Dog.name_like("O'Dogg").include?(o_dogg)
    end

    it "finds case insensitive" do
      assert Dog.name_like("doG").include?(@dog)
      assert_empty Dog.name_like("cat")
    end
  end

  describe ".name_starts_with" do
    it "finds case sensitive" do
      assert Dog.name_starts_with("Snoop", case_sensitive: true).include?(@dog)
      assert_empty Dog.name_starts_with("Dogg", case_sensitive: true)
    end

    it "finds case insensitive" do
      assert Dog.name_starts_with("snOOp").include?(@dog)
      assert_empty Dog.name_starts_with("dogg")
    end
  end
end
