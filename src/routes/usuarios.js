var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/questionario", function (req, res) {
    usuarioController.questionario(req, res);

})


router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/kpis", function (req, res) {
    usuarioController.buscarKPIs(req, res);
});

router.get("/grafico", function (req, res) {
    usuarioController.buscarGraficos(req, res);
});


module.exports = router;