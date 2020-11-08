case Rails.env
when 'production'
  PAYJP_PUBLIC_KEY = ENV['PROD_PAYJP_PUBLIC_KEY']
  PAYJP_SECRET_KEY = ENV['PROD_PAYJP_SECRET_KEY']
else
  PAYJP_PUBLIC_KEY = ENV['PAYJP_PUBLIC_KEY']
  PAYJP_SECRET_KEY = ENV['PAYJP_SECRET_KEY']
end