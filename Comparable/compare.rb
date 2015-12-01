class Sock
  include Comparable
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def old(another_sock)
    if self.size < another_sock.size
      -1
    elsif self.size > another_sock.size
      1
    else
      0
    end
  end
 
  def <=>(another_sock)
    (self.size < another_sock.size)? -1: (self.size > another_sock.size)? 1: 0
  end
end

if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  s1 = Sock.new(2)
  s2 = Sock.new(3)

  puts "Are s1 and s3 equal #{s1 == s2}"


  class TC_PlayBookBuilder < Test::Unit::TestCase

    def setup
      @s1 = Sock.new(2)
      @s2 = Sock.new(3)
    end

    def test_neq
      assert_not_equal @s1, @s2
    end 

    def test_ge
      assert_operator @s1,:<,  @s2
    end 

    def test_lt
      assert_operator @s2,:>,  @s1
    end 

  end
  

end