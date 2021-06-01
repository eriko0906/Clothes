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
          render new_cloth_path
        end
    end

    def edit
        @cloth = Cloth.find(params[:id])
    end

    def update
        @cloth = Cloth.find(params[:id])
        if @cloth.update(cloth_params)
            flash[:success] = "アイテム編集完了！"
            redirect_to @cloth.user
        else
            render "edit"
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
