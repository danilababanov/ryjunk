
testar = Hash.new

testar[:mijje]  = {:olle=> 2, :fille => ''}
testar[:kalle]  = {:olle=> '  ', :fille => 'josse'}

# Om en värde är tomma strängen sätt det till nil!!

def my_test(val, k,v)
  if v.is_a?(String)
    if v.strip.empty? 
      val[k] = nil
    end
  end
end

puts testar

pelle = testar.each do | _, val | 
          val.each do | k, v |  
            my_test(val, k, v)
          end 
        end

puts pelle 

pelle.each do | _, val | val.delete_if do | key, val | val.nil? end end

puts pelle

nisse = {:olle=> 2, :fille => nil}


nisse.delete_if do | key, val | val.nil? end

puts nisse