---
- dashboard: business_pulse
  title: Business Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: tZzRndi3F3hudFmiRBOnmd
  elements:
  - title: New Users Acquired This Year
    name: New Users Acquired This Year
    model: retail_demo
    explore: users
    type: single_value
    fields: [users.count, users.user_goal]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    comparison_label: User Goal
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 4
  - title: Average Order Sale Price
    name: Average Order Sale Price
    model: retail_demo
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 4
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: retail_demo
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, orders.created_month_name, orders.created_year]
    pivots: [orders.created_year]
    fill_fields: [orders.created_year]
    filters:
      orders.created_year: 3 years
      orders.created_month_name: January, February, March, April, May, June, July
    sorts: [orders.created_year, orders.created_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: 2021 - order_items.total_sale_price, name: '2021'}, {axisId: order_items.total_sale_price,
            id: 2022 - order_items.total_sale_price, name: '2022'}, {axisId: order_items.total_sale_price,
            id: 2023 - order_items.total_sale_price, name: '2023'}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 12
    height: 6
  - title: Highest Spending Users
    name: Highest Spending Users
    model: retail_demo
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.location, users.first_name, users.last_name]
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: ambulance
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: world
    map_projection: ''
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: 2021 - order_items.total_sale_price, name: '2021'}, {axisId: order_items.total_sale_price,
            id: 2022 - order_items.total_sale_price, name: '2022'}, {axisId: order_items.total_sale_price,
            id: 2023 - order_items.total_sale_price, name: '2023'}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    quantize_colors: false
    listen: {}
    row: 4
    col: 12
    width: 12
    height: 6
  - title: Most Popular Brands
    name: Most Popular Brands
    model: retail_demo
    explore: order_items
    type: looker_grid
    fields: [order_items.total_sale_price, inventory_items.product_brand, orders.count]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    truncate_column_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.average_sale_price,
            id: order_items.average_sale_price, name: Average Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: orders.average_num_of_item,
            id: orders.average_num_of_item, name: Average Num of Item}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 6
  - title: Sales Funnel Webtraffic
    name: Sales Funnel Webtraffic
    model: retail_demo
    explore: events
    type: looker_funnel
    fields: [events.event_type, events.count]
    sorts: [events.count desc]
    limit: 500
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
        reverse: false
    isStepped: true
    labelOverlap: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 5
  - title: Traffic By Source
    name: Traffic By Source
    model: retail_demo
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.total_sale_price, order_items.created_date]
    pivots: [users.traffic_source]
    filters:
      order_items.total_sale_price: ">0"
    sorts: [users.traffic_source, order_items.created_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Display - order_items.total_sale_price,
            id: Display - order_items.total_sale_price, name: Display}, {axisId: Email
              - order_items.total_sale_price, id: Email - order_items.total_sale_price,
            name: Email}, {axisId: Facebook - order_items.total_sale_price, id: Facebook
              - order_items.total_sale_price, name: Facebook}, {axisId: Organic -
              order_items.total_sale_price, id: Organic - order_items.total_sale_price,
            name: Organic}, {axisId: Search - order_items.total_sale_price, id: Search
              - order_items.total_sale_price, name: Search}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_colors:
      Facebook - order_items.total_sale_price: "#4276BE"
      Display - order_items.total_sale_price: "#FBB556"
      Search - order_items.total_sale_price: "#9ED7D7"
    defaults_version: 1
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 6
  - name: Orders without socks
    title: Orders without socks
    model: retail_demo
    explore: order_items
    type: looker_column
    fields: [order_items.status, order_items.orders_without_socks]
    sorts: [order_items.orders_without_socks desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      order_items.orders_without_socks: "#63ccca"
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 5
