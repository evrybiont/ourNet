class MusicController < ApplicationController
  before_action :authenticate_user!
end
