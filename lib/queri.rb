require "queri/version"
require "yaml"
require "xmlrpc/client"

Dir[ File.join( File.dirname(__FILE__), "**", "*.rb" ) ].each {|f| require f}

module Queri
  LOGFILE = ""
  PERIOD = ""
  AGENT_FILTER = ""

  @config = {
    :host => "127.0.0.1",
    :path => "/path/to/queuemetrics.do",
    :port => "8080",
    :username => "username",
    :password => "some_secret"
  }

  @valid_config_keys = @config.keys

  @@server = nil

  private_constant :LOGFILE, :PERIOD, :AGENT_FILTER

  def self.config
    @config
  end

  def self.configure opts={}
    raise ArgumentError, "expected hash, got something else" if opts.class != Hash
    unless opts.empty?
      if (@valid_config_keys - opts.keys).any?
        puts "WARNING:  erroneous keys given to ::config. Acceptible keys include #{@valid_config_keys}"
      end
      if (opts.keys & @valid_config_keys).empty?
        raise ArgumentError, "erroneous keys given to ::config. Acceptible keys include #{@valid_config_keys}"
      else
        opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include?(k.to_sym)}
        @@server = XMLRPC::Client.new(host = @config[:host], path = @config[:path], port = @config[:port])
      end
    end
  end

  def self.configure_with path_to_yaml_file
    raise ArgumentError, "expected path to yaml file as string, got something else" if path_to_yaml_file.class != String
    begin
      config = YAML.load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      raise LoadError, "the specified configuration file could not be found"
    rescue Psych::SyntaxError
      raise LoadError, "the specified configuration file contains invalid syntax"
    end
    configure(config)
    @@server = XMLRPC::Client.new(host = @config[:host], path = @config[:path], port = @config[:port])
  end

  def self.send_request *args
    raise LoadError, "client configs not set. Assign by passing a hash to Queri.configure or a yaml file path to Queri.configure_with" if @@server.nil?
    request = Request.new(*args)
    response = @@server.call(*request.parameters)
    return response[request.report.class.xml_code]
  end

  class Request
    attr_reader :report

    def initialize *args
      raise ArgumentError, "expected arguments: queues(Array), report(Stats or Realtime obj), period_start(Time or Nil), period_end(Time or Nil)" unless valid_args?(args)
      @queues, @report, @period_start, @period_end = validate_args(args)
    end

    def parameters
      if @period_start.nil? && @period_end.nil?
        [@report.class.query_method, @queues.join("|"), Queri.config[:username], Queri.config[:password], LOGFILE, AGENT_FILTER, [@report.class.xml_code]]
      else
        [@report.class.query_method, @queues.join("|"), Queri.config[:username], Queri.config[:password], LOGFILE, PERIOD, @period_start, @period_end, AGENT_FILTER, [@report.class.xml_code]]
      end
    end

    private

      def valid_args? args
        valid = true
        valid = false if args[0].class != Array
        valid = false if args[1].class == NilClass
        valid = false if (args[2].class != NilClass && args[2].class != Time)
        valid = false if (args[3].class != NilClass && args[3].class != Time)
        return valid
      end

      def validate_args args
        raise ArgumentError, "queues array cannot be empty" if args[0].empty?
        if args[1].class.name.include?("Queri::Stats::")
          if (args[2].nil? || args[3].nil?)
            raise ArgumentError, "Queri::Stats reports require non-nil period start and end times"
          end
        elsif args[1].class.name.include?("Queri::Realtime::")
          unless (args[2].nil? && args[3].nil?)
            raise ArgumentError, "Queri::Realtime reports require nil period start and end times"
          end
        end
        args[2] = format_time(args[2])
        args[3] = format_time(args[3])
        return args
      end

      def format_time time
        return time unless time.respond_to?(:strftime)
        time.strftime("%Y-%m-%d.%H:%M:%S")
      end
  end
end