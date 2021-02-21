require_relative '../lib/app'

short_test = LogSummary.new(file: 'smallcorrect.log')

describe LogSummary do
  describe '#process_file_on_launch' do
    it 'should process the data to correct hash' do
      expect(short_test.store).to include('/sign_up', '/cart/2')
      expect(short_test.store['/sign_up']).to include('184.123.665.067')
    end
  end

  describe '#results_total_views' do
    it 'should respond to results_total_views' do
      expect(short_test).to respond_to :results_total_views
    end
    it 'should respond to results_total_views' do
      short_test.results_total_views
      expect(short_test.total_visits).to include('/sign_up' => 14, '/cart/2' => 11)
    end
  end

  describe '#results_unique_views' do
    it 'should respond to results_unique_views' do
      expect(short_test).to respond_to :results_unique_views
    end
    it 'should respond to results_unique_views' do
      short_test.results_unique_views
      expect(short_test.unique_views).to include('/sign_up' => 8, '/cart/2' => 10)
    end
  end
end
