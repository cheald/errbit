Fabricator :notification_service  do
  app!
  room_id { sequence :word }
  api_token { sequence :word }
  subdomain { sequence :word }
end

Fabricator :gtalk_notification_service, :from => :notification_service, :class_name => "NotificationService::GtalkService" do
  user_id { sequence :word }
  service_url { sequence :word }
  service { sequence :word }
end

%w(campfire hipchat hoiio pushover hubot).each do |t|
  Fabricator "#{t}_notification_service".to_sym, :from => :notification_service, :class_name => "NotificationService::#{t.camelcase}Service"
end
