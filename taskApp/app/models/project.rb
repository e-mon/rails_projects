class Project < ActiveRecord::Base
  has_many :tasks
  validates :title,
    presence: { message: "please any string" },
    length: { minimum: 3, message: "too short"}
end
