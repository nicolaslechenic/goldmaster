class Foo
  def initialize(v, w, x, y, z)
    @v = v
    @w = w
    @x = x
    @y = y
    @z = z
  end

  def bar
    ((@z && (@x || @y)) && ((@x && @y) || (@x && @z))) ||
    (((@w || @v) || !@x) && (@x && (@y && @z)))
  end
end
