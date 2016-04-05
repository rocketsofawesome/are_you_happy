class Mood < ActiveRecord::Base
  scope :happy, where(happy: true)
  scope :unhappy, where(happy: false)

  scope :week_old, lambda {
    where(created_at: 1.week.ago..1.day.ago)
  }

  scope :dos_weeks, lambda {
    where(created_at: 2.week.ago..1.week.ago)
  }

  def self.average_happy
    ((happy.count/count.round(2))*100).round
  end

  def self.last_week
    return if week_old.count.zero?
    ((happy.week_old.count / week_old.count.round(2))*100).round
  end

  def self.prior_week
    return if dos_weeks.count.zero?
    ((happy.dos_weeks.count/dos_weeks.count.round(2))*100).round
  end

end

