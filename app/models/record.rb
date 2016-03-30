class Record < ActiveRecord::Base
  validates :title, :started_at, :duration,
    presence: true
end
