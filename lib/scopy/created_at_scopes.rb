# frozen_string_literal: true

module Scopy
  module CreatedAtScopes
    extend ActiveSupport::Concern

    included do
      scope :newest, -> { order("#{table_name}.created_at DESC") }
      scope :oldest, -> { order("#{table_name}.created_at") }

      scope :created_since, ->(since) do
        where("#{table_name}.created_at >= ?", since) if since
      end

      scope :created_before, ->(before) do
        where("#{table_name}.created_at <= ?", before) if before
      end

      scope :created_between, ->(from, to) do
        created_since(from).created_before(to)
      end

      scope :created_on_day, ->(date) do
        created_between(date.beginning_of_day, date.end_of_day) if date
      end

      scope :created_in_week, ->(date, day = :sunday) do
        created_between(date.beginning_of_week(day), date.end_of_week(day)) if date
      end

      scope :created_in_month, ->(date) do
        created_between(date.beginning_of_month, date.end_of_month) if date
      end

      scope :created_in_year, ->(date) do
        created_between(date.beginning_of_year, date.end_of_year) if date
      end
    end
  end
end
