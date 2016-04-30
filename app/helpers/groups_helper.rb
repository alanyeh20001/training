module GroupsHelper
  def render_group_updated_at(group)
    group.updated_at.to_s(:long)
  end

  def render_group_title(group)
    truncate(group.title, length: 25)
  end

  def render_group_manage_button(group)
    if current_user && group.editable_by?(current_user)
      link_to("Edit", edit_group_path(group), class: "btn btn-mini") +
      link_to("Delete", group_path(group), class: "btn btn-mini", method: :delete, data: { confirm: "Are you sure???" })
    end
  end

  def render_group_join_quit_button(group)
    if current_user.is_member_of?(@group)
      link_to("Quit Group", quit_group_path(@group), method: :post, class: "btn btn-md btn-warning")
    else
      link_to("Join Group", join_group_path(@group), method: :post, class: "btn btn-md btn-warning")
    end
  end

  def render_new_post_button_of_group(group)
    if current_user.is_member_of?(group)
      link_to("New Post", new_group_post_path(@group), class: "btn btn-md btn-default")
    end
  end
end
