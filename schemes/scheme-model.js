const db = require('../data/config');

function find() {
    return db('schemes');
};

function findById(id) {
    return db('schemes').where({ id }).first();
};

function findSteps(id) {
    return db('steps as st')
        .join('schemes as s', 's.id', 'st.scheme_id')
        .where('s.id', id)
        .select('st.id', 's.scheme_name', 'st.step_number', 'st.instructions')
        .orderBy('st.step_number');
};

function add(scheme) {
    return db('schemes').insert(scheme, 'id');
};

function update(changes, id) {
    return db('schemes').where({ id }).update(changes);
};

function remove(id) {
    return db('schemes').where({ id }).del();
};

function addStep(step, scheme_id) {
    const newStep = { ...step, scheme_id: scheme_id };
    return db('steps').insert(newStep)
        .then(findSteps(scheme_id));
};

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep
};