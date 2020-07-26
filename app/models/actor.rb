require 'pry'

class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :shows

  def full_name
    "#{self.first_name} "+"#{self.last_name}"
  end

  def list_roles
    self.characters.map {|char| [char.name + " - " + char.show.name]}.flatten
  end

end