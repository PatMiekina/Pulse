class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group.delete
  end

  private

  def group_params
    params.require(:group).permit(:name, :event_id)
  end

  def find_group
    @group = Group.find(params[:group])
  end
end
