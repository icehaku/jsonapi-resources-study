class Page < ApplicationRecord
  has_many :h1s
  has_many :h2s
  has_many :h3s
  has_many :urls

  validates :url_origin, presence: true

  after_save :fetch_url

  def build_json info
    return {}.to_json unless info.present?
    page_json  = Hash.new

    h1_array   = get_nodes "h1", info
    h2_array   = get_nodes "h2", info
    h3_array   = get_nodes "h3", info
    urls_array = get_url_nodes info

    page_json["h1s"]  = h1_array   if h1_array.present?
    page_json["h2s"]  = h2_array   if h2_array.present?
    page_json["h3s"]  = h3_array   if h3_array.present?
    page_json["urls"] = urls_array if urls_array.present?

    self.update_columns(values: page_json.to_json)
  end

  def save_nodes
    page_hash = JSON.parse self.values

    save_node page_hash,"H1", "h1s"
    save_node page_hash,"H2", "h2s"
    save_node page_hash,"H3", "h3s"
    save_node page_hash,"Url", "urls"

    self
  end

  private

  def fetch_url
    require 'open-uri'

    begin
      result = open(self.url_origin)
      result = Nokogiri::HTML(result)

      self.build_json(result)
      self
      self.save_nodes
    rescue StandardError => error
      #notify_rollbar(error) or something
      Rails.logger error
    end
  end

  def save_node page_hash, class_name, node
    klass = Object.const_get class_name

    if page_hash[node].present?
      page_hash[node].each do |obj|
        klass.create value: obj, page_id: self.id
      end
    end
  end

  def get_nodes dom, info
    array_info = []
    return array_info unless info.css(dom).present?

    info.css(dom).each do |obj|
      array_info << obj.text
    end

    array_info
  end

  def get_url_nodes info
    array_info = []
    return array_info unless info.css("a").present?

    info.css("a").each do |obj|
      array_info << obj.attributes["href"].value if obj.attributes["href"].present?
    end

    array_info
  end
end
