load 'lib/api_weather.rb'

class EltiempoCLI 

  def self.start(argv)

    command = argv[0]
    province = argv[1]

    province_url = ApiWeather.get_province_url(province)
    temp_min = ApiWeather.get_min_temp(province_url)
    temp_max = ApiWeather.get_max_temp(province_url)
    today = ApiWeather.get_today_temp(province_url)

    if (argv.empty?) || (command.eql? "help")
      puts "Try eltiempo -av_max 'Gavá'"
    elsif (command == "-av_max") 
      puts "The maximum temperature of the week in #{province} is #{temp_max.max}°C"
    elsif (command == "-av_min")
      puts "The minimum temperature of the week in #{province} is #{temp_min.min}°C"
    elsif (command == "-today")
      puts "Today #{province} will be #{today[0]} with \nminimum temperature of #{temp_min[0]}°C and maximum of #{temp_max[0]}°C"
    else
      puts "Command not accepted. \nRun 'eltiempo help' for more details."
    end
  end
end