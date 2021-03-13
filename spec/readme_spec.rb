RSpec.describe 'README.md' do
  let(:filename) { 'README.md' }

  subject { File.open(filename).read }

  describe 'should contain ./all output' do
    let(:all_output) { `./all`.strip }
    let(:readme_all_content) { subject.scan(/```\n(.*)\n```/).first.first }

    it { expect(readme_all_content).to match(all_output) }
  end
end
