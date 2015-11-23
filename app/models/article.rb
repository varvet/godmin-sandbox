class Article < ActiveRecord::Base
  belongs_to :author

  def to_s
    title
  end
end
