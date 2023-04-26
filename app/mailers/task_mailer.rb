class TaskMailer < ApplicationMailer
  default form: 'genbatodo@example.com'

  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール',
      to: 'user@example.com',
      from: 'genbatodo@example.com'
    )
  end
end

