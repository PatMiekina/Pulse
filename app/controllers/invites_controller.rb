class InvitesController < ApplicationController
  before_action :find_invite, only: [:show, :edit, :update, :destroy]

  def index
    @invites = Invite.all
  end

  def show
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.owner = current_user
    if @invite.save
      redirect_to invite_path(@invite)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @invite.update(invite_params)
    if @invite.save
      redirect_to invite_path(@invite)
    else
      render :edit
    end
  end

  def destroy
    @invite.delete
  end

  private

  def invite_params
    params.require(:invite).permit(:attendee_id, :group_id, :message, :wishlist, :confirmed)
  end

  def find_invite
    @invite = Invite.find(params[:invite])
  end
end
