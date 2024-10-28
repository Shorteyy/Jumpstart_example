view: inventory_items {
  sql_table_name: `thelook_ecommerce.inventory_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }
  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }
  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  dimension_group: sold {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sold_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }
  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: eur
  }

  measure: cost_vs_last_week {
    type: number
    sql: SAFE_DIVIDE(${total_cost},${inventory_items_last_week.cost_last_week})/100 ;;
    value_format_name: percent_1
  }

  measure: calendar {
    sql: 1 ;;
    html:
    <div class="calendar" style="
        width: 150px;
        background-color: #fff;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        text-align: center;
        font-family: Arial, sans-serif;
        margin: 100px auto;
    ">
        <div class="calendar-header" style="
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
        ">
            {{created_date._value}}
        </div>
        <div class="calendar-body" style="
            padding: 20px;
            border-top: 1px solid #ddd;
        ">
            <div class="day-of-week" style="
                font-weight: bold;
                color: #4CAF50;
                margin-bottom: 10px;
            ">
                # Inventory Items
            </div>
            <div class="day" style="
                font-size: 36px;
                font-weight: bold;
                color: #333;
            ">
                {{count._value}}
            </div>
            <div class="lastday" style="
                font-size: 14px;
                font-weight: bold;
                color: #333;
            ">
                {{cost_vs_last_week._rendered_value}}VS last week
            </div>
        </div>
    </div>
 ;;
  }
}
