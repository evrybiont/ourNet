class ChopsController < ApplicationController
  layout 'profile'
  before_action :authenticate_user!

  def index
    load_chops
    respond_formats
  end

  def new
    @chop = Chop.new
    @chop.images.build
    respond_formats
  end

  def create
    @chop = current_user.chops.build chop_params
    if @chop.save
      flash.now[:success] = 'Chop has successfully created'
    else
      flash.now[:error] = 'Apply some photos to chop!'
    end
    respond_formats
  end

  def show
    load_chop
    respond_formats
  end

  def edit
    load_chop
    respond_formats
  end

  def update
    if load_chop.update chop_params
      check_visible
      flash.now[:success] = 'Chop has successfully updated'
    end
    load_chops
    respond_formats
  end

  def destroy
    if load_chop.try(:destroy)
      flash.now[:success] = 'Chop has successfully removed'
    end
    load_chops
    respond_formats
  end

  private

  def chop_params
    rebuild_params
    params.require(:chop).permit(
      :name,
      :description,
      :new_images,
      :slug,
      images_attributes: [:id, :data, :title, :description, :_destroy]
    )
  end

  def rebuild_params
    result = {}
    data = get_images || []
    data.each_with_index do |v,i|
      i += images_size if params[:chop][:new_images]
      result[i.to_s] = {title: '', data: v}
    end
    params[:chop].merge!(images_attributes: {}) unless params[:chop][:images_attributes]
    params[:chop][:images_attributes].merge!(result)
    params[:chop].merge!(slug: params[:chop][:name].gsub(' ', '-'))
  end

  def get_images
    if params[:chop][:new_images]
      params[:chop][:new_images]
    elsif params[:chop][:images_attributes]
      params[:chop][:images_attributes]['0'][:data]
    end
  end

  def images_size
    params[:chop][:images_attributes].try(:size) || 0
  end

  def load_chops
    @chops = current_user.chops.order(created_at: :asc)
  end

  def load_chop
    @chop = Chop.friendly.find params[:id]
  end

  def check_visible
    @chop.update_attribute(:visible, false) if @chop.images.blank?
  end
end
