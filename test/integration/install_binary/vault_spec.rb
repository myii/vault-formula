describe file('/usr/local/bin/vault') do
  it { should be_a_file }
  it { should be_executable }
end

describe command('/usr/local/bin/vault -version') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should match(/^Vault v0.11.2 \('2b1a4304374712953ff606c6a925bbe90a4e85dd'\)/) }
end

describe service('vault') do
  it { should_not be_installed }
  it { should_not be_enabled }
  it { should_not be_running }
end

describe file("/etc/vault/config/server.hcl") do
  it { should_not be_a_file }
end
