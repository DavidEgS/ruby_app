require_relative 'log_summary'

file = ARGV[0]
get_summary = LogSummary.new(file: file)
get_summary.display_totals
get_summary.display_views
