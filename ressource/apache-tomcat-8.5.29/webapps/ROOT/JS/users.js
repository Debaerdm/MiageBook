

function supprimerAmis(login) {
    //console.log("DELETE FROM Amis where User1 = 'Debaerdm' AND User2 = " + "'" + login + "'")

    let db = openDatabase('data', '1.0', 'Test DB', 2 * 1024 * 1024);

    db.transaction(function (tx) {
        tx.executeSql("DELETE FROM Amis where User1 = 'Debaerdm' AND User2 = " + "'" + login + "'");
    },erreur,success);
}

function erreur(err) {
    alert(err);
}

function success() {
    alert('Success !');
}

function setAttributes(el, attrs) {
    for(let key in attrs) {
        el.setAttribute(key, attrs[key]);
    }
}

var login = document.getElementById("login").value;
var nom = document.getElementById("nom").value;
var prenom = document.getElementById("prenom").value;
var email = document.getElementById("email").value;
var connecter = document.getElementById("connecter").value;
var date_connection = document.getElementById("date_connection").value;

