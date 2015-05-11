class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all

    respond_to do |format|
      format.html {}
      format.json { render json: @trainers }
    end
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to trainers_path
    else
      render :index
    end
  end

  def show
    @trainer = Trainer.find(params[:id])

    respond_to do |format|
      format.html {}
      format.json { render json: @trainer}
    end
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.find(params[:id])

    @trainer.update(trainer_params)

    respond_to do |format|
      format.html { redirect_to trainer_path(@trainer.id)}
      format.json { render json: @trainer }
    end
  end

  def add_pokemon
    trainer = Trainer.find(params[:id])
    pokemon = Pokemon.find(params[:pokemon_id])

    trainer.add_pokemon(pokemon)

    respond_to do |format|
      format.html { redirect_to trainer_path(trainer) }
      format.json { render json: @trainer }
    end
  end

  def remove_pokemon
    trainer = Trainer.find(params[:id])
    pokemon = Pokemon.find(params[:pokemon_id])
    
    trainer.remove_pokemon(pokemon)

    respond_to do |format|
      format.html { redirect_to trainer_path(trainer) }
      format.json { render json: @trainer }
    end
  end

  private
  def trainer_params
    params.require(:trainer).permit(:username, :password, :password_confirmation, :image_url, :safari_balls)
  end
end