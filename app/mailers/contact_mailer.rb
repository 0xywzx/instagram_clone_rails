class ContactMailer < ApplicationMailer
  def contact_mail(main, email)
   @main = main
   @email = email
   mail to: @email , subject: "投稿の確認メール"
  end
end
