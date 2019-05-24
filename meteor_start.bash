cd ~
cd bundle
(cd programs/server && npm install)
PORT=3001 MONGO_URL=mongodb://localhost:27017/myapp ROOT_URL=http://localhost node main.js

