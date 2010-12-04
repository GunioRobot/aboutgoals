# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aboutgoals_session',
  :secret      => '864915f5c55d3dbc8a36ad2c6f19701061a29220e7979fae6e920d883bb803d5080c534f48e5dc75a8282e94dc6591bc75805c4ffd219497359cfa7d46127649'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
