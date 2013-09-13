require 'factory_girl'
require 'factory_girl_rails'
require 'spec_helper'

describe CallsController do

  # This should return the minimal set of attributes required to create a valid
  # Call. As you add validations to Call, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "dpto_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "#Close" do
    context 'when successful closes a call' do
      before {
        @call = FactoryGirl.create(:call, technical_id: 1)
        get :close, {:id => @call.to_param}, valid_session
      }
      it { response.status.should eq 200 }
      specify { @call.technical_id.should_not be_nil }
    end

    describe "redirects to #close if there's no service described" do
      before {
        @call = FactoryGirl.create(:call, obs: "valid")
        post :done, {:id => @call.to_param, :call => @call}, valid_session
      }
      specify { @call.service.should eq nil}
      specify { @call.obs.should_not eq nil}
      it { should redirect_to action: :close, id: @call.to_param }
    end

    describe "redirects to #close if there's no obs described" do
      before {
        @call = FactoryGirl.create(:call, service: "valid")
        post :done, {:id => @call.to_param, :call => @call}, valid_session
      }
      specify { @call.service.should_not eq nil}
      specify { @call.obs.should eq nil}
      it { should redirect_to action: :close, id: @call.to_param }
    end
  end

  describe "GET index" do
    context "assigns all calls as @calls" do
      before {
        @call = FactoryGirl.create(:call)
        get :index, {}, valid_session
      }
      it { assigns(:calls).should eq([@call]) }
      specify { @call.technical_id.should be_nil }
    end
  end

  describe "GET show" do
    it "assigns the requested call as @call" do
      call = FactoryGirl.create(:call)
      get :show, {:id => call.to_param}, valid_session
      assigns(:call).should eq(call)
    end
  end

  describe "GET new" do
    it "assigns a new call as @call" do
      get :new, {}, valid_session
      assigns(:call).should be_a_new(Call)
    end
  end

  describe "GET edit" do
    it "assigns the requested call as @call" do
      call = FactoryGirl.create(:call)
      get :edit, {:id => call.to_param}, valid_session
      assigns(:call).should eq(call)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before(:each) { @call = FactoryGirl.attributes_for(:call) }
      it "creates a new Call" do
        expect {
          post :create, {:call => @call}, valid_session
        }.to change(Call, :count).by(1)
      end      

      it "assigns a newly created call as @call" do
        post :create, {:call => @call}, valid_session
        assigns(:call).should be_a(Call)
        assigns(:call).should be_persisted
      end

      it "redirects to the created call" do
        post :create, {:call => @call}, valid_session
        response.should redirect_to(Call.last)
      end
    end

    describe "with invalid params" do
      before(:each) { @call = FactoryGirl.attributes_for(:call, {:id => "invalid value"}) }
      it "assigns a newly created but unsaved call as @call" do
        # Trigger the behavior that occurs when invalid params are submitted
        Call.any_instance.stub(:save).and_return(false)
        post :create, {:call => @call}, valid_session
        assigns(:call).should be_a_new(Call)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Call.any_instance.stub(:save).and_return(false)
        post :create, {:call => @call}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) {@call = FactoryGirl.create(:call)}
      it "updates the requested call" do
        # Assuming there are no other calls in the database, this
        # specifies that the Call created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Call.any_instance.should_receive(:update).with({ "dpto_id" => "1" })
        put :update, {:id => @call.to_param, :call => { "dpto_id" => "1" }}, valid_session
      end

      it "denies update service field" do

      end

      it "assigns the requested call as @call" do
        put :update, {:id => @call.to_param, :call => FactoryGirl.attributes_for(:call)}, valid_session
        assigns(:call).should eq(@call)
      end

      it "redirects to the call" do
        put :update, {:id => @call.to_param, :call => FactoryGirl.attributes_for(:call)}, valid_session
        response.should redirect_to(@call)
      end
    end

    describe "with invalid params" do
      before(:each) {@call = FactoryGirl.create(:call)}
      it "assigns the call as @call" do
        # Trigger the behavior that occurs when invalid params are submitted
        Call.any_instance.stub(:save).and_return(false)
        put :update, {:id => @call.to_param, :call => FactoryGirl.attributes_for(:call, { "dpto_id" => "invalid value" })}, valid_session
        assigns(:call).should eq(@call)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Call.any_instance.stub(:save).and_return(false)
        put :update, {:id => @call.to_param, :call => FactoryGirl.attributes_for(:call, { "dpto_id" => "invalid value" })}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) {@call = FactoryGirl.create(:call)}
    it "destroys the requested call" do
      expect {
        delete :destroy, {:id => @call.to_param}, valid_session
      }.to change(Call, :count).by(-1)
    end

    it "redirects to the calls list" do
      delete :destroy, {:id => @call.to_param}, valid_session
      response.should redirect_to(calls_url)
    end
  end

end
