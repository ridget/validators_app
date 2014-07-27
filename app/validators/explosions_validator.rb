class ExplosionsValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    unless value.blank?
      explosions_requirement = options[:no_explosions] || 2
      explosions_count = value.scan(/boom|bang/).size
      word_count = value.split.size
      min_explosions = (word_count - explosions_count) * explosions_requirement
      unless explosions_count >= min_explosions
        record.errors[attribute] << (options[:message] || "Too Few Explosions")
      end
    end
  end
end