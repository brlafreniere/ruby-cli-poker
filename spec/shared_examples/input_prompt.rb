RSpec.shared_examples "input_prompt" do
  before do
    allow($stdin).to receive(:gets).and_return("")
    allow($stdout).to receive(:print)
  end

  it 'prompts the user' do
    expect($stdout).to receive(:print)
  end

  it 'gets input' do
    expect($stdin).to receive(:gets).and_return("")
  end
end