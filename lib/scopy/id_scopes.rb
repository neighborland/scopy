module Scopy
  module IdScopes
    extend ActiveSupport::Concern

    included do
      # objects may be:
      #   one id
      #   an array of ids
      #   one model
      #   a relation or array of models
      scope :excluding, -> (objects) { where.not(id: Array.wrap(objects)) }
    end
  end
end
