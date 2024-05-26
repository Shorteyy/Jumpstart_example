view: returning_users {
  derived_table: {
    sql: SELECT count(users_id)
      FROM (SELECT
          users.id  AS users_id,
          COUNT(orders.order_id ) AS orders_count
      FROM `thelook_ecommerce.users`  AS users
      LEFT JOIN `thelook_ecommerce.orders`  AS orders ON users.id = orders.user_id
      GROUP BY
          1
      HAVING COUNT(orders.order_id ) > 1
      ORDER BY
          2) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: f0_ {
    label: "Repeat Purchasers"
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  set: detail {
    fields: [
      f0_
    ]
  }
}
