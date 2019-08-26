Dir[File.dirname(__FILE__) + '/events/*.rb'].each do |file|
  require_relative file
end
