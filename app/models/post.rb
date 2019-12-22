class Post < ApplicationRecord
  validates :title, :description, :comments, :presence => true
  validates :title, :length => { :minimum => 5}
  validates :title, :uniqueness => {:message => "already taken"}
end
