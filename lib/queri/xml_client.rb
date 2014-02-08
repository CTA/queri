module Queri
  module XmlClient
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
      request = Request.new(args)
      response = @@server.call(*request.parameters)
      return response[request.report.class.xml_code]
    end
  end
end
