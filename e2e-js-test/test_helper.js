(function (){
  'use strict';

  var client = require("mongodb").MongoClient;
  var url = "mongodb://carts-db:27017/data}";
  const collection = db.collection('carts-db');
  var handleErr = function(err) {
    console.log("something went wrong: %s", err.message);
  };

  var count = 0;

  ["cart", "item"].forEach(function(col) {
      client.connect(url, function(err, db) {
      if (err) return handleErr(err);
      db.
        collection(col).
        remove({}, { w: 1 }, function(err, res) {
        if (err) return handleErr(err);
        client.close();
      });
    });
  });
}());
