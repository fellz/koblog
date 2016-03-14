ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Кол-во статей на главной" do
          status_tag(Article.all.count)
        end  
      end
      column do
        panel "Кол-во всех зарегистрированных пользователей" do
          status_tag(User.all.count)
        end
      end
      column do
        panel "Кол-во зарегистрированных пользователей сегодня" do
          users = User.select {|u| u.created_at.to_date == Date.today}
          status_tag(users.empty? ? 'зеро' : users.count)
        end
      end
    end    
  end # content
end
