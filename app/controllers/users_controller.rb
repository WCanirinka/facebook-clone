# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    user = User.new(name: params[:user][:name])
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    session[:user_id] = user.id
    redirect_to hello_path
  end
end
