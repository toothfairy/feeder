RSpec.configure do |config|

  config.before do

    # Disable all observers
    ActiveRecord::Base.observers.disable :all

    # Find out which observers this spec needs
    observers = example.metadata[:observer] || example.metadata[:observers]

    # Turn on observers as needed
    if observers
      ActiveRecord::Base.observers.enable *observers
    end

  end

end