module Grobie
  module Trimify
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def trimify(*args)
        return if args.empty?
        return false unless table_exists?

        options = { :nilify => true }
        options.merge!(args.pop) if args.last.kind_of? Hash

        unless self.included_modules.include?(Trimify::InstanceMethods)
          include Trimify::InstanceMethods
          write_inheritable_attribute :trimify_attributes, {}
          class_inheritable_reader :trimify_attributes
        end

        attributes = args.map(&:to_sym)
        col_options = {}
        columns = content_columns.reject { |c| c.type != :string }.map { |c| c.name.to_sym }.select { |c| args.include?(c) }
        columns.each { |col| col_options[col] = options }
        write_inheritable_hash :trimify_attributes, col_options

        class_eval "before_validation :trimify"
      end
    end

    module InstanceMethods
      def trimify
        self.class.trimify_attributes.each do |attribute, options|
          value = read_attribute(attribute) 
          if value.is_a?(String)
            value.strip!
            value = nil if (value.blank? && options[:nilify] == true)
            write_attribute(attribute, value)
          end
        end
      end
    end
  end
end