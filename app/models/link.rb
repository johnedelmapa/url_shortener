class Link < ApplicationRecord
  # auto slug generation
  before_validation :generate_slug
  # default_scope -> { order('created_at DESC')}
  
  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if self.slug.nil? || self.slug.empty?
    true
  end
  
  # fast access to the shortened link
  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end
  
  # the API
  def self.shorten(url, title = '')   
    link = Link.new(url: url, title: title)
    return link.short if link.save
  end
end
