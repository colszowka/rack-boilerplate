Routes = Rack::Builder.new do
  use Rack::Session::Cookie, key: ENV['SESSION_KEY'],
                             expire_after: 24*60*60, # 1 day in seconds
                             secret: ENV['SESSION_SECRET']

  # Example of how to mount subapplications in rack builder. You'll want to
  # replace this with a more useful rack app :)
  require 'rack/lobster'
  map "/lobster" do
    use Rack::Lint
    run Rack::Lobster.new
  end
  run App::Demo
end