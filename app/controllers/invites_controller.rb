class InvitesController < ApplicationController
  before_action :find_invite, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:join_event]

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

  def join_event
    @group = Group.new
    @group.event = @event
    @group.owner = current_user
    @group.name = "#{current_user.username}'s Group"

    @group.save

    @invite = Invite.new
    @invite.owner = current_user
    @invite.attendee = current_user
    @invite.group = @group
    @invite.message = "Welcome to #{@event.name}"
    @invite.confirmed = true

    if @invite.save
      redirect_to group_path(@group)
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:attendee_id, :group_id, :message, :wishlist, :confirmed)
  end

  def find_invite
    @invite = Invite.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event])
  end
end
