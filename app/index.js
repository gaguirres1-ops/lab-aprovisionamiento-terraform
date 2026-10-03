const http = require("http");
const net = require("net");

const APP_ENV = process.env.APP_ENV || "desconocido";
const DB_HOST = process.env.DB_HOST || "localhost";
const DB_PORT = Number(process.env.DB_PORT || 5432);

function responder(res, estado, datos) {
  res.writeHead(estado, {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*"
  });
  res.end(JSON.stringify(datos));
}

function probarBaseDeDatos(res) {
  const socket = net.createConnection({ host: DB_HOST, port: DB_PORT });
  let terminado = false;

  const finalizar = (estado, datos) => {
    if (terminado) return;
    terminado = true;
    socket.destroy();
    responder(res, estado, datos);
  };

  socket.setTimeout(2000);
  socket.on("connect", () => finalizar(200, { bd: "conectado", host: DB_HOST }));
  socket.on("timeout", () => finalizar(503, { bd: "sin conexion", error: "tiempo de espera agotado" }));
  socket.on("error", (err) => finalizar(503, { bd: "sin conexion", error: err.message }));
}

const servidor = http.createServer((req, res) => {
  if (req.url === "/") {
    return responder(res, 200, {
      servicio: "api",
      ambiente: APP_ENV,
      instancia: process.env.HOSTNAME
    });
  }

  if (req.url === "/db") {
    return probarBaseDeDatos(res);
  }

  responder(res, 404, { error: "ruta no encontrada" });
});

servidor.listen(3000, () => {
  console.log(`API del ambiente ${APP_ENV} escuchando en el puerto 3000`);
});