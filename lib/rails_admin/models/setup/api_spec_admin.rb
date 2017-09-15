module RailsAdmin
  module Models
    module Setup
      module ApiSpecAdmin
        extend ActiveSupport::Concern

        included do
          rails_admin do
            navigation_label 'Connectors'
            navigation_icon 'fa fa-file-code-o'
            weight 200
            label 'API Spec'

            configure :url, :url

            configure :specification, :code do
              code_config do
                {
                  mode: 'text/x-yaml'
                }
              end
            end

            edit do
              fields :title, :url, :specification
            end

            fields :title, :url, :specification

            dashboard_group_path %w(gateway connectors api_specs)
          end
        end

      end
    end
  end
end
