bundle exec rake webpacker:install
bin/rails db:migrate
bin/rails server --binding 0.0.0.0
