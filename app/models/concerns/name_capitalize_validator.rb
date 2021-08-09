class NameCapitalizeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value.split(" ").length > 1
            record.errors.add(attribute, message: "Can only be 1 word")
        end
    end
end