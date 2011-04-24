def login_as(user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
      "provider" => user.provider,
      "uid" => user.uid,
      "user_info" => {"name"=>user.name}
  }  
  visit(login_path)
end