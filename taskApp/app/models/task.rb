class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true,
    presence: { message: "please any string" }
end
