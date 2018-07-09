require 'rails_helper'

describe "Visitor" do
  context "visits astronauts index" do
    it "list of astronauts with name, age, job" do
      astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "commander")

      visit astronauts_path

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
  end
end

=begin```
As a visitor,
When I visit '/astronauts'
I see a list of astronauts with the following info:
 - Name
 - Age
 - Job
 (e.g. "Name: Neil Armstrong" Age: 37 Job: Commander")
```

```
As a visitor,
When I visit '/astronauts'
I see the average age of all astronauts.
(e.g. "Average Age: 34")
```

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