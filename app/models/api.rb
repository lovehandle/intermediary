class Api < ActiveRecord::Base

  # INCLUSIONS

  include Extensions::UUID

  # ASSOCIATIONS

  has_many :mappings

  # ATTRIBUTES

  accepts_nested_attributes_for :mappings

  # CLASS METHODS

  def self.query(id, parameters = {})
    begin
      find(id).query(parameters)
    rescue
      raise RuntimeError, "API does not exist"
    end
  end

  # INSTANCE METHODS

  def query(parameters = {})
    Factory.build(self).all(parameters)
  end

end
