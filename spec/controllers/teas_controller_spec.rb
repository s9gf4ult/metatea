require 'spec_helper'

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

describe TeasController do

  # This should return the minimal set of attributes required to create a valid
  # Tea. As you add validations to Tea, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TeasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  def self.logined_create
    before :each do
      @user = FactoryGirl.create :user
      sign_in @user
      @tea_attrs = FactoryGirl.attributes_for :tea, :user_id => @user.id
      @tea = Tea.create @tea_attrs
    end
  end

  def self.logined_build
    before :each do
      @user = FactoryGirl.create :user
      sign_in @user
      @tea_attrs = FactoryGirl.attributes_for :tea, :user_id => @user.id
      @tea = Tea.new @tea_attrs
    end
  end

  def self.different_user
    before :each do
      @new_user = FactoryGirl.create :user
      sign_out @user
      sign_in @new_user
    end
  end

  describe "GET index" do
    it "assigns all teas as @teas" do
      tea = FactoryGirl.create :tea
      get :index, {}, valid_session
      assigns(:teas).should eq([tea])
    end
  end

  describe "GET show" do
    it "assigns the requested tea as @tea" do
      tea = FactoryGirl.create :tea
      get :show, {:id => tea.to_param}, valid_session
      assigns(:tea).should eq(tea)
    end
  end

  describe "GET new" do
    it "fails not authenticated" do
      get :new, {}, valid_session
      expect(response).to redirect_to(new_user_session_url)
    end

    describe "when authenticated" do
      logined_build
      it "renders" do
        # logined_build
        get :new, {}
        assigns(:tea).should be_a_new(Tea)
      end
    end
  end

  describe "GET edit" do
    describe "when authenticated" do
      logined_create
      it "assigns the requested tea as @tea" do
        get :edit, {:id => @tea.to_param}
        assigns(:tea).should eq(@tea)
      end
    end

    describe "not authenticated" do
      it "redirect to login" do
        tea = FactoryGirl.create :tea
        get :edit, {:id => tea.to_param}
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "POST create" do
    it "fails when not authenticated" do
      tea = FactoryGirl.build :tea
      tea_attrs = tea.attributes.slice(*Tea.attr_accessible[:default])
      post :create, {:tea => tea_attrs}
      expect(response).to redirect_to(new_user_session_url)
    end

    describe "when authenticated" do
      logined_build

      describe "with valid params" do
        it "creates a new Tea" do
          expect {
            post :create, {:tea => @tea_attrs}
          }.to change(Tea, :count).by(1)
        end

        it "assigns a newly created tea as @tea" do
          post :create, {:tea => @tea_attrs}
          assigns(:tea).should be_a(Tea)
          assigns(:tea).should be_persisted
        end

        it "redirects to the created tea" do
          post :create, {:tea => @tea_attrs}
          response.should redirect_to(Tea.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved tea as @tea" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tea.any_instance.stub(:save).and_return(false)
          post :create, {:tea => {  }}
          assigns(:tea).should be_a_new(Tea)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tea.any_instance.stub(:save).and_return(false)
          post :create, {:tea => {  }}
          response.should render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    it "fail when not authenticated" do
      tea = FactoryGirl.create :tea
      put :update, {:id => tea.to_param, :tea => {:name => Faker::Lorem.words}}
      expect(response).to redirect_to(new_user_session_url)
    end

    describe "when authenticated" do
      logined_create

      describe "with different user" do
        different_user

        it "redirect to tea list" do
          put :update, {:id => @tea.to_param, :tea => {:name => "new name"}}
          expect(response).to redirect_to(teas_url)
        end

        it "do not modify" do
          put :update, {:id => @tea.to_param, :tea => {:name => "new name"}}
          assigns(:tea).should eq(@tea)
        end
      end

      describe "with valid params" do
        it "updates the requested tea" do
          # Assuming there are no other teas in the database, this
          # specifies that the Tea created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Tea.any_instance.should_receive(:update_attributes).with({ "name" => "new name" })
          put :update, {:id => @tea.to_param, :tea => { "name" => "new name" }}
        end

        it "assigns the requested tea as @tea" do
          put :update, {:id => @tea.to_param, :tea => @tea_attrs}
          assigns(:tea).should eq(@tea)
        end

        it "redirects to the tea" do
          put :update, {:id => @tea.to_param, :tea => @tea_attrs}
          response.should redirect_to(@tea)
        end
      end

      describe "with invalid params" do
        it "assigns the tea as @tea" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tea.any_instance.stub(:save).and_return(false)
          put :update, {:id => @tea.to_param, :tea => {  }}
          assigns(:tea).should eq(@tea)
        end

        it "re-renders the 'edit' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Tea.any_instance.stub(:save).and_return(false)
          put :update, {:id => @tea.to_param, :tea => {  }}
          response.should render_template("edit")
        end
      end
    end
  end

  describe "DELETE destroy" do
    describe "when not authenticated" do
      before :each do
        @tea = FactoryGirl.create :tea
      end

      it "redirect to login" do
        delete :destroy, {:id => @tea.to_param}
        expect(response).to redirect_to(new_user_session_url)
      end

      it "do not delete" do
        expect do
          delete :destroy, {:id => @tea.to_param}
        end.to_not change(Tea, :count)
      end
    end

    describe "when authenticated" do
      logined_create

      it "destroys the requested tea" do
        expect do
          delete :destroy, {:id => @tea.to_param}
        end.to change(Tea, :count).by(-1)
      end

      it "redirects to the teas list" do
        delete :destroy, {:id => @tea.to_param}
        response.should redirect_to(teas_url)
      end

      describe "with different user" do
        different_user

        it "do not delete" do
          expect do
            delete :destroy, {:id => @tea.to_param}
          end.to_not change(Tea, :count)
        end

        it "redirect to list" do
          delete :destroy, {:id => @tea.to_param}
          expect(response).to redirect_to(teas_url)
        end
      end
    end
  end
end
