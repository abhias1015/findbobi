require 'csv'
class CsvDb
  class << self
    def convert_save(model_name, csv_data)
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        target_model = model_name.classify.constantize
        new_object = target_model.new
        column_iterator = -1

        # Business Columns: ["name", "email", "is_owner", "is_approved", "location", "telephone", "website", "instagram", "opens_at", "closes_at", "business_type_id", "tag_list", "language_list"]
        if target_model == Business
          business_columns = target_model.column_names - ["id", "created_at", "updated_at", "lat", "lng"]
          business_columns += ["tag_list", "language_list"]
          business_columns.each_with_index { |column, index| new_object.send "#{column}=", row[index] }
        else
          target_model.column_names.each do |key|
            column_iterator += 1
            unless key == "ID"
              value = row[column_iterator]
              new_object.send "#{key}=", value
            end
          end
        end
        new_object.save
      end
    end
  end
end
