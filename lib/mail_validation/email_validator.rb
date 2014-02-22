module MailValidation
  class EmailValidator < ActiveModel::EachValidator
    #uses the mail gem to validate an email address
    #also requires that the email is present and includes a domain
    def validate_each(record, attribute, value)
      begin
        address = Mail::Address.new(value)
        if address.domain.nil? || !address.domain.match(/\.[A-Za-z]+\z/)
          append_error(record, attribute)
        end
      rescue Mail::Field::ParseError => e
        append_error(record, attribute)
      end
    end

    protected
    def append_error(record, attribute)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
