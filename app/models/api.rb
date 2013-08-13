class Api < ActiveRecord::Base

  # INCLUSIONS

  include Extensions::UUID

  # ASSOCIATIONS

  has_many :mappings

  # ATTRIBUTES

  accepts_nested_attributes_for :mappings

  # CLASS METHODS

  def self.query(id, parameters = {})
    find(id).query(parameters)
  end

  # INSTANCE METHODS

  def query(parameters = {})
    Factory.build(self).all(parameters)
  end

end
