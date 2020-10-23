class Article < ApplicationRecord
  validates :title, presence: true
  has_one_attached :main_img
  has_rich_text :body


  def full_keywords(count_keys = 1, min_length_word = 4)
    if body.to_plain_text.length > 1
      array_keywords = []
      array_keywords = body.to_plain_text&.gsub(/[^[:word:]]/, ' ')&.downcase&.split(' ')
      array_keywords.compact!
      index_hash = {}
      array_keywords.each do |word|
        if word.length > min_length_word
          index_hash[word] ? index_hash[word] += 1 : index_hash[word] = 1
        end
      end
      array_keywords = []
      index_hash.each do |key, value|
        array_keywords << { key => value }
      end
      array_keywords.sort { |x, y| y.values[0] <=> x.values[0] }[0..count_keys - 1].map { |t| t.keys.first }
    end
  end

end
