class Answer < ActiveRecord::Base
  belongs_to :title
  validates :answer, presence: true
end
