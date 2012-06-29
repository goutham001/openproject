class Widget::Settings < Widget::Base

  @@settings_to_render.insert -2, :cost_types

  def render_cost_types_settings
    render_widget Widget::Settings::Fieldset, @subject, { :type => "units" } do
      render_widget Widget::CostTypes,
                    @cost_types,
                    :selected_type_id => @selected_type_id
    end
  end

  def render_with_options(options, &block)
    @cost_types = options.delete(:cost_types)
    @selected_type_id = options.delete(:selected_type_id)

    super(options, &block)
  end
end
