const express = require('express')
const app = express()
const router = express.Router();

const path = __dirname + '/views/';
const port = 3001

router.get('/',function(req,res){
  res.sendFile(path + 'index.html');
});

router.get('/sharks',function(req,res){
  res.sendFile(path + 'sharks.html');
});

app.use(express.static(path));
app.use('/', router);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})