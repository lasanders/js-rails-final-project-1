class Comment < ApplicationRecord
    belongs_to:user
    belongs_to:candy

    def user_attributes
        self.try(:user).try(:attributes)
      end
    
      def user_attributes=(user_attributes)
        user = User.find_or_create_by(name: name)
        self.user = user
      end
    
      def candy_name
        self.try(:candy).try(:attributes)
      end
    
      def candy_attributes=(attributes)
        candy = Candy.find_or_create_by(name: name)
        self.candy = candy
      end
end