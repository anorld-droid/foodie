// The Cloud Functions for Firebase SDK to create Cloud
// Functions and set up triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
admin.initializeApp();

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started

exports.safaricom = functions.https.onRequest( async (req, res) => {
  const reqId = req.body.Body.stkCallback.CheckoutRequestID;
  const result = req.body.Body;
  const writeResult = await admin.firestore().collection("payments")
      .doc(reqId).set(result);
  // Send back a message that we've successfully written the message
  res.json({result: `Message with ID: ${writeResult.id} added.`});
});

exports.getSubCollections = functions.https.onCall(async (data, context) => {
  const docPath = data.docPath;
  const collections = await admin.firestore().doc(docPath).listCollections();
  const collectionIds = collections.map((col) => col.id);
  return {collections: collectionIds};
});
