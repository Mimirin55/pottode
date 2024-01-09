class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    soft_delete(current_user)
    respond_with_navigational do
      sign_out current_user
      redirect_to root_path
    end
  end

  private

  def soft_delete(user)
    deleted_email = user.email + '_deleted_' + Time.current.to_i.to_s
    user.assign_attributes(email: deleted_email, deleted_at: Time.current)
    user.skip_email_changed_notification!
    user.save
  end
end