module ArticlesHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(partial: "comment", locals: {:c => comment}) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comments")
    end.join.html_safe
  end
end
