module ExceptionHandler
  class ExceptionHandler::Aspects
    include Aquarium::Aspects
    include Singleton

    #Add your classes here
    @classes  = [Users]
    # On all non-inhereted methods
    @pointcut = Pointcut.new :on_type => @classes, :method_options => :exclude_ancestor_methods
  
    def self.catch_object_not_found_error
      Aspect.new :around, :pointcut => @pointcut do |join_point, object, *args|
        begin
          join_point.proceed   # call the wrapped join point
        rescue DataMapper::ObjectNotFoundError => e
          raise Exceptions::NotFound  # renders 404 page
        end
      end
    end

  end
end
ExceptionHandler::Aspects.catch_object_not_found_error