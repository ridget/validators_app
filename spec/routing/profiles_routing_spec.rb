require 'spec_helper'

describe ProfilesController do
  describe 'routing' do

    it('routes to #index') { get('/profiles').should route_to('profiles#index') }
    it('routes to #new') { get('/profiles/new').should route_to('profiles#new') }
    it('routes to #show') { get('/profiles/1').should route_to('profiles#show', id: '1') }
    it('routes to #edit') { get('/profiles/1/edit').should route_to('profiles#edit', id: '1') }
    it('routes to #create') { post('/profiles').should route_to('profiles#create') }
    it('routes to #update') { put('/profiles/1').should route_to('profiles#update', id: '1') }
    it('routes to #destroy') { delete('/profiles/1').should route_to('profiles#destroy', id: '1') }
  end
end
