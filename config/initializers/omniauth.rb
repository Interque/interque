OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fuLeeRR8Aaok5sWom1knNvuwL', 'E4sw83WGCllSxpIAYqtsrwux69T1U4v1aNccPLBNrQFbNGPiHQ'
  #provider :linkedin, "78rft6m1ixpqt5", "HCfB06hTEcSTe4IW"
  provider :github, '635400d4ad2bb4d7763d', '63f499e86c10200014f1abd0683c61e5a1dca167'
end