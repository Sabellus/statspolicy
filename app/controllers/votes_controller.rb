class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    # @voter = Voter.new
    # @voteMany = []
    # 5.times do
    #   @voteMany << Vote.new
    # end
    # voter = Voter.new
    # @vote.voter = voter
    # @vote.build_voter
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    # puts ["last_name" => vote_params.dup[:voter_attributes][:last_name],"sex" => vote_params.dup[:voter_attributes][:sex], "age" => vote_params.dup[:voter_attributes][:age] ]
    # @vote = Vote.new(vote_params.merge(:voter_attributes => {"last_name" => vote_params.dup[:voter_attributes][:last_name],"sex" => vote_params.dup[:voter_attributes][:sex], "age" => vote_params.dup[:voter_attributes][:age].to_i}))
    # @voter = Voter.new(voter_params.merge(age: voter_params[:age].to_i))
    # @voter = Voter.create(voter_params(params["voter"]).merge(age: voter_params(params["voter"])[:age].to_i))
    # # @voter = Voter.new(voter_params.merge(age: voter_params[:age].to_i))
    # params["voteMany"].each do |vote|

    #   @vote = Vote.create(vote_params(vote).merge(voter_id: @voter.id))
    #   puts vote_params(vote).merge(voter_id: @voter.id)
    # end
    # vote_params(params)
    interview = Interview.find(params[:interview_id])

    Voter.transaction do
      voter = Voter.new(voter_params)
      voter.save

      vote_params[:politicians].each_with_index do |politician_id, idx|
        vote = Vote.new(politician_id: politician_id, vote: idx + 1)
        vote.voter = voter
        vote.interview = interview
        vote.save
      end
    end

    redirect_to interview_path(interview), notice: 'Vote was successfully created.'

    # @vote = Vote.new(vote_params)

    # respond_to do |format|
    #   if @vote.save
    #     format.html { redirect_to interview_path(@interview), notice: 'Vote was successfully created.' }
    #     format.json { render :show, status: :created, location: @vote }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @vote.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end
    def voter_params
      params.require(:voter).permit(:last_name, :sex, :age)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      # params.require(:vote).permit(:vote, :politician_id, :interview_id, voter_attributes: [ :last_name, :sex, :age ])
      params.require(:vote).permit(politicians: [])
    end
end
