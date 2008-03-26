# module AuthenticationRules; end
# 
# class AuthenticationRules::Aspects
#   include Aquarium::Aspects
#   include Singleton
# 
#   @classes  = [:Applicaion]
#   @all_methods  = [:index, :show, :new, :create, :update, :destroy]
#   @auth_methods = [:new, :create, :update, :destroy]
#   
#   @pointcut = Pointcut.new :calls_to => @methods, :on_type => @classes
#   
#   #after class loads, add auth logic
# 
# end
# 
# AuthenticationRules::Aspects