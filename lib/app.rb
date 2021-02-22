require_relative 'log_summary'

file = ARGV[0]
csv = ARGV[1] == '--csv'
get_summary = LogSummary.new(file: file, csv: csv)
get_summary.display_totals
get_summary.display_views
# get_summary.generate_csv
