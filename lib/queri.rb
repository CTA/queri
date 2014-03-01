require "queri/version"
require "yaml"
require "xmlrpc/client"
require 'active_support/ordered_hash'

lib = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Load helpers
require "queri/realtime_arg_helpers"
require "queri/arg_helpers"
require "queri/aggregate_report_helpers"
require "queri/composite_agent_level_report_helpers"
require "queri/composite_by_hour_report_helpers"
require "queri/composite_report_helpers"

# Load client/request libraries
require "queri/xml_client"
require "queri/request"

# Load report methods
require "queri/stats"
require "queri/realtime"

# Load Stats report classes
require "queri/stats/agents_and_sessions"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/agents_and_sessions", "*.rb" ) ].each {|f| require f }
require "queri/stats/answered_calls"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/answered_calls", "*.rb" ) ].each {|f| require f }
require "queri/stats/call_distribution_by_day"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/call_distribution_by_day", "*.rb" ) ].each {|f| require f }
require "queri/stats/call_distribution_by_day_of_week"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/call_distribution_by_day_of_week", "*.rb" ) ].each {|f| require f }
require "queri/stats/call_distribution_by_hour"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/call_distribution_by_hour", "*.rb" ) ].each {|f| require f }
require "queri/stats/call_outcomes"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/call_outcomes", "*.rb" ) ].each {|f| require f }
require "queri/stats/details_of_agent_sessions_and_pauses"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/details_of_agent_sessions_and_pauses", "*.rb" ) ].each {|f| require f }
require "queri/stats/details_of_answered_calls"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/details_of_answered_calls", "*.rb" ) ].each {|f| require f }
require "queri/stats/details_of_unanswered_calls"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/details_of_unanswered_calls", "*.rb" ) ].each {|f| require f }
require "queri/stats/distributions"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/distributions", "*.rb" ) ].each {|f| require f }
require "queri/stats/unanswered_calls"
Dir[ File.join( File.dirname(__FILE__), "queri/stats/unanswered_calls", "*.rb" ) ].each {|f| require f }

# Load Realtime report classes
require "queri/realtime/agents"
require "queri/realtime/calls"
require "queri/realtime/queues"

module Queri
  class << self
    def config
      Queri::XmlClient.config
    end

    def configure opts={}
      Queri::XmlClient.configure opts
    end

    def configure_with path_to_yaml_file
      Queri::XmlClient.configure_with path_to_yaml_file
    end

#    def send_request *args
#      Queri::XmlClient.send_request args
#    end

  end
end
