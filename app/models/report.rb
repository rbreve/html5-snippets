class Report < ActiveRecord::Base
  belongs_to :snippet, :counter_cache => true
end
