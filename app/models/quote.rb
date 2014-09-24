class Quote < ActiveRecord::Base
  attr_accessible :author, :text, :tag_list
  acts_as_taggable
end
