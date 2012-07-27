require 'braintree_country_select/version'

module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def braintree_country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_braintree_country_select_tag(priority_countries, options, html_options)
      end
      
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def braintree_country_options_for_select(selected = nil, priority_countries = nil)
        country_options = "".html_safe

        if priority_countries
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n".html_safe
          # prevents selected from being included twice in the HTML which causes
          # some browsers to select the second selected option (not priority)
          # which makes it harder to select an alternative priority country
          selected=nil if priority_countries.include?(selected)
        end

        return country_options + options_for_select(Braintree::Address::CountryNames.map {|c| [c[0], c[2]] }, selected)
      end
    end

    class InstanceTag
      def to_braintree_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            braintree_country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end

    class FormBuilder
      def braintree_country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.braintree_country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end
