require 'spec_helper'

describe OpticalDiff do
  context 'has no diff' do
    let(:html1) { "<html><body>abcde</body></html>" }
    let(:html2) { "<html><body>abcde</body></html>" }
    subject { OpticalDiff.diff(html1, html2) }
    it { should_not be_changed }
  end

  context 'has diff' do
    let(:html1) { "<html><body>abcde</body></html>" }
    let(:html2) { "<html><body>aaaaa</body></html>" }
    subject { OpticalDiff.diff(html1, html2) }
    it { should be_changed }
  end

  context 'ignore elements' do
    let(:html1) { "<html><body>abcde</body></html>" }
    let(:html2) { "<html><body>abcde<p class='ignore'>ignore</p></body></html>" }
    subject { OpticalDiff.diff(html1, html2, :ignore => ['.ignore']) }
    it { should_not be_changed }
  end
end
