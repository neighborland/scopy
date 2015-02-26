module Scopy
  module CreatedAtScopes
    extend ActiveSupport::Concern

    included do
      scope :newest, -> { order("#{ self.table_name }.created_at DESC") }
      scope :oldest, -> { order("#{ self.table_name }.created_at") }

      scope :created_since, -> (since) do
        where("#{ self.table_name }.created_at >= ?", since)
      end

      scope :created_before, -> (before) do
        where("#{ self.table_name }.created_at < ?", before)
      end

      scope :created_between, -> (from, to) do
        created_since(from).created_before(to)
      end

      scope :created_on_day, -> (date) do
        created_between date.beginning_of_day, date.end_of_day
      end

      scope :created_in_week, -> (date, day_of_week = :sunday) do
        created_between date.beginning_of_week(day_of_week), date.end_of_week(day_of_week)
      end

      scope :created_in_month, -> (date) do
        created_between date.beginning_of_month, date.end_of_month
      end

      scope :created_in_year, -> (date) do
        created_between date.beginning_of_year, date.end_of_year
      end
    end

  end
end
