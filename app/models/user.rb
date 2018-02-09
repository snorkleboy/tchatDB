class User < ApplicationRecord
    validates :username, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    validates :password_digest, presence: true  #,allow_nil:true
    validates :username, uniqueness: true
    
    attr_reader :password
    def password=(password)
            @password=password
            self.password_digest=BCrypt::Password.create(password)
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    def self.find_by_cred(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        end
        nil
    end
    def self.authenticate(username,password)
        user = User.find_by_cred(username,password)
        if (user)
            return user.login
        else
            return false
        end
    end
    def login
        set_session_token
    end
    def logout
        reset_session_token
    end

    private
    def generate_session_token
        SecureRandom.urlsafe_base64(16)
    end
    def set_session_token
        self.session_token = generate_session_token
        save!
        self.session_token
    end
    def reset_session_token
        self.session_token = ''
        save!
        self.session_token
    end

end
