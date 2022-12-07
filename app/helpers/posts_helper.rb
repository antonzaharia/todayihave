module PostsHelper
  def parse_content_at_mentions(text)
    text.gsub(/@([a-zA-Z0-9_]+)/) do |match|
      user = User.find_by(username: Regexp.last_match(1))

      if user.present?
        link_to(match, users_path(user), style: "text-decoration: underline; color: hsl(var(--p));")
      else
        match
      end
    end
  end
end
