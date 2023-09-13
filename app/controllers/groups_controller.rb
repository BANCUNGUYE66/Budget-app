class GroupsController < ApplicationController
    def index
      @categories = current_user.groups.order(created_at: :desc)
    end
  
    def new; end
  
    def create
      @group = current_user.groups.new(group_params)
      if @group.save
        redirect_to groups_path, notice: 'Category created successfully'
      else
        redirect_to new_group_path, alert: 'Oops, something went wrong'
      end
    end
  
    def login_page; end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :icon)
    end
  end
  