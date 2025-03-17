view: orders {
  sql_table_name: `thelook_ecommerce.orders` ;;
  drill_fields: [order_id]
  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    view_label: "_PoP"
    type: time
    timeframes: [raw, time, date, week, month, month_num, month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }


  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Gender" in Explore.

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_num_of_item {
    type: sum
    sql: ${num_of_item} ;;  }
  measure: average_num_of_item {
    type: average
    sql: ${num_of_item} ;;  }

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: update_status{
    type: string
    sql: ${TABLE}.status ;;
    action: {
      label: "Update status"
      url: "https://update-status-rightback-226321764319.europe-west1.run.app" # In here you put the url to the cloud function
      param: {
        name:"OrderID"
        value:"{{orders.order_id._value}}"
      }
      form_param: {
        name: "is_denied"
        type: select
        label: "Approval status"
        description: "Check whether or not fraud."
        required: yes
        option: {
          name: "Processing"
          label: "Processing"
        }
        option: {
          name: "Complete"
          label: "Complete"
        }
        option: {
          name: "Shipped"
          label: "Shipped"
        }
        default: "processing"
      }
    }
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, users.last_name, users.first_name, order_items.count]
    html:
    {% if status._value == 'Complete' %}
    <p style="color: black; background-color: lightgreen;">{{ value }}</p>
    {% elsif status._value == 'Processing' %}
    <p style="color: black; background-color: orange;">{{ value }}</p>
    {% else %}
    <p style="color: white; background-color: red;">{{ value }}</p>
    {% endif %}
    ;;
  }

  measure: goal {
    type: number
    sql: 500000 ;;
    # value_format: "[>=1000000] #,##0.0,,\"M\";[<1000000] #,##0.0,\"K\";General"
  }
}
