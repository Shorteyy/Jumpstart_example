connection: "retail_bigquery"

include: "/views/**/*.view.lkml"
include: "/LookML_Dashboards/**/*.dashboard"

datagroup: retail_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hours"
}

persist_with: retail_demo_default_datagroup

explore: returning_users {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  join: inventory_items_last_week{
    type: inner
    sql_on:
    ${inventory_items_last_week.created_date}=${inventory_items.created_date}
    ;;
    relationship: one_to_one
  }
}

# explore: Inventory_items_vs {
#   label: "Inventory Items VS"
#   from: inventory_items
#   join: inventory_items_last_week{
#     sql_on:
#     ${inventory_items_last_week.created_date}=${Inventory_items_vs.created_date}
#     and ${inventory_items_last_week.product_brand}=${Inventory_items_vs.product_brand}
#     and ${inventory_items_last_week.product_id}=${Inventory_items_vs.product_id};;
#     relationship: one_to_one
#   }
# }

explore: distribution_centers {}

explore: orders {
  label: "orders 1"

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

access_grant: can_view_order_items {
  allowed_values: ["Belgium"]
  user_attribute: retail_country
}

explore: order_items {

  # required_access_grants: [can_view_order_items]

  # access_filter: {
  #   field: users.country
  #   user_attribute: retail_country
  # }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: events {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  join: inventory_items_last_week{
    sql_on:
    ${inventory_items_last_week.created_date}=${inventory_items.created_date}
    and ${inventory_items_last_week.product_brand}=${inventory_items.product_brand}
    and ${inventory_items_last_week.product_id}=${inventory_items.product_id};;
    relationship: one_to_one
  }
}

explore: users {
  join: orders {
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}
