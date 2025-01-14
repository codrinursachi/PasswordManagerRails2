class PasswordsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    render exception
    #redirect_to '/login'
  end
  # GET /passwords or /passwords.json
  def index
    if params[:query]
      @passwords = @passwords.select { |password| params[:query].split.all? { |word| password.url.include?(word)||password.username.include?(word) ||password.category_path.include?(word)||password.tags.include?(word)||password.notes.include?(word)} }
    end
    if params[:category]
      @passwords = @passwords.select { |password| password.category_path.include?(params[:category]) }
    end
    if params[:favorite]
      @passwords = @passwords.select { |password| password.favorite }
    end
    @passwords = @passwords.select { |password| password.database_id == session[:current_database_id] }
  end

  # GET /passwords/1 or /passwords/1.json
  def show
  end

  # GET /passwords/new
  def new
    @password = Password.new(database_id: session[:current_database_id])
  end

  # GET /passwords/1/edit
  def edit
  end

  # POST /passwords or /passwords.json
  def create
    @password = Password.new(password_params)
    @password.database_id = session[:current_database_id]
    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: "Password was successfully created." }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passwords/1 or /passwords/1.json
  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to @password, notice: "Password was successfully updated." }
        format.json { render :show, status: :ok, location: @password }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1 or /passwords/1.json
  def destroy
    @password.destroy!

    respond_to do |format|
      format.html { redirect_to passwords_path, status: :see_other, notice: "Password was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def password_params
      params.expect(password: [ :url, :username, :password, :expiration_date, :category_path, :tags, :favorite, :notes, :database_id ])
    end
end
