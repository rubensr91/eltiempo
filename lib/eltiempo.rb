require "eltiempo"
require 'thor'


module Eltiempo
  class CLI < Thor
    desc "hello [name]", "say my name"
    def hello(name)
      if name == "Heisenberg"
        puts "you are goddman right"
      else
        puts "say my name"
      end
    end
  end
end
