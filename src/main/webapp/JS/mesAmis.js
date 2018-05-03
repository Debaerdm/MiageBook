function supprimerAmis(login) {
    //console.log("DELETE FROM Amis where User1 = 'Debaerdm' AND User2 = " + "'" + login + "'")

    var db = openDatabase('data', '1.0', 'Test DB', 2 * 1024 * 1024);

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