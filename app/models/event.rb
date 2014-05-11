class Event < ActiveRecord::Base
    has_many: DiscussionPost
end
