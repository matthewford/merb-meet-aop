# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

# Make the app's "lib" directory a place where ruby files get "require"d from
$LOAD_PATH.unshift(Merb.root / "lib")


Merb::Config.use do |c|
  
  ### Sets up a custom session id key, if you want to piggyback sessions of other applications
  ### with the cookie session store. If not specified, defaults to '_session_id'.
  # c[:session_id_key] = '_session_id'
  
  c[:session_secret_key]  = 'cf44169b53dbe1497e386151ecedf96a204e5b14'
  c[:session_store] = 'cookie'
end  

use_orm :datamapper

use_test :rspec

### Add your other dependencies here
dependencies "aquarium"

# dependencies "RedCloth", "merb_helpers"

Merb::BootLoader.after_app_loads do

  ### Add dependencies here that must load after the application loads:
  require 'aspects/an_example_match';   puts " ~ loading an_example_match aspect"
  # require 'aspects/exception_handler';  puts " ~ loading exception_handler aspect"
  # require 'aspects/logged_activity';    puts " ~ loading logged_activity aspect"
end
