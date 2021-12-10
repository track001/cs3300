require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Title i.e.", description: "Descriptor i.e.") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end

  context "GET #new" do
    login_user
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end
  end

  context "POST #projects" do
    login_user
    it "returns a success response" do
      post :create, :params => { :project => { :title => "Some Name" , :description => "Some Name" } }
      expect(Project.count).to eq(1)
    end
  end

  context "POST #projects" do
  login_user
  it "returns a bad response" do
    post :create, :params => { :project => { :title => "" , :description => "Some Name" } }
    expect(Project.count).to eq(0)
  end
end

  context "PATCH #projects/1" do
    login_user
    let!(:project) { Project.create(title: "Title i.e.", description: "Example") }
    it "returns a success response" do
      patch :update, :params => { :id => project, :project => { :title => "Title i.e.",  :description => "Test" }} #project: project, body: "new body"}
      expect(Project.first.title).to eq "Title i.e."
    end
  end

  context "PATCH #projects/1" do
  login_user
  let!(:project) { Project.create(title: "Title i.e.", description: "Example") }
  it "returns a failure response" do
    patch :update, :params => { :id => project, :project => { :title => "", :description => "Test" }} #project: project, body: "new body"}
    expect(Project.first.description).to eq "Example"
  end
end

  context "DELETE #projects/1" do
    login_user
    let!(:project) { Project.create(title: "Title i.e.", description: "Descriptor i.e.") }
    it "Project deleted." do
      expect(Project.count).to eq(1)
      delete :destroy, :params => { :id => project }
      expect(Project.count).to eq(0)
    end
    it "Project deleted." do
    end
  end

  context "PATCH #projects/2" do
  login_user
  let!(:project) { Project.create(title: "Title i.e.", description: "Example") }
  it "returns a failure response" do
    patch :update, :params => { :id => project, :project => { :title => "", :description => "Test" }} #project: project, body: "new body"}
    expect(Project.first.description).to eq "Example"
  end
end

  context "DELETE #projects/2" do
    login_user
    let!(:project) { Project.create(title: "Title i.e.", description: "Descriptor i.e.") }
    it "Project deleted." do
      expect(Project.count).to eq(1)
      delete :destroy, :params => { :id => project }
      expect(Project.count).to eq(0)
    end
    it "Project deleted." do
    end
  end

  context "PATCH #projects/3" do
  login_user
  let!(:project) { Project.create(title: "Title i.e.", description: "Example") }
  it "returns a failure response" do
    patch :update, :params => { :id => project, :project => { :title => "", :description => "Test" }} #project: project, body: "new body"}
    expect(Project.first.description).to eq "Example"
  end
end

  context "DELETE #projects/3" do
    login_user
    let!(:project) { Project.create(title: "Title i.e.", description: "Descriptor i.e.") }
    it "Project deleted." do
      expect(Project.count).to eq(1)
      delete :destroy, :params => { :id => project }
      expect(Project.count).to eq(0)
    end
    it "Project deleted." do
    end
  end

  require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the description is present" do
      project = Project.new(title: "Title")
      expect(project.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end

end