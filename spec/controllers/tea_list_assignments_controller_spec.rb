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

describe TeaListAssignmentsController do

  before :each do
    @user = FactoryGirl.create :user
    sign_in @user
    @tea = FactoryGirl.create :tea
    @assign_attrs = FactoryGirl.attributes_for(:tea_list_assignment,
                                               :tea_id => @tea.id,
                                               :user_id => @user.id)
  end

  def self.other_user
    before :each do
      @new_user = FactoryGirl.create :user
      sign_out @user
      sign_in @new_user
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TeaListAssignment" do
        expect {
          post :create, {:tea_list_assignment => @assign_attrs}
        }.to change(TeaListAssignment, :count).by(1)
      end

      # it "appears in list" do
      #   post :create, {:tea_list_assignment => @assign_attrs}
      #   assigns(:teas).should

    end
  end

  describe "DELETE destroy" do
    before :each do
      @assign = TeaListAssignment.create @assign_attrs
    end

    it "destroys the requested tea_list_assignment" do
      expect {
        delete :destroy, {:id => @assign.to_param}
      }.to change(TeaListAssignment, :count).by(-1)
    end

    describe "when other user" do
      other_user
      it "do not destroy" do
        expect do
          delete :destroy, {:id => @assign.to_param}
        end.to_not change(TeaListAssignment, :count)
      end
    end
  end

end
