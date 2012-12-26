require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { client: @project.client, description_long_de: @project.description_long_de, description_long_en: @project.description_long_en, description_short_de: @project.description_short_de, description_short_en: @project.description_short_en, in_gallery: @project.in_gallery, location: @project.location, slug: @project.slug, time: @project.time, title_de: @project.title_de, title_en: @project.title_en, website: @project.website }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { client: @project.client, description_long_de: @project.description_long_de, description_long_en: @project.description_long_en, description_short_de: @project.description_short_de, description_short_en: @project.description_short_en, in_gallery: @project.in_gallery, location: @project.location, slug: @project.slug, time: @project.time, title_de: @project.title_de, title_en: @project.title_en, website: @project.website }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
