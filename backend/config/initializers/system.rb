# frozen_string_literal: true

Dry::Rails.container do
  config.features = %i[
    safe_params
    controller_helpers
  ]

  config.component_dirs.memoize = true

  config.component_dirs.add 'app' do |dir|
    dir.auto_register = proc do |component|
      component.identifier.key.start_with?(/domain|use_case/)
    end
  end
end
