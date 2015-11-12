class ArticleService
  include Godmin::Resources::ResourceService

  attrs_for_index :title, :author, :published_at 
  attrs_for_show :title, :body, :author, :published, :published_at 
  attrs_for_form :title, :body, :author, :published, :published_at 
  attrs_for_export :id, :title, :author, :published, :published_at

  scope :unpublished
  scope :published

  def scope_unpublished(articles)
    articles.where(published: false)
  end

  def scope_published(articles)
    articles.where(published: true)
  end

  filter :title
  filter :author

  def filter_title(articles, value)
    articles.where(title: value)
  end

  def filter_author(articles, value)
    articles.where(author: "#{value}")
  end

  batch_action :unpublish, except: [:unpublished]
  batch_action :publish, except: [:published]
  batch_action :destroy, confirm: true

  def batch_action_unpublish(articles)
    articles.each { |a| a.update(published: false) }
  end

  def batch_action_publish(articles)
    articles.each { |a| a.update(published: true) }
  end

  def batch_action_destroy(articles)
    articles.each { |a| a.destroy }
  end
end
