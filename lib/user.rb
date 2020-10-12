require 'pry'
class User
    attr_accessor :email , :age
    @@user_acount =[]
    def initialize(usr_email,usr_age)
        @email = usr_email.to_s
        @age =usr_age.to_i
        @@user_acount << [self.email,self.age]
    end

    def self.usr
        return @@user_acount
    end 
    def find_by_email(email)
        
        if @@user_acount.flatten.include?(email)
            i =User.usr.flatten.index(email) +1
            puts "Voici l'age du User trouvé #{User.usr.flatten[i]} ans"

        else puts "votre email n'est pas dans la liste"
        end 
    end
    
end

julie = User.new('julie@gmail.com',32)
marie = User.new('marie@gmail.com',24)

binding.pry
