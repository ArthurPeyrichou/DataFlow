Dataflow projects: Web service for data processing that allows to use component oriented processing
=============================================================

PEYRICHOU Arthur

> Frontend on https://github.com/ArthurPeyrichou/Frontend
> Backend on https://github.com/ArthurPeyrichou/FlowBackend
> Components on https://github.com/ArthurPeyrichou/FlowComponents

Installation
=============
**Dev mode :**

Go to the root folder and type :

- `npm install`
- `npm run start`

> The frontend is running on port 4200 by default (http://localhost:4200)
> The backend is running on port 5001 by default (https://localhost:5001)

Update
=============

Go to the root folder and type :

- `npm update`

It will pull new updates from frontend, backend and components.

Security
=============

For secure communication :

- Security communication is not implemented with docker. For more informations, see in Backend's and Frontend's documentation.


Caution
=============

The Backend is using a ssl certificate created automatically, you must use a browser, go to the address above (https://localhost:5001), it will stop you with a warning. Click on "Details" then on "Accept the risks" to be able to communicate thereafter. Then it will tail you that the connection can't be done because you request a https connection and it is a websocket communication but the ssh certificat is now accepted and the frontend can communicate with the backend.

Docker
=============

To start the frontend vue.JS and the backend python with docker, go to the root folder and type :

- `git clone https://github.com/ArthurPeyrichou/FlowBackend.git backend`
- `git clone https://github.com/ArthurPeyrichou/FlowFrontend.git frontend`
- `git clone https://github.com/ArthurPeyrichou/FlowComponents.git backend/components/FlowComponents`
- `mv backend/components/FlowComponents/components/* backend/components/`
- `rm -rf backend/components/FlowComponents/`
- `docker-compose up -d`

License
=============
[MIT](LICENSE)

Thanks
=============

This work is based on the prototype from Arthur Chevalier (https://github.com/Rarioty/DataFlow)

