class Message < ActiveRecord::Base
  feedable

  scope :test_even, -> { where("messages.id % 2 = 0") }
  scope :test_odd, -> { where("messages.id % 2 = 1") }
  scope :test_gte, -> { where("messages.id >= 3") }

  def chains_list
    [:chain1, :chain2]
  end
end
