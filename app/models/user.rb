class User < DataMapper::Base
  property :name, :string
  
  def to_s
    self.name
  end
end