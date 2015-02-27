class Task < ActiveRecord::Base
  belongs_to :user

  scope :to_do, -> { where(state: "to_do") }
  scope :doing, -> { where(state: "doing") }
  scope :done, -> { where(state: "done") }

  auto_html_for :content do
    html_escape
    image
    youtube(:width => "100%", :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  validates :user_id, presence: true
  validates :content, presence: true

end
