RSpec::Matchers.define :comprise do |*expected|
  match do |actual|
    actual == expected
  end
end