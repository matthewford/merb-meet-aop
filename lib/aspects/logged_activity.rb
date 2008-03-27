## trying to advise application and it's sub classes isnt working :(

module ExceptionHandler2
  class Aspects
   include Aquarium::Aspects::DSL::AspectDSL
   include Singleton
  
    def self.catch_object_not_found_error
      around :classes_and_descendents => Application, :method_options => :exclude_ancestor_methods  do |join_point, object, *args|
        begin
        puts "-" * 50
          join_point.proceed   # call the wrapped join point
        puts "-" * 50
        end
      end
    end
  end
end

# ExceptionHandler2::Aspects.catch_object_not_found_error

