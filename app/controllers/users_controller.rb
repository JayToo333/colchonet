class UsersController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #redirect_to @user, notice: "Cadastro criado com sucesso!"
      return "User created " "#{@user[:full_name]}" "with id " "#{@user[:id]}"
    else
      #render :new, status: :unprocessable_entity
      return "Error creating user " "#{@user[:full_name]}" "with id " "#{@user[:id]}"
    end
  end

  def show
    @user = User.find(@user[:id])
  end

  def edit
    @user = User.find(@user[:id])
  end
  
  def update
    @user = User.find(@user[:id])
    if @user.update(updates)
      return "User updated " "#{@user[:full_name]}" "with id " "#{@user[:id]}" "updated to " "#{updates}"
    else
      return "Error updating user: " "#{@user[:full_name]}" "with id " "#{@user[:id]}" "updated to " "#{updates}"
    end
  end

  def user_params
   {
    full_name: "a",
    email: "a10@gmail.com",
    location: "a",
    password: "a",
    password_confirmation: "a",
    bio: "1234567890123456789012345678901234567890"
  }
  end
  
  def updates
   {
    full_name: "b",
    email: "b10@gmail.com",
    location: "b",
    password: "b",
    password_confirmation: "b",
  }
  end
end

# private
#  def user_params
#     params.require(:user).permit(
#       :full_name,
#       :location,
#       :password,
#       :password_confirmation,
#       :bio
#       )
#   end
# end