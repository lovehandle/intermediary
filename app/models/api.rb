class Api < ActiveRecord::Base

  # ASSOCIATIONS

  has_many :mappings

  # ATTRIBUTES

  accepts_nested_attributes_for :mappings

end
