module RailsJwt
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install_route
      route 'mount RailsJwt::Engine => "/rails_jwt", as: :rails_jwt'
    end

    def copy_user_model
      copy_file "user.rb", "app/models/user.rb"
    end

    def copy_jwt_model
      copy_file "jwt.rb", "app/models/jwt.rb"
    end

    def copy_migrations
      # migration_template 'create_users.rb', 'db/migrate/rails_jtw_create_user.rb', migration_version
      # migration_template 'create_jwts.rb', 'db/migrate/rails_jtw_create_jwts.rb', migration_version

      copy_file "20211007002206_create_users.rb",
                "db/migrate/20211007002206_create_users.rb"
      copy_file "20211007002344_create_jwts.rb",
                "db/migrate/20211007002344_create_jwts.rb"

    end



    private

    def rails5_and_up?
      Rails::VERSION::MAJOR >= 5
    end

    def migration_version
      if rails5_and_up?
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      end
    end

  end
end