module Example
  class Aspects
    include Aquarium::Aspects
    include Singleton
  
    @classes  = [Users]
    @methods  = [:index, :show, :new, :create, :update, :destroy]
    @pointcut = Pointcut.new :calls_to => @methods, :on_type => @classes

    def self.before_advice
      Aspect.new :before, :pointcut => @pointcut do |join_point, object, *args|
        puts("Before Advice on #{join_point.target_type}, method #{join_point.method_name}")
      end
    end

    def self.after_advice
      Aspect.new :after, :pointcut => @pointcut do |join_point, object, *args|
        puts("After Advice on #{join_point.target_type}, method #{join_point.method_name}")
      end  
    end

    def self.around_advice
      Aspect.new :around, :pointcut => @pointcut do |join_point, object, *args|
        puts("*" * 50)
        result = join_point.proceed
        puts("*" * 50)
        result #need to return the result of proceed
      end
    end
  end
end

Example::Aspects.before_advice
Example::Aspects.after_advice
Example::Aspects.around_advice

