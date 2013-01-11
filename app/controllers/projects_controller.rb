class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
      format.json { render json: @project }
    end
  end

	def gallery
		@projects = Project.where("in_gallery > 0").order("in_gallery ASC")
    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
    end
	end	

	def list
		@projects = Project.all
		@projects_by_year = @projects.group_by do |p| 
			if p.start_date
				p.start_date.strftime("%Y") 
			else
				p.year
			end
		end
    respond_to do |format|
      format.html { render :layout => ! request.xhr? }
    end
	end	
		
  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

		unless params[:use_end_date] == "1"
			params[:project].delete_if{ |key, value| key.match(/^end_date/) }
			params[:project][:end_date] = nil;
		end

		@project.tags = [] # empty tags
		if params[:project][:tag_ids]
			params[:project][:tag_ids].each do |tag_id| 
				tag = Tag.find(tag_id)
				@project.tags << tag if tag	# add new tags
			end
			params[:project].delete(:tag_ids) # do not use in update_attributes below
		end

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
