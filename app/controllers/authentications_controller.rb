# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  def create
    user_autnehticated = User.authenticate(params[:user][:email], params[:user][:password])
    if user_autnehticated.last
      AuthenticationService.reset_attempts(user_autnehticated.first)
      session[:user_id] = user_autnehticated.first.id
      redirect_to root_url, notice: I18n.t(:logged_in, scope: [:create, :confirmation])
    else
      # Increment user login attempts
      AuthenticationService.login_failed_attempt(user_autnehticated.first)

      if AuthenticationService.verify_block_account(user_autnehticated.first)
        redirect_to root_path, notice: I18n.t(:blocked, scope: [:create, :confirmation])
      else
        redirect_to sign_in_path, notice: I18n.t(:invalid, scope: [:create, :confirmation])
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: I18n.t(:logged_out, scope: [:create, :confirmation])
  end
end
