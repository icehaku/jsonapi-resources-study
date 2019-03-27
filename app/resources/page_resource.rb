class PageResource < JSONAPI::Resource
  attributes :url_origin, :values

  has_many :h1s
  has_many :h2s
  has_many :h3s
  has_many :urls
end
