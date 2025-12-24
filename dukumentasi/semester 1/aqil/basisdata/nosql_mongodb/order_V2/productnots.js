db.productnotes.insertMany([
  {
    "note_id": "001",
    "prod_id": "ANV01",
    "note_date": ISODate("2010-09-17T00:00:00Z"), // Format ISODate
    "note_text": "terbayar"
  },
  {
    "note_id": "002",
    "prod_id": "FB",
    "note_date": ISODate("2017-11-19T00:00:00Z"),
    "note_text": "terbayar"
  },
  {
    "note_id": "003",
    "prod_id": "SAFE",
    "note_date": ISODate("2021-07-22T00:00:00Z"),
    "note_text": "terbayar"
  }
])
