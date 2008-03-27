# module ExceptionHandler; end
# 
# class ExceptionHandler::Aspects
#   include Aquarium::Aspects
#   include Singleton
# 
#   
#   def self.catch_object_not_found_error
#     Aspect.new :around, :classes_and_descendents => Application, :method_options => :exclude_ancestor_methods do |join_point, object, *args|
#       begin
#         join_point.proceed   # call the wrapped join point
#       rescue DataMapper::ObjectNotFoundError => e
#         raise Exceptions::NotFound  # renders 404 page
#       end
#     end
#   end
# 
# end
# 
# 
# module ExceptionHandler2; end
# 
# class ExceptionHandler2::Aspects
#  include Aquarium::Aspects::DSL::AspectDSL
#  include Singleton
#   
#   def self.catch_object_not_found_error
#     around :classes_and_descendents => Application, :method_options => :exclude_ancestor_methods  do |join_point, object, *args|
#       begin
#         join_point.proceed   # call the wrapped join point
#       rescue DataMapper::ObjectNotFoundError => e
#         raise Exceptions::NotFound  # renders 404 page
#       end
#     end
#   end
# 
# end
# 
# 
# # ExceptionHandler::Aspects.catch_object_not_found_error
# ExceptionHandler2::Aspects.catch_object_not_found_error
# 
