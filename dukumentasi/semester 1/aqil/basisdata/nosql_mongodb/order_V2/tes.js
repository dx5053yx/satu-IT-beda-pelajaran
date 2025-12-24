// Pastikan Nii-nii ada di database yang benar, misal 'use mydatabase'
db.products.aggregate([
  {
    $lookup: {
      from: "vendors",          // Ini nama Collection tujuan kita ('vendors')
      localField: "vend_id",    // Ini field di Collection 'products' yang isinya ID vendor
      foreignField: "vend_id",  // Ini field di Collection 'vendors' yang jadi target ID-nya
      as: "vendorInfo"          // Ini nama field baru yang bakal muncul di Dokumen hasil join, isinya info vendor
    }
  },
  {
    // Karena '$lookup' akan menghasilkan array (bisa saja ada >1 match, meskipun di kasus ini 1),
    // kita bisa pakai '$unwind' untuk "membongkar" array itu jadi Dokumen terpisah kalau Nii-nii yakin cuma 1 match.
    // Tapi kalau enggak, biarkan saja jadi array.
    // Untuk kasus 'vend_id' yang unik, kita bisa '$unwind' biar lebih rapi.
    $unwind: "$vendorInfo"
  },
  {
    // Nii-nii bisa juga milih field mana aja yang mau ditampilin pakai $project
    $project: {
      _id: 0, // Jangan tampilin _id otomatis
      prod_id: 1,
      prod_name: 1,
      prod_price: 1,
      "vendorInfo.vend_name": 1, // Kita ambil nama vendor dari field vendorInfo
      "vendorInfo.vend_country": 1
    }
  }
])

db.orders.aggregate([
  {
    $lookup: {
      from: "customers",        // Collection tujuan: 'customers'
      localField: "cust_id",    // Field di 'orders' yang berisi ID pelanggan
      foreignField: "cust_id",  // Field di 'customers' yang jadi target ID
      as: "customerDetails"     // Nama field baru untuk detail pelanggan
    }
  },
  {
    $unwind: "$customerDetails" // Bongkar array customerDetails
  },
  {
    $project: {
      _id: 0,
      order_num: 1,
      order_date: 1,
      "customerDetails.cust_name": 1,
      "customerDetails.cust_email": 1
    }
  }
])

db.orderitems.aggregate([
  {
    // Lookup ke collection products dulu
    $lookup: {
      from: "products",
      localField: "prod_id",
      foreignField: "prod_id",
      as: "productInfo"
    }
  },
  {
    $unwind: "$productInfo" // Bongkar productInfo
  },
  {
    // Lalu lookup ke collection orders
    $lookup: {
      from: "orders",
      localField: "order_num",
      foreignField: "order_num",
      as: "orderInfo"
    }
  },
  {
    $unwind: "$orderInfo" // Bongkar orderInfo
  },
  {
    $project: {
      _id: 0,
      order_num: 1,
      order_item: 1,
      quantity: 1,
      "productInfo.prod_name": 1,
      "productInfo.prod_price": 1,
      "orderInfo.order_date": 1,
      "orderInfo.cust_id": 1 // Kita bisa ambil cust_id dari orderInfo
    }
  }
])
