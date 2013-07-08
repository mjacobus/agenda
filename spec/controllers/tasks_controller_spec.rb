require 'spec_helper'

describe TasksController do
  render_views

  let(:valid_attributes) { attributes_for(:task) }
  let(:valid_session) { {} }
  let(:task) { create(:task) }

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      task # create task before test
      get :index, {}, valid_session
      assigns(:tasks).should eq([task])
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      get :show, {:id => task.to_param}, valid_session
      assigns(:task).should eq(task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      get :new, {}, valid_session
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      get :edit, {:id => task.to_param}, valid_session
      assigns(:task).should eq(task)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => valid_attributes}, valid_session
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes}, valid_session
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes}, valid_session
        response.should redirect_to(Task.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        # Trigger the behavior that occurs when invalid params are submitted
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => { "name" => "invalid value" }}, valid_session
        assigns(:task).should be_a_new(Task)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        task = Task.create! valid_attributes
        Task.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => task.to_param, :task => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested task as @task" do
        put :update, {:id => task.to_param, :task => valid_attributes}, valid_session
        assigns(:task).should eq(task)
      end

      it "redirects to the task" do
        put :update, {:id => task.to_param, :task => valid_attributes}, valid_session
        response.should redirect_to(task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        task = Task.create! valid_attributes
        Task.any_instance.stub(:save).and_return(false)
        put :update, {:id => task.to_param, :task => { "name" => "invalid value" }}, valid_session
        assigns(:task).should eq(task)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      task # create task
      expect {
        delete :destroy, {:id => task.to_param}, valid_session
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, {:id => task.to_param}, valid_session
      response.should redirect_to(tasks_url)
    end
  end

end
