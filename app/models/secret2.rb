class Secret2 < ActiveRecord::Base
  belongs_to :person
  has_many :like2s, dependent: :destroy
  has_many :persons, through: :like2s, source: :person
end
