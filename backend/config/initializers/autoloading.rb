# frozen_string_literal: true

module Domain; end
module Application; end
module Infra; end

autoloader = Rails.autoloaders.main

autoloader.push_dir(Rails.root.join('app', 'application').to_s, namespace: Application)
autoloader.push_dir(Rails.root.join('app', 'domain').to_s, namespace: Domain)
autoloader.push_dir(Rails.root.join('app', 'infra').to_s, namespace: Infra)
