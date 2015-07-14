module Shortener::ShortenerHelper
  # generate a url from a url string
  def short_url(url, owner = nil)
    short_url = Shortener::ShortenedUrl.generate(url, owner)
    if short_url
      url_options = {
        controller: :"shortener/shortened_urls",
        action:     :show,
        id:         short_url.unique_key,
        only_path:  false
      }
      url_options[:host] = Shortener.url_options[:host] if Shortener.url_options[:host].present?
      url_options[:protocol] = Shortener.url_options[:protocol] if Shortener.url_options[:protocol].present?

      url_for(url_options)
    else
      url
    end
  end
end
