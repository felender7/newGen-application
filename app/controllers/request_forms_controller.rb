class RequestFormsController < ApplicationController
  before_action :set_request_form, only: [:show, :edit, :update, :destroy]

  # GET /request_forms
  # GET /request_forms.json
  def index
    @request_forms = RequestForm.all
  end

  # GET /request_forms/1
  # GET /request_forms/1.json
  def show
  end

  # GET /request_forms/new
  def new
    @request_form = RequestForm.new
  end

  # GET /request_forms/1/edit
  def edit
  end

  # POST /request_forms
  # POST /request_forms.json
  def create
    @request_form = RequestForm.new(request_form_params)

    respond_to do |format|
      if @request_form.save
        format.html { redirect_to @request_form, notice: 'Request form was successfully created.' }
        format.json { render :show, status: :created, location: @request_form }
      else
        format.html { render :new }
        format.json { render json: @request_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_forms/1
  # PATCH/PUT /request_forms/1.json
  def update
    respond_to do |format|
      if @request_form.update(request_form_params)
        format.html { redirect_to @request_form, notice: 'Request form was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_form }
      else
        format.html { render :edit }
        format.json { render json: @request_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_forms/1
  # DELETE /request_forms/1.json
  def destroy
    @request_form.destroy
    respond_to do |format|
      format.html { redirect_to request_forms_url, notice: 'Request form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_form
      @request_form = RequestForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_form_params
      params.require(:request_form).permit(:first_name, :last_name, :phone, :email)
    end
end
