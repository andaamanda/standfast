namespace :installers do
  desc 'import a dataset supplied in the default format'
  task :import => :environment do
    require 'fastercsv'

    def status(counter, total, message)
      printf("\r#{message} #{counter}/#{total}")
      STDOUT.flush
    end

    file = ENV["file"]
    raise "no file specified with 'file=[file]'" if file.blank?
    
    installers = []
    invalid_lines = []
    dataset_total = @total = `wc -l #{file}`.chop.to_i
    loop_index = 0
    
    FasterCSV.foreach(file, :headers => true, :header_converters => lambda { |h| h.strip.downcase.tr(" ", "_").delete("^a-z0-9_").to_sym}) do |row|
      loop_index += 1
      
      attributes = {
        :name => row[:vendor],
        :contact => row[:contact],
        :phone => row[:telephone],
        :address => row[:address],
        :notes => row[:notes],
        :installer => true
      }
      attributes.merge!({ :distributor => true }) unless row[:distributor].blank?
      
      installer = Installer.new(attributes)
      if installer.valid?
        installers << installer
      else
        message = installer.errors.map {|e| "#{e[0].to_s} #{e[1]}"}.join(', ')
        invalid_lines << { loop_index => message }
      end
      status(loop_index, dataset_total, "Validating entries ")
    end
    
    puts "\nFound #{installers.count} valid installers"
    invalid_lines.each do |error|
      error.each do |line_number, message|
        puts "*Errors on line #{line_number}: #{message}"
      end
    end
    
    loop_index = 0
    installers.each do |installer|
      installer.save
      status(loop_index += 1, installers.count, "Creating entries ") if loop_index % 1 == 0
    end
    puts "\n#{installers.count} installers added"
  end
  
  desc 'import a dataset supplied in the default format'
  task :reset => :environment do
    file = ENV["file"]
    
    Installer.all.each do |installer|
      installer.destroy
    end
    puts "All installers destroyed"
    
    Rake::Task['installers:import'].invoke(file=file)
  end
end
