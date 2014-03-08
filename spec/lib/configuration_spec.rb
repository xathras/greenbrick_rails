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

  context 'storage engine configuration' do
    context 'yaml engine' do
      it 'should have a setting for the path' do
        config = GreenbrickRails::Configuration.new
        config.storage.type = :yaml

        config.storage.settings.filename = './config/config.yml'
        expect( config.storage.settings.filename ).to eq( './config/config.yml' )
      end
    end
  end

  context 'instantiation of' do
    context 'the yaml engine' do
      it 'should initialize the engine correctly' do
        config = GreenbrickRails::Configuration.new
        config.storage.type = :yaml

        config.storage.settings.filename = './config/config.yml'

        engine = config.storage.engine_instance
        expect( engine.filename ).to eq( './config/config.yml' )
      end
    end

    context 'the redis engine' do
      it 'should initialize the engine correctly' do
        config = GreenbrickRails::Configuration.new
        config.storage.type = :redis

        config.storage.settings.key_space = 'example-key-space'

        engine = config.storage.engine_instance
        expect( engine.key_space ).to eq( 'example-key-space' )
        expect( engine.redis_client_options ).to eq( {} )
      end
    end
  end
end