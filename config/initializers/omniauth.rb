Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'z4JNy9aNZYtpcTv5giJt8hPpB', 'VUkdUANO944f7SlR8q8VFKniqUVELw2a4EWbxAVvAkj4AvtzTO'
  #provider :linkedin, "78rft6m1ixpqt5", "HCfB06hTEcSTe4IW"
end