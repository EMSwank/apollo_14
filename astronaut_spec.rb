require 'rails_helper'

describe Astronaut do
  describe 'class methods' do
    it ".average_age" do
      astronaut1 = Astronaut.create(name: "Neil Armstrong", age: 32, job: "commander")
      astronaut2 = Astronaut.create(name: "Buzz Aldren", age: 30, job: "commander")
      avg_age = 31

      expect(Astronaut.average_age).to eq(avg_age)
    end
    
  end
end
