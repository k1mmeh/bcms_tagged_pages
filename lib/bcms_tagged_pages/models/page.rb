Page # must ensure that the core page class loads first
class Page < ActiveRecord::Base
  is_taggable
end
