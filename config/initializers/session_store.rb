# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_repo_managaer_session',
  :secret      => 'c1e7ebe2eda0a4f8eb3792f7a597a3ad4690bc9514c833aae47058925bba912075afc67e30f1d8f0643c52223a1757e11293a30968858a824d92f8c498b17b9a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
