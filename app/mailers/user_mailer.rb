class UserMailer < ApplicationMailer
  def comment_mail(id, movie)
    @user = User.find(id)
    mail(to: @user.email, subject: "Thanks for commenting on #{movie.title}")
  end
end
