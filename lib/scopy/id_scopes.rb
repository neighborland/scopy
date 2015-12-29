module Scopy
  module IdScopes
    extend ActiveSupport::Concern

    included do
      scope :excluding_id,  ->(id) { where("#{table_name}.id <> ?", id) if id }
      scope :excluding_ids, ->(ids) { where("#{table_name}.id NOT IN (?)", ids) if ids.any? }
      scope :excluding,     ->(object) { excluding_id(object.id) if object }
    end
  end
end
