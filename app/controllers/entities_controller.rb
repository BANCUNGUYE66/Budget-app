class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(group_id: params[:group_id]).order(created_at: :desc)
    @group = Group.where(id: params[:group_id]).take
  end

  def new; end

  def create
    @entity = current_user.entities.new(entity_params)
    if @entity.save
      redirect_to group_entities_path(group_id: entity_params[:group_id]), notice: 'Entity created successfully'
    else
      redirect_to new_group_entity_path, alert: 'Oops, something went wrong'
    end
  end

  private

  def entity_params
    params.required(:entity).permit(:name, :amount, :group_id)
  end
end
