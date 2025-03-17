view: dashboardsummary {
  sql_table_name: `customer-data-platform-319611.thelook_ecommerce.dashboard-summary` ;;

  dimension_group: creation_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.creation_timestamp ;;
  }
  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
    # html: <div style="width:90%;"><font size="2"><center><span>{{rendered_value}}</span></font></center></div> ;;
    html:  <div style="white-space: pre-wrap; word-wrap: break-word; max-width: 100%; font-size=14px;">
  {{ value }}
</div> ;;
  }
  measure: count {
    type: count
  }
  dimension: latest_summary {
    type: string
    sql: (
      SELECT summary FROM `customer-data-platform-319611.thelook_ecommerce.dashboard-summary`
      ORDER BY creation_timestamp DESC
      LIMIT 1
    ) ;;
  }
}
