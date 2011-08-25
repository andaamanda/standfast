module ApplicationHelper
  def s3_url(path)
    "http://standfast-usa.s3.amazonaws.com/#{path}"
  end
end
