module ExceptionHandler; end

class ExceptionHandler::Aspects
  include Aquarium::Aspects
  include Singleton
  
  @classes  = [Users]
  @methods  = [:index, :show, :new, :create, :update, :destroy]
  @pointcut = Pointcut.new :calls_to => @methods, :on_type => @classes
  
  def self.catch_object_not_found_error
    Aspect.new :after_raising => DataMapper::ObjectNotFoundError, :pointcut => @pointcut do |join_point, object, *args|
      
      object rescue DataMapper::ObjectNotFoundError
        raise Exceptions::NotFound
    end
  end

end

ExceptionHandler::Aspects.catch_object_not_found_error