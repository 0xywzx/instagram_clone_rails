module MainsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_mains_path
    elsif action_name == 'edit'
      main_path
    end
  end
end
