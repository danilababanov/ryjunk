#!/usr/bin/env ruby
#
#  TODO: - Error cases, 
#        - no contact with url(simulate) etc
#        - ingen konfigurerad resulter osv.
#        - optionParser, swith btw yml and json!
#        - loggerhantering, använd logger!
#        - 

require 'awesome_print'
require_relative './reader'
require_relative './resulter'
require_relative './presenter'


if __FILE__ == $PROGRAM_NAME

  begin
    
    puts "--read configuration"
    config = KonfigReader.new(reader = JSONReader.new)

    puts "--get relevant result provider ..."
    resulter = ResultBuilder.get(config)

    
    puts "--start presenter(s)"
    config.presenter.each { | p |  
#      Thread.new { PresenterBuilder.get(p, resulter) } 
       PresenterBuilder.get(p, resulter) 
    }

    #ap config

    resulter.run

  rescue => e

    puts "Caught a exception  ... ::#{e}::"
  
  end

  # TODO: catch Keyboardinterrupts?

end
