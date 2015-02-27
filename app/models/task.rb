class Task < ActiveRecord::Base
  belongs_to :user

  scope :to_do, -> { where(state: "to_do") }
  scope :doing, -> { where(state: "doing") }
  scope :done, -> { where(state: "done") }

end
