class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_contacts, only:[:show]
  before_action :counts, only:[:index]
  before_action :contct_groups, only:[:index]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.paginate(:page => params[:page], per_page: 20).order('full_name ASC')
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  def import
    Contact.import(params[:file], current_user)
    redirect_to contacts_url, notice: 'Contact was successfully imported.'
  end
  # GET /contacts/new
  def new
    @contact = current_user.contacts.build
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts .build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:full_name,  :phone, :email, :group, :avator)
    end

    def correct_user # check if the user is authorised to edit,update or destroy the pin
      @contacts = current_user.contacts.find_by(id: params[:id])
      redirect_to contacts_path, notice: "Not authorised to edit this contact" if @contacts.nil?
    end


    def current_user_contacts
      if user_signed_in?
       @contacts = current_user.contacts.order("created_at DESC")
      end
    end

    def counts
      @contacts_counts = current_user.contacts.all.count
      @contacts_count_friends = current_user.contacts.all.where(group: 'Friends').count
      @contacts_count_family = current_user.contacts.all.where(group: 'Family').count
      @contacts_count_co_workers = current_user.contacts.all.where(group: 'Co-workers').count
    end

    def contct_groups
        @contacts_group_friends = Contact.where(group: 'Friends').all.order('full_name ASC')
        @contacts_group_family = current_user.contacts.where(group: 'Family').all.order('full_name ASC')
        @contacts_group_co_workers = Contact.where(group: 'Co-workers').all.order('full_name ASC')
    end
end
