module ApplicationHelper
  def github_url(username)
    "http://github.com/#{username}"
  end

  def badge_img(name, options = {})
    width = options.fetch(:width, '75px')
    height = options.fetch(:height, '75px')
    image_tag image_path("badges/#{name.parameterize}.png"), width: width, height: height
  end
end
