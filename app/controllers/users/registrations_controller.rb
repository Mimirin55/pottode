class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path, status: :see_other
  end
end
