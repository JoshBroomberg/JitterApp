module HashtagsHelper
  def linkify_hashtags(hashtaggable_content)
    regex = SimpleHashtag::Hashtag::HASHTAG_REGEX
    hashtagged_content = hashtaggable_content.to_s.gsub(regex) do
      link_to($&, hashtag_path($2), {class: :hashtag})
    end
    hashtagged_content.html_safe
  end

  def render_hashtaggable(hashtaggable)
    klass        = hashtaggable.class.to_s.underscore
    view_dirname = klass.pluralize
    partial      = klass
    render "#{view_dirname}/#{partial}", {klass.to_sym => hashtaggable}
  end

  def auto_link_usernames(text)
      names = text.gsub /@(\w+)/ do |username|
      user = User.where(username: username.gsub('@', '')).first
      if user!=nil
        link_to(username, profile_path(user.profile))
      else
        username
      end
    end
    names.html_safe
   
  end



end
