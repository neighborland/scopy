module Scopy
  module NameScopes
    extend ActiveSupport::Concern
    
    # note: case-sensitive like operations do not work as expected in Sqlite,
    # which we are using as the test database.
    # see http://stackoverflow.com/questions/973541/how-to-set-sqlite3-to-be-case-insensitive-when-string-comparing
        
    included do
      scope :name_like, ->(text, options={}) do
        cs = options[:case_sensitive]
        where("#{_lhs_name_column(cs)} LIKE '%#{_rhs_name_value(text, cs)}%'")
      end
      
      scope :name_starts_with, ->(text, options={}) do
        cs = options[:case_sensitive]
        where("#{_lhs_name_column(cs)} LIKE '#{_rhs_name_value(text, cs)}%'")
      end      
    end
    
  private
    
    module ClassMethods          
      def _lhs_name_column(case_sensitive)
        case_sensitive ? "#{self.table_name}.name" : "LOWER(#{self.table_name}.name)"
      end
      
      def _rhs_name_value(text, case_sensitive)
        case_sensitive ? text : text.try(:downcase)
      end
    end    
    
  end
end