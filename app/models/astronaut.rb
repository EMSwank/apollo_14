class Astronaut < ApplicationRecord

  has_many :space_missions

  def self.average_age
    average(:age)
  end
end
