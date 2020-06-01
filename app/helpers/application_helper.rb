module ApplicationHelper

    def admin_types
        ['AdminUser']
    end

    def admin?
        admin_types.include?(current_user.type)
    end

    def status_label status
        status_span_generator status
    end

    private
        def status_span_generator status
            case status
            when '開始前'
                content_tag(:span, status.titleize, class: 'badge badge-primary')
            when '完了'
                content_tag(:span, status.titleize, class: 'badge badge-success')
            when '途中'
                content_tag(:span, status.titleize, class: 'label label-primary')
            end
        end
end
