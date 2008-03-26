module ExceptionHandler; end

class ExceptionHandler::Aspects
  include Aquarium::Aspects
  include Singleton

  @classes  = [Users]
  @methods  = [:index, :show, :update, :destroy]
  @pointcut = Pointcut.new :calls_to => @methods, :on_type => @classes
  
  def self.catch_object_not_found_error
    Aspect.new :around, :pointcut => @pointcut do |join_point, object, *args|
      begin
        join_point.proceed   # call the wrapped join point
      rescue DataMapper::ObjectNotFoundError => e
        raise Exceptions::NotFound  
      end
    end
  end

end

ExceptionHandler::Aspects.catch_object_not_found_error