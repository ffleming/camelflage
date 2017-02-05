require 'github/markup'
namespace :assets do
  desc "HTML-ifies README.md and places the output in /public/index.html"
  task generate_root: :environment do
  end
end
