require 'spec_helper'

describe command('java -version') do
  it { should return_stdout /.*1.7/ }
end
