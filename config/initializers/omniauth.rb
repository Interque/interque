OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fuLeeRR8Aaok5sWom1knNvuwL', 'E4sw83WGCllSxpIAYqtsrwux69T1U4v1aNccPLBNrQFbNGPiHQ'
  #provider :linkedin, "78rft6m1ixpqt5", "HCfB06hTEcSTe4IW"
end