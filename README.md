# Queri

Queri, or Queuemetrics Reporting Interface, sends requests to XMLRPC Client to return stats from Queuemetrics' reporting API platform given a valid set of client configurations.

## Installation

Add this line to your application's Gemfile:

    gem 'queri'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install queri

## Usage

### Configuring

Configurations for connecting to a Queuemetrics XMLRPC client are needed to send requests for analyses. They can be viewed with:

    Queri::config

You can set these configurations with the following:

    Queri::configure({username: "new_user", password: "new_password"})

or with a local YAML file:

    Queri::configure_with("/path/to/a/config.yml")

### Basic Usage

    queues = ["1234"]
    period_start = Time.now - 3600
    period_end = Time.now
    Queri::Stats::AgentsAndSessions::AgentAvailability.new( queues, period_start, period_end )
    #=> report_object

These report objects respond to the method #response, which returns either an Array or a Hash, depending on whether the report is an agent-level or aggregate analysis.
Keys for this response can be found by calling ::keys on the object class. ::key\_translations for the object class returns a hash associating these keys with the raw data keys returned from the XMLRPC client.

### Available Analyses

Currently returns analyses from two methods: QM.stats and QM.realtime.
  * Stats
    * AgentsAndSessions
      * AgentAvailability
      * AgentBillableTimeByHour
      * AgentOccupancyReport
      * AgentPayableTimeByHour
      * AgentPerformanceByAcdGroup
      * AgentSessionDetail
      * AgentSessionTimeByHour
      * AnsweredCallsByCustomGroup
      * AnsweredCallsByLocation
      * AnsweredCallsByServiceGroup
      * AnsweredCallsForSelectedQueues
      * SessionAndPauseDurations
    * AnsweredCalls
      * AgentsOnQueue
      * AllCalls
      * AnsweredCallsByDirection
      * AnsweredCallsByQueue
      * AnsweredCallsByStints
      * CallsFullyWithinTheGivenTimeInterval
      * DisconnectionCauses
      * DnisUsed
      * IvrSelection
      * MusicOnHoldByAgent
      * QueuePosition
      * ServiceLevelAgreement
      * Transfers
    * CallDistributionByDay
      * AnsweredCallDistributionPerDay
      * AnsweredCallWaitTimePerDay
      * InclusiveServiceLevelAgreementPerDay
      * QueueLengthPerDay
      * SalesPerDay
      * ScheduleAdherencePerDay
      * TrafficAnalysisByPeriodPerDay
      * UnansweredCallWaitTimePerDay
    * CallDistributionByDayOfWeek
      * AnsweredCallDistributionPerDayOfWeek
      * AnsweredCallWaitTimePerDayOfWeek
      * InclusiveServiceLevelAgreementPerDayOfWeek
      * QueueLengthPerDayOfWeek
      * SalesPerDayOfWeek
      * ScheduleAdherencePerDayOfWeek
      * TrafficAnalysisByPeriodPerDayOfWeek
      * UnansweredCallWaitTimePerDayOfWeek
    * CallDistributionByHour
      * AnsweredCallDistributionPerHour
      * AnsweredCallWaitTimePerHour
      * InclusiveServiceLevelAgreementPerHour
      * QueueLengthPerHour
      * SalesPerHour
      * ScheduleAdherencePerHour
      * TrafficAnalysisByPeriodPerHour
      * UnansweredCallWaitTimePerHour
    * CallOutcomes
      * BillableActivities
      * CallResultsByOutcomes
      * DetailedAgentReport
      * NonbillableActivities
      * Outcomes
    * DetailsOfAgentSessionsAndPauses
      * DetailOfAgentSessions
      * DetailOfAgentPauses
    * DetailsOfAnsweredCalls
      * QueueDetails
    * DetailsOfUnansweredCalls
      * DetailOfUnansweredCalls
    * Distributions
      * AcdAttemptsByQueue
      * AcdAttemptsByTerminal
      * InboundAcdCallAttempts
    * UnansweredCalls
      * AllCalls
      * AllCallsByStints
      * CallOverview
      * CallsFullyWithinTheGivenTimeInterval
      * DisconnectionCauses
      * DnisUsed
      * DnisUsedForAllCalls
      * EnterQueuePosition
      * EnterQueuePositionForAllCalls
      * InclusiveAnsweredServiceLevelAgreement
      * InclusiveServiceLevelAgreement
      * IvrSelection
      * IvrSelectionForAllCalls
      * UnansweredCallsByKeyPress
      * UnansweredCallsByQueue
      * UnansweredCallsByStints
      * UnansweredCallsDistributionByLength
      * UnansweredOutboundCallsByAgent
  * Realtime
    * Agents
    * Calls
    * Queues

### Required Arguments

Required arguments differ for the report classes.

Any subclass of Queri::Stats requires timestamps for period start and end, and will correct cases in which beginning times are greater than ending times.

Any subclass of Queri::Realtime will accept timestamps for period, but they will be ignored in the returned response, as the QM.realtime method does not accept a period restriction.

### Returned Values

Returned values vary between agent-level and aggregate reports.
Agent-level reports return an Array of Hashes, each Hash corresponding to an agent's metrics for the requested analysis.
Composite agent-level reports return a Hash associating agent usernames with an Array of Hashes (each record for the requested analysis).
Aggregate reports return a single Hash; the composite metrics for the requested analysis.
Composite aggregate reports return an Array of Hashes, each Hash corresponding to various criteria for the composite metrics of the request analysis.
  * Agent-level reports
    * Stats
      * AgentsAndSessions
        * AgentAvailability
        * AgentBillableTimeByHour
        * AgentOccupancyReport
        * AgentSessionTimeByHour
        * AgentPayableTimeByHour
        * AgentPerformanceByAcdGroup
        * AnsweredCallsByCustomGroup
        * AnsweredCallsByLocation
        * AnsweredCallsByServiceGroup
        * AnsweredCallsForSelectedQueues
        * SessionAndPauseDurations
      * AnsweredCalls
        * AgentsOnQueue
        * MusicOnHoldByAgent
      * DetailsOfAnsweredCalls
        * QueueDetails
      * DetailsOfUnansweredCalls
        * DetailOfUnansweredCalls
      * UnansweredCalls
        * UnansweredOutboundCallsByAgent
        * UnansweredCallsByKeyPress
    * Realtime
      * Agents
      * Calls
      * Queues
  * Composite agent-level reports
    * Stats
      * DetailsOfAgentSessionsAndPauses
        * DetailOfAgentSessions
        * DetailOfAgentPauses
  * Aggregate reports
    * Stats
      * AgentsAndSessions
        * AgentSessionDetail
      * AnsweredCalls
        * AllCalls
        * CallsFullyWithinTheGivenTimeInterval
      * CallOutcomes
        * Outcomes
      * Distributions
        * InboundAcdCallAttempts
      * UnansweredCalls
        * AllCalls
        * CallsFullyWithinTheGivenTimeInterval
  * Composite aggregate reports
    * Stats
      * AnsweredCalls
        * AnsweredCallsByDirection
        * AnsweredCallsByQueue
        * AnsweredCallsByStints
        * DisconnectionCauses
        * DnisUsed
        * IvrSelection
        * QueuePosition
        * ServiceLevelAgreement
        * Transfers
      * CallDistributionByDay
        * AnsweredCallDistributionPerDay
        * AnsweredCallWaitTimePerDay
        * InclusiveServiceLevelAgreementPerDay
        * QueueLengthPerDay
        * SalesPerDay
        * ScheduleAdherencePerDay
        * TrafficAnalysisByPeriodPerDay
        * UnansweredCallWaitTimePerDay
      * CallDistributionByDayOfWeek
        * AnsweredCallDistributionPerDayOfWeek
        * AnsweredCallWaitTimePerDayOfWeek
        * InclusiveServiceLevelAgreementPerDayOfWeek
        * QueueLengthPerDayOfWeek
        * SalesPerDayOfWeek
        * ScheduleAdherencePerDayOfWeek
        * TrafficAnalysisByPeriodPerDayOfWeek
        * UnansweredCallWaitTimePerDayOfWeek
      * CallDistributionByHour
        * AnsweredCallDistributionPerHour
        * AnsweredCallWaitTimePerHour
        * InclusiveServiceLevelAgreementPerHour
        * QueueLengthPerHour
        * SalesPerHour
        * ScheduleAdherencePerHour
        * TrafficAnalysisByPeriodPerHour
        * UnansweredCallWaitTimePerHour
      * CallOutcomes
        * BillableActivities
        * CallResultsByOutcomes
        * DetailedAgentReport
        * NonbillableActivities
      * Distributions
        * AcdAttemptsByQueue
        * AcdAttemptsByTerminal
      * UnansweredCalls
        * AllCallsByStints
        * CallOverview
        * DisconnectionCauses
        * DnisUsed
        * DnisUsedForAllCalls
        * EnterQueuePosition
        * EnterQueuePositionForAllCalls
        * InclusiveAnsweredServiceLevelAgreement
        * InclusiveServiceLevelAgreement
        * IvrSelection
        * IvrSelectionForAllCalls
        * UnansweredCallsByQueue
        * UnansweredCallsByStints
        * UnansweredCallsDistributionByLength

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
