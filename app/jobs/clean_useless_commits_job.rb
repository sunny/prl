class CleanUselessCommitsJob < ApplicationJob
  queue_as :default

  def perform
    commons = [
      "merge master",
      "merge",
      "merged",
      ".",
      "done",
      "ok",
      "Add dotenv - Protect my secret data in .env file",
      "fix",
      "seed",
      "navbar",
      "pull",
      "merging",
      "test",
      "Initial commit with devise template from https://github.com/lewagon/rails-templates",
      "Initial commit with minimal template from https://github.com/lewagon/rails-templates",
      "fixed",
      "changes",
      "update",
      "commit",
      "resolve merge",
      "not done",
      "Done",
      "changes complete",
      "Merge branch%"
    ]
    Commit.where("message ILIKE ANY (array[?])", commons).destroy_all
  end
end
