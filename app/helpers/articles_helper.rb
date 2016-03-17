module ArticlesHelper
  include ActsAsTaggableOn::TagsHelper
  
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(partial: "comment", locals: {:c => comment}) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comments")
    end.join.html_safe
  end
  def article_tags article
    article.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
  end
end
