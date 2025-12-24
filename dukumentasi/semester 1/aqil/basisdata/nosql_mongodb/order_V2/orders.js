db.orders.insertMany([
  {
    "order_num": 20005,
    "order_date": ISODate("2005-09-01T00:00:00Z"),
    "cust_id": "10002"
  },
  {
    "order_num": 20006,
    "order_date": ISODate("2005-09-28T00:00:00Z"),
    "cust_id": "10002"
  },
  {
    "order_num": 20007,
    "order_date": ISODate("2005-09-30T00:00:00Z"),
    "cust_id": "10004"
  },
  {
    "order_num": 20008,
    "order_date": ISODate("2005-09-03T00:00:00Z"),
    "cust_id": "10005"
  },
  {
    "order_num": 20009,
    "order_date": ISODate("2005-08-10T00:00:00Z"),
    "cust_id": "10003"
  }
])
