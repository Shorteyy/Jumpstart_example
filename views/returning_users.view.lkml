view: returning_users {
  derived_table: {

    persist_for: "24 hours"
    sql:
      SELECT
          users.id  AS users_id,
          users.first_name as first_name,
          users.last_name as last_name,
          COUNT(orders.order_id ) AS orders_count
      FROM `thelook_ecommerce.users`  AS users
      LEFT JOIN `thelook_ecommerce.orders`  AS orders ON users.id = orders.user_id
      GROUP BY
          1, 2, 3
      HAVING COUNT(orders.order_id ) > 1
      ORDER BY
          4;;
  }

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.users_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.orders_count ;;
  }

  measure: total_buys {
    type: sum
    sql: ${qty} ;;
  }

}
