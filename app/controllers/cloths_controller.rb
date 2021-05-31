class ClothsController < ApplicationController
    def new
        @cloth = current_user.cloths.build
    end

    def create
        @cloth = current_user.cloths.build(cloth_params)
        if @cloth.save
          flash[:success] = "洋服を登録しました！"
          redirect_to current_user
        else
          render 'static_pages/home'
        end
      end

    def destroy
        Cloth.find(params[:id]).destroy
        flash[:success] = "アイテム削除完了"
        redirect_to current_user
    end

    private

        def cloth_params
            params.require(:cloth).permit(:image, :name, :category_id)
        end
end
