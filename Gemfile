source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails-erd'

gem 'rails', '~> 6.1.3'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # XXX
  # Esta gema lo que hace es anotar los archivos de modelos con los atributos que tiene en la base de datos
  # Para que se instale, además de ejecutar el comando "bundle install", luego debe ejecutar el comando
  # "rails g annotate:install". PERO NO LO HAGA ACÁ, porque yo ya lo hice.
  # Una vez instalado, se creará un archivo en "lib/tasks/auto_annotate_models.rake" con instrucciones que
  # usted puede personalizar para poner información de la base de datos en sus archivos.
  gem 'annotate'

  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
