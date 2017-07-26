ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Users" do
          ul do
            # @users = User.all
            User.all.map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Recent Songs" do
          ul do
            Song.all.map do |song|
              li link_to(song.title, admin_song_path(song))
            end
          end
        end
      end

      column do
        panel "Recent Playlist" do
          ul do
            Playlist.all.map do |playlist|
              li link_to(playlist.title, admin_playlist_path(playlist))
            end
          end
        end
      end
    end
  end # content
end
