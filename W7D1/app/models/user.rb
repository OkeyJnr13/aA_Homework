class User < ApplicationRecord
    validates :username, :session_token, presence: true 
    # validates :username, presence: true
    # validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank"}
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_session_token

    attr_reader :password
    
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        return user if Bcrypt::Password.new(user.password_digest).is_password?(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16) #What does this do exeactly?
    end

    def reset_session_token!
        # self.session_token = self.class.generate_session_token 
        self.session_token = User.generate_session_token # self.class == User but why is this User and not self? 
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token # TA questions why is this User and not self? 
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end

# User.all # shows no users
# empty_gage = User.new
# empty_gage.save # rollback because of failed validations
# password_too_short_gage = User.new(username: 'gage', password: 'test')
# password_too_short_gage.save # rollback because of failed validations
# gage = User.new(username: 'gage', password: 'testing')
# gage.save # inserted into Users
# User.all #<ActiveRecord::Relation [#<User id: 1, username: "gage"...
# User.first.password_digest # shows a string of gibberish that you can't hack