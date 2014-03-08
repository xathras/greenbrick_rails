require 'spec_helper'

describe GreenbrickRails::StorageConfiguration do
  it 'should retrieve items from the internal hash' do
    object = GreenbrickRails::StorageConfiguration.new test_key: 'test_value'
    expect( object.test_key ).to eq( 'test_value' )
  end

  it 'should store items from the internal hash' do
    object = GreenbrickRails::StorageConfiguration.new test_key: ''

    object.test_key = 'test_value'
    expect( object.test_key ).to eq( 'test_value' )
  end

  it 'should throw an exception for a key that does not exist' do
    object = GreenbrickRails::StorageConfiguration.new test_key: ''
    expect { object.bobs_your_uncle }.to raise_error( NoMethodError )
  end

  it 'should not assign keys that are not in the hash at initialization' do
    object = GreenbrickRails::StorageConfiguration.new test_key: ''
    expect { object.bob = 'test' }.to raise_error( NoMethodError )
  end
end