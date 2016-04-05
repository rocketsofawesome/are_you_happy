require "spec_helper"

feature "Finding the average happy" do

  scenario "from the total" do
    2.times { Mood.create!(happy: true)  }
    4.times { Mood.create!(happy: false) }
    visit moods_path
    expect(page).to have_content "Happy Count Average: 33%"
  end

  scenario "from the last week" do
    Timecop.freeze
    1.times { Mood.create(happy: true,  created_at: Time.now)   }
    6.times { Mood.create(happy: true,  created_at: 1.week.ago) }
    6.times { Mood.create(happy: false, created_at: 1.week.ago) }
    visit moods_path

    expect(page).to have_content "Happy Count Average from last week: 50%"
  end

  scenario "from prior week" do
    Timecop.freeze
    1.times { Mood.create!(happy: true,  created_at: Time.now)     }
    3.times { Mood.create!(happy: true,  created_at: 2.weeks.ago)  }
    6.times { Mood.create!(happy: false, created_at: 2.weeks.ago)  }
    visit moods_path

    expect(page).to have_content "Happy Count Average from two weeks ago: 33%"
  end
end
