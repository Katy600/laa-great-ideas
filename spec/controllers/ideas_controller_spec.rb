# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe IdeasController, type: :controller do
  let(:default_user) do
    User.create!(email: 'me@justice.gov.uk', password: 'change_me')
  end
  # This should return the minimal set of attributes required to create a valid
  # Idea. As you add validations to Idea, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      title: 'My big idea'
    }
  end

  let(:invalid_attributes) do
    {
      title: ''
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IdeasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    sign_in default_user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      default_user.ideas.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      idea = default_user.ideas.create! valid_attributes
      get :show, params: { id: idea.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      idea = default_user.ideas.create! valid_attributes
      get :edit, params: { id: idea.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Idea' do
        expect do
          post :create, params: { idea: valid_attributes }, session: valid_session
        end.to change(Idea, :count).by(1)
      end

      it 'redirects to the created idea' do
        post :create, params: { idea: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Idea.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { idea: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { title: 'A different title' }
      end

      it 'updates the requested idea' do
        idea = default_user.ideas.create! valid_attributes
        put :update, params: { id: idea.to_param, idea: new_attributes }, session: valid_session
        idea.reload
        expect(idea.title).to eq('A different title')
      end

      it 'redirects to the idea' do
        idea = default_user.ideas.create! valid_attributes
        put :update, params: { id: idea.to_param, idea: valid_attributes }, session: valid_session
        expect(response).to redirect_to(idea)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        idea = default_user.ideas.create! valid_attributes
        put :update, params: { id: idea.to_param, idea: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested idea' do
      idea = default_user.ideas.create! valid_attributes
      expect do
        delete :destroy, params: { id: idea.to_param }, session: valid_session
      end.to change(Idea, :count).by(-1)
    end

    it 'redirects to the ideas list' do
      idea = default_user.ideas.create! valid_attributes
      delete :destroy, params: { id: idea.to_param }, session: valid_session
      expect(response).to redirect_to(ideas_url)
    end
  end
end
