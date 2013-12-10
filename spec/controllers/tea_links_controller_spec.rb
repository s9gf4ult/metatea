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

describe TeaLinksController do
  before :each do
    @user = FactoryGirl.create :user
    @tea_link_attrs = FactoryGirl.attributes_for(:tea_link,
                                                 :user_id => @user.id)
    sign_in @user
  end

  describe "GET new" do
    it "assigns a new tea_link as @tea_link" do
      get :new, {}
      assigns(:tea_link).should be_a_new(TeaLink)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TeaLink" do
        expect {
          post :create, {:tea_link => @tea_link_attrs}
        }.to change(TeaLink, :count).by(1)
      end

      it "assigns a newly created tea_link as @tea_link" do
        post :create, {:tea_link => @tea_link_attrs}
        assigns(:tea_link).should be_a(TeaLink)
        assigns(:tea_link).should be_persisted
      end

      it "redirects to the tea" do
        tea = Tea.find @tea_link_attrs[:tea_id]
        post :create, {:tea_link => @tea_link_attrs}
        response.should redirect_to(tea)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tea_link as @tea_link" do
        # Trigger the behavior that occurs when invalid params are submitted
        TeaLink.any_instance.stub(:save).and_return(false)
        post :create, {:tea_link => {  }}
        assigns(:tea_link).should be_a_new(TeaLink)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TeaLink.any_instance.stub(:save).and_return(false)
        post :create, {:tea_link => {  }}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    def self.can_destroy
      it "destroys the requested tea_link" do
        expect {
          delete :destroy, {:id => @tea_link.to_param}
        }.to change(TeaLink, :count).by(-1)
      end

      it "redirects to the tea" do
        tea = @tea_link.tea
        delete :destroy, {:id => @tea_link.to_param}
        response.should redirect_to(tea)
      end
    end

    def self.can_not_destroy
      it "doesnt destroy" do
        expect do
          delete :destroy, {:id => @tea_link.to_param}
        end.to_not change(TeaLink, :count)
      end

      it "redirects to tea" do
        tea = @tea_link.tea
        delete :destroy, {:id => @tea_link.to_param}
        response.should redirect_to(tea)
      end
    end

    before :each do
      @tea_link = TeaLink.create @tea_link_attrs
    end

    describe "if i am link owner" do
      can_destroy
    end

    describe "if i am tea owner" do
      before :each do
        @new_user = @tea_link.tea.user
        sign_out @user
        sign_in @new_user
      end

      can_destroy
    end

    describe "if i am other user" do
      before :each do
        @new_user = FactoryGirl.create :user
        sign_out @user
        sign_in @new_user
      end

      can_not_destroy
    end
  end

end