require 'spec_helper'

describe ppa('ppa:builds/sphinxsearch-rel22') do
  it { should be_enabled }
end

describe service('sphinxsearch') do
  it { should be_running }
end

describe process('searchd') do
  it { should be_running }
end
