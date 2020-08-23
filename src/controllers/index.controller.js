const { Pool } = require('pg');
const pool = new Pool({
  host: 'localhost',
  port: '5432',
  user: 'postgres',
  password: 'password',
  database: 'challengeapi'
});

const createUser = async (req, res) => {
  const { username, email, password, type } = req.body;
  const insertUser = await pool.query(
    'INSERT INTO "user" (username, email, password) VALUES($1, $2, $3)',
    [username, email, password]
  );

  const userResponse = await pool.query(
    'SELECT id FROM "user" WHERE username = $1 AND email = $2',
    [username, email]
  );

  const id_user = userResponse.rows[0]['id'];

  const rolResponse = await pool.query('SELECT id FROM "rol" WHERE name_rol = $1', [
    type
  ]);

  const id_rol = rolResponse.rows[0]['id'];

  const linkRolUser = await pool.query(
    'INSERT INTO "rol_user" (id_user, id_rol) VALUES ($1, $2)',
    [id_user, id_rol]
  );

  res.json({
    message: 'User added successfully',
    body: {
      user: { username, email, type }
    }
  });
};

const createApp = async (req, res) => {
  /*** WIP ***/
};

const updateApp = async (req, res) => {
  /*** WIP ***/
};

const deleteApp = async (req, res) => {
  /*** WIP ***/
};

const getApps = async (req, res) => {
  /*** WIP ***/
};

const getUserApps = async (req, res) => {
  /*** WIP ***/
};

const addAppToWishlist = async (req, res) => {
  /*** WIP ***/
};

const deleteAppFromWishlist = async (req, res) => {
  /*** WIP ***/
};

module.exports = {
  createUser,
  createApp,
  updateApp,
  deleteApp,
  getApps,
  getUserApps,
  addAppToWishlist,
  deleteAppFromWishlist
};
