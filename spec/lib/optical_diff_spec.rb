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

    context 'by css selector' do
      subject { OpticalDiff.diff(html1, html2, :ignore => ['.ignore']) }
      it { should_not be_changed }
    end

    context 'by xpath' do
      subject { OpticalDiff.diff(html1, html2, :ignore => ['//p[contains(text(), "ignore")]']) }
      it { should_not be_changed }
    end

    context 'by multiple conditions' do
      let(:html3) { "<html><body>abcde<p class='ignore'>ignore</p><p>xpath</p></body></html>" }
      subject { OpticalDiff.diff(html1, html3, :ignore => ['.ignore', '//p[contains(text(), "xpath")]']) }
      it { should_not be_changed }
    end
  end
end
