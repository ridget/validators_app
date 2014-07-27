require 'spec_helper'

describe ProfilesController do
  render_views
  common_lets

  before :all do
    Fracture.define_selector :new_profile_link
    Fracture.define_selector :cancel_new_profile_link
    Fracture.define_selector :edit_profile_link
    Fracture.define_selector :cancel_edit_profile_link
  end

  # stub strong params
  before { controller.stub(profile_params: {}) }

  context 'not logged in' do
    before do
      sign_out :user
    end

    {index: :get, show: :get, new: :get, create: :post, edit: :get, update: :put, destroy: :delete}.each do |v, m|
      it "#{m} #{v} should logout" do
        self.send(m, v, id: profile)
    should redirect_to new_user_session_path
  }
    end
  end

  context 'logged in as user' do
    before { sign_in user }

    describe 'GET index' do
      before do
        profile; profile_other
        get :index
      end

      it { should assign_to(:profiles).with_items([profile]) }
      it { should render_template :index }
      it { should have_only_fractures(:new_profile_link) }
      end

          describe 'GET show' do
      before { get :show, id: profile }

    it { should assign_to(:profile).with(profile) }
    it { should render_template :show }
    it { should have_only_fractures(:edit_profile_link) }
    end

    describe 'GET new' do
      before { get :new }

      it { should assign_to(:profile).with_kind_of(Profile) }
      #it { should assign_to('profile.parent').with(parent) }
      it { should render_template :new }
      it { should have_only_fractures :cancel_new_profile_link }
      it { should have_a_form.that_is_new.with_path_of(profiles_path)}
    end

    describe 'POST create' do
      context 'valid' do
        before do
          Profile.any_instance.stub(:valid?).and_return(true)
          post :create
        end

        it { should redirect_to profile_path(Profile.last) }
        it { should assign_to(:profile).with(Profile.last) }
        #it { should assign_to('profile.parent').with(parent) }
      end

      context 'invalid' do
        before do
          Profile.any_instance.stub(:valid?).and_return(false)
          post :create
        end
        it { should assign_to(:profile).with_kind_of(Profile) }
        #it { should assign_to('profile.parent').with(parent) }
        it { should render_template :new }
        it { should have_only_fractures :cancel_new_profile_link }
        it { should have_a_form.that_is_new.with_path_of(profiles_path)}
      end
    end

    describe 'GET edit' do
      before { get :edit, id: profile }

      it { should assign_to(:profile).with(profile) }
      it { should render_template :edit }
      it { should have_only_fractures :cancel_edit_profile_link }
      it { should have_a_form.that_is_edit.with_path_of(profile_path) }
    end

    describe 'PUT update' do
      context 'valid' do
        before do
          Profile.any_instance.stub(:valid?).and_return(true)
          put :update, id: profile
        end

        it { should assign_to(:profile).with(profile) }
        it { should redirect_to profile_path(profile) }
      end
      context 'invalid' do
        before do
          profile
          Profile.any_instance.stub(:valid?).and_return(false)
          put :update, id: profile
        end

        it { should assign_to(:profile).with(profile) }
        it { should render_template :edit }
        it { should have_only_fractures :cancel_edit_profile_link }
        it { should have_a_form.that_is_edit.with_path_of(profile_path) }
      end
    end

    describe 'DELETE destroy' do
      before { delete :destroy, id: profile }

      it { expect(Profile.find_by_id(profile.id)).to be_nil }
      it { should redirect_to profiles_path }
    end
  end
end
