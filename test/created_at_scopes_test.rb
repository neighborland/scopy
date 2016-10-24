require "test_helper"

class CreatedAtScopesTest < MiniTest::Spec
  class Dog < ActiveRecord::Base
    include Scopy::CreatedAtScopes
  end

  before do
    @boo = Dog.create(created_at: 1.week.ago)
    @snoop = Dog.create(created_at: 1.day.ago)
  end

  after do
    Dog.delete_all
  end

  describe ".newest" do
    it "sorts newest first" do
      assert_equal @snoop, Dog.newest.first
      assert_equal @boo, Dog.newest.last
    end
  end

  describe ".oldest" do
    it "sorts oldest first" do
      assert_equal @boo, Dog.oldest.first
      assert_equal @snoop, Dog.oldest.last
    end
  end

  describe ".created_since" do
    it "includes since date" do
      assert Dog.created_since(2.days.ago).include?(@snoop)
      refute Dog.created_since(2.days.ago).include?(@boo)
    end

    it "does not restrict for nil date" do
      assert_equal 2, Dog.created_since(nil).count
    end
  end

  describe ".created_before" do
    it "includes before date" do
      refute Dog.created_before(2.days.ago).include?(@snoop)
      assert Dog.created_before(2.days.ago).include?(@boo)
    end

    it "does not restrict for nil date" do
      assert_equal 2, Dog.created_before(nil).count
    end
  end

  describe ".created_between" do
    it "includes between dates" do
      assert Dog.created_between(2.days.ago, Time.now).include?(@snoop)
      refute Dog.created_between(2.days.ago, Time.now).include?(@boo)
    end

    it "does not restrict for nil dates" do
      assert_equal [@snoop], Dog.created_between(2.days.ago, nil).to_a
      assert_equal [@boo], Dog.created_between(nil, 2.days.ago).to_a
      assert_equal 2, Dog.created_between(nil, nil).count
    end
  end

  describe ".created_on_day" do
    it "includes on day" do
      assert Dog.created_since(2.days.ago).include?(@snoop)
      refute Dog.created_since(2.days.ago).include?(@boo)
    end

    it "does not restrict for nil date" do
      assert_equal 2, Dog.created_on_day(nil).count
    end
  end

  describe ".created_in_week" do
    it "includes in week" do
      lassie = Dog.create(created_at: 1.month.ago)
      assert Dog.created_in_week(1.day.ago).include?(@snoop)
      refute Dog.created_in_week(1.day.ago).include?(lassie)
    end

    it "does not restrict for nil date" do
      assert_equal 2, Dog.created_in_week(nil).count
    end
  end

  describe ".created_in_month" do
    it "includes in month" do
      lassie = Dog.create(created_at: 2.months.ago)
      assert Dog.created_in_month(1.day.ago).include?(@snoop)
      refute Dog.created_in_month(1.day.ago).include?(lassie)
    end

    it "does not restrict for nil date" do
      assert_equal 2, Dog.created_in_month(nil).count
    end
  end

  describe ".created_in_year" do
    it "includes in year" do
      lassie = Dog.create(created_at: 2.years.ago)
      assert Dog.created_in_year(1.day.ago).include?(@snoop)
      refute Dog.created_in_year(1.day.ago).include?(lassie)
    end

    it "does not restrict for nil date" do
      Dog.create(created_at: 2.years.ago)
      assert_equal 3, Dog.created_in_year(nil).count
    end
  end
end
