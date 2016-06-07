class CreateAdminService
  def call
    user = User.find_or_create_by!(email: 'pelayo.mao@gmail.com') do |user|
        user.password = '12341234'
        user.password_confirmation = '12341234'
        user.confirm!
        user.admin!
      end
  end
end
