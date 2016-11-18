
require 'open3'

def pingable?(host, timeout=5)
  system "ping -c 1 -t #{timeout} #{host} >/dev/null"
end

def command(cmd_str)
 stdout, stdeerr, status = Open3.capture3(cmd_str)
end

#---------------------------------------------------------------

Given(/^We have a computer$/) do
  puts "Check what OS we are running!"  
end

When(/^we ask for a active network interface$/) do
  puts "How to check this on a Mac with ruby?"
end

Then(/^the computer can confirm we have one$/) do
  puts "Check that we have something different than nil?"
end

#---------------------------------------------------------------

Given(/^we have a network interface$/) do
  step "We have a computer"
  step "we ask for a active network interface"
  step "the computer can confirm we have one"
end

When(/^pinging our local adress$/) do
  # uses ICMP 
  #@reply =  system("ping -c 1 127.0.0.1 > /dev/null")

  reply1 = pingable?('localhost')  
end

When(/^pinging our adress:(.*)$/) do | host |
  @reply = pingable?(host)  
end

Then(/^we get a valid reply$/) do
  assert @reply
 
end

#---------------------------------------------------------------

Given(/^that we have a local address$/) do
end

When(/^check if we have a assigned address$/) do
  require 'socket'
  @ip_addr = Socket.ip_address_list.find_all {|a| a.ipv4?  }.last.ip_address
  refute @ip_addr.nil?
end

Then(/^we got one$/) do
  assert pingable?(@ip_addr)
end

#---------------------------------------------------------------

Given(/^that we have a assigned address$/) do
  step "that we have a local address"
  step "check if we have a assigned address"
  step "we got one"  
end

When(/^we check if we have a first router$/) do
  
  # TODO :/etc/resolv.conf instead?
  out, err, status = command('netstat -r')

  @lll = out.match(/default([\s]+)(?<test>[\d\.]+)/)
  refute @lll.nil?
end

Then(/^we can ping it$/) do
  assert pingable?(@lll[:test])
end

#---------------------------------------------------------------

Given(/^that we have a first router$/) do
end

When(/^check if DNS lookup$/) do
  @out, err , status = command('dig 8.8.8.8')   # or nslookup??
  refute @out.nil?
end

Then(/^it is affirmative$/) do
  assert @out
end

Given(/^that we have a DNS lookup$/) do

end


