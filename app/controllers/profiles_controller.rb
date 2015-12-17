class ProfilesController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!
end
