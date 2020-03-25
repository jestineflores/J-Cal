class User < ActiveRecord::Base
    has_one :calendar
    has_many :event, through: :calendar

end