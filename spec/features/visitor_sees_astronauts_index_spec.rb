require 'rails_helper'

describe "Visitor" do
  context "visits astronauts index" do
    it "sees list of astronauts with name, age, job" do
      astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "commander")

      visit astronauts_path

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
    it "sees the average age of all astronauts" do
      astronaut1 = Astronaut.create(name: "Neil Armstrong", age: 32, job: "commander")
      astronaut2 = Astronaut.create(name: "Buzz Aldren", age: 30, job: "commander")
      avg_age = 31

      visit astronauts_path

      expect(page).to have_content("Average Age: #{avg_age}")
    end
    it "see a list of the space missions' in alphabetical order for each astronaut" do
      astronaut1 = Astronaut.create(name: "Neil Armstrong", age: 32, job: "commander")
      astronaut2 = Astronaut.create(name: "Buzz Aldren", age: 30, job: "commander")
      mission1 = astronaut1.space_missions.create(title:"Apollo 13", trip_length: 500)
      mission2 = astronaut1.space_missions.create(title:"Capricorn 4", trip_length: 400)
      mission3 = astronaut1.space_missions.create(title:"Gemini 7", trip_length: 400)
      mission4 = astronaut1.space_missions.create(title:"Apollo 11", trip_length: 500)
      mission5 = astronaut1.space_missions.create(title:"Capricorn 3", trip_length: 400)
      mission6 = astronaut1.space_missions.create(title:"Gemini 5", trip_length: 400)
      
      visit astronauts_path

      expect(page).to have_content("Missions: #{mission1.title}, #{mission2.title}, #{mission3.title}")
      expect(page).to have_content("Missions: #{mission4.title}, #{mission5.title}, #{mission6.title}")
    end
  end
end

=begin


```
As a visitor,
When I visit '/astronauts'
I see a list of the space missions' in alphabetical order for each astronaut.
(e.g "Apollo 13"
     "Capricorn 4"
     "Gemini 7")
```

```
As a visitor,
When I visit '/astronauts'
I see the total time in space for each astronaut.
(e.g. "Total Time in Space: 760 days")
```
=end