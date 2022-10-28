//imports from packages
const express = require("express");
const mongoose = require("mongoose");

//import from other files
const authRouter = require("./routes/auth");

//Initializations
const app = express();
const port = 3000;
const DB =
  "mongodb+srv://tanishq:tanishq@cluster0.v2yrlqi.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(port, () => {
  console.log(`connected at ${port}`);
});
