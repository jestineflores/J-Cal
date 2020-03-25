class Calendar < ActiveRecord::Base
    belongs_to :user
    has_many :event, dependent: :destroy
    

    def self.noon
         noon = Time.now
         noon.change(hour:12)
     end
 
     def self.evening
         evening = Time.now
         evening.change(hour:17)
     end


end