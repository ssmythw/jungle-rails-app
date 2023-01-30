RSpec.describe "User", type: :model do
    describe "User validations" do
        it "should should return not valid if the password and password_confirmation fields are different" do
            @user = User.new(name: 'Scott', email: 'scott@gmail.com', password: 'loosegoose123', password_confirmation: 'loosegoose321')
            @user.save
            expect(@user).not_to be_valid
        end
        it "should not be allowed in the database if there is an already existing email present" do
            @user = User.new(name: 'Scott', email: 'SCOTT@GMAIL.COM', password: 'loosegoose123', password_confirmation: 'loosegoose123')
            @user2 = User.new(name: 'Scott', email: 'scott@GMAIL.COM', password: 'mind123', password_confirmation: 'mind123')
            @user.save
            @user2.save
            expect(@user2).not_to be_valid
        end

        it "should return not valid if the name is nil" do
            @user = User.new(name: nil, email: 'SCOTT@GMAIL.COM', password: 'loosegoose123', password_confirmation: 'loosegoose123')    
            @user.save
            expect(@user).not_to be_valid
        end

        it "should return not valid if the email is nil" do
            @user = User.new(name: 'Scott', email: nil, password: 'loosegoose123', password_confirmation: 'loosegoose123')    
            @user.save
            expect(@user).not_to be_valid
        end
        it "should return not valid if a password is passed in that is under 6 characters in length" do
            @user = User.new(name: 'Scott', email: 'scott@gmail.com', password: 'abc12', password_confirmation: 'abc12')    
            @user.save
            expect(@user).not_to be_valid
        end
    end
    describe '.authenticate_with_credentials' do
        # examples for this class method here
        it "should return a valid user if the email and password exist in the database" do
            @user = User.new(name: 'Scott', email: 'scott@gmail.com', password: 'abc123', password_confirmation: 'abc123')    
            @user.save
            expect(@user.authenticate_with_credentials('scott@gmail.com', 'abc123')).not_to be_nil 
        end
        it "should return a valid user if the casing in the email is inconsistent with the db email" do
            @user = User.new(name: 'Scott', email: 'scott@gmail.com', password: 'abc123', password_confirmation: 'abc123')    
            @user.save
            expect(@user.authenticate_with_credentials('sCOtt@gmail.com', 'abc123')).not_to be_nil 
        end
        it "should return a valid user if there is extra whitespace in the email" do
            @user = User.new(name: 'Scott', email: 'scott@gmail.com', password: 'abc123', password_confirmation: 'abc123')    
            @user.save
            expect(@user.authenticate_with_credentials('   scott@gmail.com   ', 'abc123')).not_to be_nil 
        end
    end
end