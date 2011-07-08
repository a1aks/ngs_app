# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ngs_app_session',
  :secret      => '705b2dd12344f9d21d7d640d90154b612da93957c5fa9c0ed1233b615ee2e17cc5f5dadac0f80468d2178163f4527a46372900c61f50ff660100f409ba2a43b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
  ActionController::Base.session_store = :active_record_store
