class ArticlesController < ApplicationController
  include Godmin::Resources::ResourceController

  private

  def resource_params
    params.require(:article).permit(:title, :body, :author_id, :published, :published_at)
  end

  def redirect_after_batch_action_unpublish
    articles_path(scope: :unpublished)
  end

  def redirect_after_batch_action_publish
    articles_path(scope: :published)
  end
end
