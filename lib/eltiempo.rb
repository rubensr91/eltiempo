load 'lib/api_weather.rb'

class EltiempoCLI 

  def self.start(argv)

    command = argv[0]
    province = argv[1]

    if (argv.empty?) || (command.eql? "help")
      puts "Try eltiempo -av_max 'Gavá'"
    elsif (command == "-av_max") 
      temp = ApiWeather.get_max_temp(province)

      puts "The maximum temperature of the week in #{province} is #{temp}°C"
    elsif (command == "-av_min")
      temp = ApiWeather.get_min_temp(province)

      puts "The minimum temperature of the week in #{province} is #{temp}°C"
    elsif (command == "-today")
      temp = ApiWeather.get_today_temp(province)

      puts "The Atmospheric condition in #{province} is #{temp}"
    else
      puts "Command not accepted. \nRun 'eltiempo help' for more details."
    end
  end
end