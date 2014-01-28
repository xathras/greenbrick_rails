require 'spec_helper'

describe GreenbrickRails::Configuration do
  context 'storage engine' do
    it 'should recognize the yaml engine' do
      config = GreenbrickRails::Configuration.new
      config.storage.type = :yaml
      
      expect( config.storage.engine ).to eq( Greenbrick::Storage::Yaml )
    end

    it 'should recognize the redis engine' do
      config = GreenbrickRails::Configuration.new
      config.storage.type = :redis
      
      expect( config.storage.engine ).to eq( Greenbrick::Storage::Redis )
    end

    it 'should recognize the null engine' do
      config = GreenbrickRails::Configuration.new
      config.storage.type = :null
      
      expect( config.storage.engine ).to eq( Greenbrick::Storage::Null )
    end
  end
end