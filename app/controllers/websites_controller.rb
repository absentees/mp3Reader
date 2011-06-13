class WebsitesController < ApplicationController
  before_filter :authenticate_user!

  # GET /websites
  # GET /websites.xml
  def index
    @websites = current_user.feed.websites

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @websites }
    end
  end

  def crawl

    if params[:id] == "all"
      current_user.feed.websites.each do |site|
        site.crawl
      end
    else
      @website = Website.find(params[:id])
      @website.crawl
      if @website.links.count > 0
        redirect_to(@website, :notice => 'Link were successfully created.')
      else
        redirect_to(@website, :notice => 'No Links were successfully created.')
      end
    end
    redirect_to(root_path)
  end

  # GET /websites/1
  # GET /websites/1.xml
  def show
    @website = Website.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @website }
    end
  end

  # GET /websites/new
  # GET /websites/new.xml
  def new
    @website = Website.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website = Website.find(params[:id])
  end

  # POST /websites
  # POST /websites.xml
  def create
    @website = Website.new(params[:website])
    @website.feed = current_user.feed

    respond_to do |format|
      if @website.save
        format.html { redirect_to(@website, :notice => 'Website was successfully created.') }
        format.xml { render :xml => @website, :status => :created, :location => @website }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @website.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /websites/1
  # PUT /websites/1.xml
  def update
    @website = Website.find(params[:id])

    respond_to do |format|
      if @website.update_attributes(params[:website])
        format.html { redirect_to(@website, :notice => 'Website was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @website.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.xml
  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    respond_to do |format|
      format.html { redirect_to(websites_url) }
      format.xml { head :ok }
    end
  end
end
