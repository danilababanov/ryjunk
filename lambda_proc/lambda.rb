

module Key2id
  def key_2_idet(key)
    key.split(':').last
  end
end



class Testar
  include Key2id
  def initialize
    @key_2_id =  -> key { key.split(':').last}
  end

  def convert
     puts  @key_2_id.('1:2:10001')	
     puts  key_2_idet('1:2:10001')	
   

  end
end

class MeraTest

  def initialize

   @l = -> {puts @nisse } 
  end

  def mera_av
   @nisse = 'hej hopp'
   @l.call 
  end

end


if __FILE__ == $PROGRAM_NAME

  test = Testar.new

  test.convert


  mera_test = MeraTest.new

  mera_test.mera_av

end