class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.queued_for_write[:original] && record.send("#{attribute}?".to_sym)
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]
      height = options[:height]

      record.errors[attribute] << "Height and Width should not be more than #{height}x#{width} px" if dimensions.width > width
      record.errors[attribute] << "Height and Width should not be more than #{height}x#{width} px" if dimensions.height > height
    end
  end
end
