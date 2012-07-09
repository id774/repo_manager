# -*- encoding: utf-8 -*-

module ActionView
  module Helpers
    module FormTagHelper
      alias_method :original_submit_tag, :submit_tag
      def submit_tag(value=nil, options={})
        options[:disable_with] = '処理中...' unless options[:disable_with]
        original_submit_tag(value, options)
      end
    end
  end
end
