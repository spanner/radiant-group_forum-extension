module GroupExtensions
  def self.included(base)
    base.class_eval {
      has_and_belongs_to_many :forums
      include InstanceMethods
    }
  end

  module InstanceMethods     
    def topics  
      
    end
    
    def posts
      
    end
  end
end