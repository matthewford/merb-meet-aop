# refactor auth logic in here
# include Aquarium::Aspects
# 
# methods = [:index, :show, :new, :create, :update, :destroy]
# classes = [:Users]
# 
# pointcut = Pointcut.new :calls_to => methods, :type => classes
# 
# aspect = Aspect.new :before,  :pointcut => pointcut do |join_point, object, *args|
# # auth rules
#   
# end
