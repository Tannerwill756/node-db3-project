const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes")
    .join("steps", "schemes.id", "=", "steps.scheme_id")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .where("scheme_id", id)
    .orderBy("steps.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id, scheme) {
  return db("schemes")
    .update(changes)
    .where({ id })
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  return findById(id).then((del) => {
    console.log("findById .then!", del);
    return db("schemes")
      .where({ id })
      .del()
      .then((res) => {
        return del;
      });
  });
}
