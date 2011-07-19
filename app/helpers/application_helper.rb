module ApplicationHelper
  def s3_url(path)
    "http://standfast.s3.amazonaws.com/#{path}"
  end
end
