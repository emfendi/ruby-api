class Keyword < ApplicationRecord

  validates_presence_of :user_id, :keyword_name

  def self.get_distinct_keywords
    @keywords = Keyword.all
    @keywords = @keywords.group_by { |x| x['keyword_name'] }#.sort_by { |k, v| k.length }
    return @keywords
  end

end