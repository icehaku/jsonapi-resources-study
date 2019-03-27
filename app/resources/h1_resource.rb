class H1Resource < JSONAPI::Resource
  attributes :value

  has_one :page

  filter :page
end
