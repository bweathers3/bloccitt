require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:my_question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: "false") }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do
         get :index
         expect(assigns(:questions)).to eq([my_question])
    end

  end


#########

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end


    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @questions" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end

  end

    ########

    describe "POST #create" do

          it "returns http success" do
          post :create, question: {title:"Test the Question title", body: "Test the Question body", resolved: "false"}
            expect(response).to have_http_status(302)
          end
    end


  describe "Question create" do

      it "increases the number of Question by 1" do
        expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: "false"}}.to change(Question, :count).by(1)
      end

      it "assigns the new question to @questions" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: "false"}
        expect(assigns(:question)).to eq Question.last
      end

  end
  #########




=begin
  #########

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  #########

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end



  end

  #########

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

#########

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
=end
end

=begin

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1) }











      describe "GET show" do
        it "returns http success" do
        # #16
          get :show, {id: my_advertisement.id}
          expect(response).to have_http_status(:success)
        end
        it "renders the #show view" do
        # #17
          get :show, {id: my_advertisement.id}
          expect(response).to render_template :show
        end

        it "assigns my_advertisement to @advertisement" do
          get :show, {id: my_advertisement.id}
        # #18
          expect(assigns(:advertisement)).to eq(my_advertisement)
        end
      end

end


=end
