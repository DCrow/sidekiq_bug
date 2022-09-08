class TestJob
  include Sidekiq::Job

  sidekiq_options queue: "default",
    retry: false,
    lock: :until_and_while_executing,
    log_duplicate: true,
    on_conflict: :log

  def perform
    p "Test start"
    sleep(60)
    p "Test end"
  end
end
