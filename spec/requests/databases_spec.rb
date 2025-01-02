require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/databases", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Database. As you add validations to Database, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Database.create! valid_attributes
      get databases_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      database = Database.create! valid_attributes
      get database_url(database)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_database_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      database = Database.create! valid_attributes
      get edit_database_url(database)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Database" do
        expect {
          post databases_url, params: { database: valid_attributes }
        }.to change(Database, :count).by(1)
      end

      it "redirects to the created database" do
        post databases_url, params: { database: valid_attributes }
        expect(response).to redirect_to(database_url(Database.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Database" do
        expect {
          post databases_url, params: { database: invalid_attributes }
        }.to change(Database, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post databases_url, params: { database: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested database" do
        database = Database.create! valid_attributes
        patch database_url(database), params: { database: new_attributes }
        database.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the database" do
        database = Database.create! valid_attributes
        patch database_url(database), params: { database: new_attributes }
        database.reload
        expect(response).to redirect_to(database_url(database))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        database = Database.create! valid_attributes
        patch database_url(database), params: { database: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested database" do
      database = Database.create! valid_attributes
      expect {
        delete database_url(database)
      }.to change(Database, :count).by(-1)
    end

    it "redirects to the databases list" do
      database = Database.create! valid_attributes
      delete database_url(database)
      expect(response).to redirect_to(databases_url)
    end
  end
end