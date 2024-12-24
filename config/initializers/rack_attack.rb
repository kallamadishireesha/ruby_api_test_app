# config/initializers/rack_attack.rb
require 'rack/attack'

class Rack::Attack
  # Throttle requests to 5 requests per minute per IP address
  throttle('req/ip', limit: 5, period: 10.seconds) do |req|
    req.ip
  end


  # Block requests from certain IP addresses
  blocklist('block bad IPs') do |req|
    ['1.2.3.4', '5.6.7.8'].include?(req.ip)
  end
end

# Debugging line to check if Rack::Attack is initialized
Rails.logger.info "Rack::Attack initialized"
