group :red_green_refactor, halt_on_fail: true do
  guard :rspec, cmd: 'bundle exec rspec', all_on_start: false do
    watch(%r{^spec/(.+)_spec\.rb$})
    watch(%r{^(recipes)/(.+)\.rb$})   { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')      { 'spec' }
  end

  guard 'foodcritic', cookbook_paths: '.' do
    watch(%r{^attributes/.+\.rb$})
    watch(%r{^providers/.+\.rb$})
    watch(%r{^recipes/.+\.rb$})
    watch(%r{^resources/.+\.rb$})
    watch(%r{^templates/(.+)})
    watch('metadata.rb')
  end

  guard :rubocop
end
