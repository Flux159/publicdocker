
Changes: If you want to have a different configuration to put specific messages into
different indices, in output {}, you should do something like the following:

  # Put outputs into different indices based on message type
  # if [message] ~= /(STAT)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "stats-%{+YYYY.MM.dd}"
  #   }
  # } else if [message] ~= /(TRACK)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "tracking-%{+YYYY.MM.dd}"
  #   }
  # } else if [message] ~= /(REQUEST)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "requests-%{+YYYY.MM.dd}"
  #   }
  # } else if [message] ~= /(METRIC)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "metrics-%{+YYYY.MM.dd}"
  #   }
  # } else if [message] ~= /(CLIENT)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "clients-%{+YYYY.MM.dd}"
  #   }
  # } else if [message] ~= /(CRASH)+/ {
  #   elasticsearch { 
  #     hosts => [ "${ESHOSTS}" ]
  #     index => "crashes-%{+YYYY.MM.dd}"
  #   }
  # } else {
  # Default for LOG|WARNING|INFO|ERROR
  # Defaults to "logstash-%{+YYYY.MM.dd}"
  # }

