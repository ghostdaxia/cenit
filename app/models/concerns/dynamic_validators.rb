module DynamicValidators
  extend ActiveSupport::Concern
  included do

    def self.validates_association_length_of(*args)
      args[1][:wrong_length] ||= 'should be of size %{count}'
      args[1][:too_long] ||= 'maximum size %{count} exceeded'
      args[1][:too_short] ||= 'under required minimum size %{count}'
      validates_with(Mongoid::Validatable::AssociationLengthValidator, _merge_attributes(args))
    end

    def self.validates_length_in_presence_of(*args)
      validates_with(Mongoid::Validatable::NonBlankLengthValidator, _merge_attributes(args))
    end

    def self.validates(*args)
      validates_with(Mongoid::Validatable::AssertionValidator, _merge_attributes(args))
    end
  end
end
