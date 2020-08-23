const { Router } = require('express');
const router = Router();
const {
  createUser,
  createApp,
  updateApp,
  deleteApp,
  getApps,
  getUserApps,
  addAppToWishlist,
  deleteAppFromWishlist
} = require('../controllers/index.controller.js');

router.get('/', (req, res) => {
  res.send('OKKKKK');
});

router.post('/signup', createUser);

router.get('/apps', getApps);
router.post('/apps', createApp);
router.delete('/apps/:id', deleteApp);
router.put('/apps/:id', updateApp);
router.get('/me/apps', getUserApps);

router.post('/api/buy/:id', addAppToWishlist);
router.delete('/api/buy/:id', deleteAppFromWishlist);

module.exports = router;
