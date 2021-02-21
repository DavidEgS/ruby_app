# class to hold and logic the file

class LogSummary
  # readers solely used for test purposes uncomment if testing
  attr_reader :store, :total_visits, :unique_views

  def initialize(attributes = {})
    @store = {}
    @file = attributes[:file]
    @total_visits = {}
    @unique_views = {}
    create_store unless @file.nil?
  end

  def create_store
    # reads the file and save in to a hash
    File.readlines(@file).each do |line|
      holder = line.split(' ')
      if @store.key?(holder[0])
        update_save_ip_key(holder[0], holder[1])
      else
        @store[holder[0]] = {}
        create_ip_key(holder[0], holder[1])
      end
      results_total_views
      results_unique_views
    end
  end

  def results_total_views
    # iterates over each key in store then iterates throuogh nested hashes
    # to sum the number of visits per page
    @store.each do |key, val|
      counter = 0
      val.each { |_k, v| counter += v }
      @total_visits[key] = counter
    end
    @total_visits = hash_sort(@total_visits)
  end

  def results_unique_views
    # iterates over each key in store and counts nested keys to get
    # unique visits by ip
    @store.each do |key, val|
      @unique_views[key] = val.keys.length
    end
    @unique_views = hash_sort(@unique_views)
  end

  # next 2 methods are for calling a display output to terminal
  def display_totals
    puts 'Total Visits Per Page'
    results_generator(@total_visits, 'visits')
    puts '------'
  end

  def display_views
    puts 'Unique Views On Each Page'
    results_generator(@unique_views, 'unique views')
  end

  private

  def create_ip_key(arg1, arg2)
    # called in create store to build key and set to initial value
    # when a new url is found and also used for the nested hash to create
    # key value pairs
    # arg1 is the url arg2 ip address
    @store[arg1][arg2] = 1
  end

  def update_save_ip_key(arg1, arg2)
    # for existing urls records ip address visits
    # arg1 is the url arg2 ip address
    if @store[arg1].key?(arg2)
      @store[arg1][arg2] += 1
    else
      create_ip_key(arg1, arg2)
    end
  end

  def hash_sort(hash_arg)
    # to build the hashes ordered with most visits first
    hash_arg.sort_by { |_k, v| v }.reverse.to_h
  end

  def results_generator(result, message)
    # generates output result should be @total_views or @unique_views
    # message should be a string to give context of data
    result.each do |key, val|
      puts "#{key} #{val} #{message}"
    end
  end
end
