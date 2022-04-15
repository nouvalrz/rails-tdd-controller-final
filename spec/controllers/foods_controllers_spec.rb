require 'rails_helper'

RSpec.describe FoodsController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of foods starting with the letter" do
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kerak Telor")

        get :index, params: { letter: "N" }
        expect(assigns(:foods)).to match_array([nasi_uduk])
      end
      it "renders the :index template" do
        get :index, params: {letter: "N"}
        expect(assigns(:foods)).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all foods" do
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kelar Telor")
        get :index
        expect(assigns(:foods)).to match_array([nasi_uduk, kerak_telor])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :show, params: { id: food }
      expect(assigns(:food)).to eq food
    end
    it "renders the :show template" do
      get :show
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Food to @food" do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :edit, params: { id: food }
      expect(assigns(:food)).to eq food
    end
    it "renders the :edit template" do
      food = create(:food)
      get :edit, params: { id: food }
      expect(response).to render_template :edit
    end
  end


end