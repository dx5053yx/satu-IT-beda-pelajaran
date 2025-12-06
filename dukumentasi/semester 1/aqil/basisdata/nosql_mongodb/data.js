db.vendors.insertMany([
  { _id: "1001", name: "Anvils R Us", address: "123 Main Street", city: "Southfield", state: "MI", zip: "48075", country: "USA" },
  { _id: "1002", name: "LT Supplies", address: "500 Park Street", city: "Any Town", state: "OH", zip: "48033", country: "USA" },
  { _id: "1003", name: "ACME", address: "555 High Street", city: "Los Angeles", state: "CA", zip: "90046", country: "USA" },
  { _id: "1004", name: "Furball, Inc.", address: "1000 5th Avenue", city: "New York", state: "NY", zip: "1111", country: "USA" },
  { _id: "1005", name: "Jet Set", address: "42 Galaxy Road", city: "London", zip: "N16 6PS", country: "England" },
  { _id: "1006", name: "Jouets Et Ours", address: "1 Rue Amusement", city: "Paris", zip: "45678", country: "France" }
])


db.customers.insertMany([
  { _id: "10002", name: "House House", address: "333 Fromage Lane", city: "Columbus", state: "OH", zip: "43333", country: "USA", contact: "Jerry Mouse" },
  { _id: "10003", name: "Wascals", address: "1 Sunny Place", city: "Muncie", state: "IN", zip: "42222", country: "USA", contact: "Jim Jones", email: "rabbit@wascally.com" },
  { _id: "10004", name: "Yosemite Place", address: "829 Riverside Drive", city: "Phoenix", state: "AZ", zip: "88888", country: "USA", contact: "Y San", email: "san@yosemite.com" },
  { _id: "10005", name: "E Fudd", address: "4545 53rd Street", city: "Chicago", state: "IL", zip: "54545", country: "USA", contact: "E Fudd" }
])

db.products.insertMany([
  { _id: "ANV01", vend_id: "1001", name: ".5 ton anvil", price: 6, desc: ".5 ton anvil, black, complete with handy hook", notes: [] },
  { _id: "ANV02", vend_id: "1001", name: "1 ton anvil", price: 10, desc: "1 ton anvil, black, complete with handy hook and carrying case", notes: [] },
  { _id: "ANV03", vend_id: "1001", name: "2 ton anvil", price: 15, desc: "2 ton anvil, black, complete with handy hook and carrying case", notes: [] },
  { _id: "DTNTR", vend_id: "1003", name: "Detonator", price: 10, desc: "Detonator (plunger powered), fuses not included", notes: [] },
  { _id: "FB", vend_id: "1003", name: "Bird seed", price: 3, desc: "Large bag (suitable for road runners)", notes: [] },
  { _id: "FC", vend_id: "1003", name: "Carrots", price: 3, desc: "Carrots (rabbit hunting season only)", notes: [] },
  { _id: "FU1", vend_id: "1002", name: "Fuses", price: 35, desc: "1 dozen, extra long", notes: [] },
  { _id: "JP1000", vend_id: "1005", name: "JetPack 1000", price: 55, desc: "JetPack 1000, intended for single use", notes: [] },
  { _id: "JP2000", vend_id: "1005", name: "JetPack 2000", price: 9, desc: "JetPack 2000, multi-use", notes: [] },
  { _id: "OL1", vend_id: "1002", name: "Oil can", price: 50, desc: "Oil can, red", notes: [] },
  { _id: "SAFE", vend_id: "1003", name: "Safe", price: 4, desc: "Safe with combination lock", notes: [] },
  { _id: "SLING", vend_id: "1003", name: "Sling", price: 3, desc: "Sling, one size fits all", notes: [] },
  { _id: "TNT1", vend_id: "1003", name: "TNT (1 stick)", price: 3, desc: "TNT, red, single stick", notes: [] },
  { _id: "TNT2", vend_id: "1003", name: "TNT (5 sticks)", price: 10, desc: "TNT, red, pack of 10 sticks", notes: [] }
])

db.products.updateOne({ _id: "ANV01" }, { $push: { notes: { note_id: "001", note_date: new Date("2010-09-17"), note_text: "terbayar" } } })
db.products.updateOne({ _id: "FB" }, { $push: { notes: { note_id: "002", note_date: new Date("2017-11-19"), note_text: "terbayar" } } })
db.products.updateOne({ _id: "SAFE" }, { $push: { notes: { note_id: "003", note_date: new Date("2021-07-22"), note_text: "terbayar" } } })

db.orders.insertMany([
  { _id: 20005, order_date: new Date("2005-09-01"), cust_id: "10002", items: [
      { order_item: 1, prod_id: "ANV01", quantity: 10 },
      { order_item: 2, prod_id: "ANV02", quantity: 3 },
      { order_item: 3, prod_id: "TNT2", quantity: 5 },
      { order_item: 4, prod_id: "FB", quantity: 1 }
  ]},
  { _id: 20006, order_date: new Date("2005-09-28"), cust_id: "10002", items: [
      { order_item: 1, prod_id: "JP2000", quantity: 1 }
  ]},
  { _id: 20007, order_date: new Date("2005-09-30"), cust_id: "10004", items: [
      { order_item: 1, prod_id: "TNT2", quantity: 100 }
  ]},
  { _id: 20008, order_date: new Date("2005-09-03"), cust_id: "10005", items: [
      { order_item: 1, prod_id: "FC", quantity: 50 }
  ]},
  { _id: 20009, order_date: new Date("2005-08-10"), cust_id: "10003", items: [
      { order_item: 1, prod_id: "FB", quantity: 1 },
      { order_item: 2, prod_id: "OL1", quantity: 1 },
      { order_item: 3, prod_id: "SLING", quantity: 1 },
      { order_item: 4, prod_id: "ANV03", quantity: 1 }
  ]}
])
