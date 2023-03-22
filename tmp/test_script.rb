class Foo
  def initialize(param)
    @foo = param
  end
end

f = Foo.new("foobar")
puts f.instance_eval { @foo }.inspect
puts f.instance_variables.inspect