const mongoose = require("mongoose");
const {playerSchema} = require("./Player");

const roomSchema = new mongoose.Schema({
  word: {
    required: true,
    type: String,
  },
  name: {
    required: true,
    type: String,
    unique: true,
    trim: true,
  },
  occupancy: {
    required: true,
    type: Number,
    default: 4
  },
  players: [playerSchema],
  isJoin: {
    type: Boolean,
    default: true,
  },
  turn: playerSchema,
});

const gameModel = mongoose.model("Room", roomSchema);

module.exports = gameModel;
