$(document).ready(getFriends());

function getFriends() {
    let currentUser = document.getElementById("login").value;
    $.ajax({
        type: 'GET',
        url: '/rest/users/allusers/' + currentUser,
        dataType: 'json',
        success: function(json) {
            console.log(JSON.stringify(json));

            let myNode = document.getElementById("friends");
            while (myNode.firstChild) {
                myNode.removeChild(myNode.firstChild);
            }

            $.each(json, function(idx, obj){
                let login = obj.login;
                let nom = obj.nom;
                let prenom = obj.prenom;
                let connecter = obj.connecter;

                $("#friends").append("<div class=\"media\" style=\"border: dotted 1px \">\n" +
                    "<a href=\"profile.jsp#"+login+"\">Voir le profil</a>" +
                    " <form onsubmit=\"return confirm('Etes-vous sur ?')\" action=\"/deletefriendservice\" method=\"post\">\n" +
                    "                            <input id='supprAmis' name='suppr' type=\"hidden\" value='" + login + "'>\n" +
                    "                            <button class=\"btn btn-primary followbtn\" type=\"submit\">Supprimer</button>\n" +
                    "                        </form>\n" +
                    "                        <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                    "                            <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                    "                        <div class=\"media-body\">\n" +
                    "                            <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                    "                            En ligne / derniere connexion il y a ...  </div>\n"
                    /*"<div class=\"media\" style=\"border: dotted 1px \">\n" +
                    "                        <button onclick='supprimerAmis("+ "\"" + login + "\"" +")' class=\"btn btn-primary followbtn\">Supprimer</button>\n" +
                    "                        <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                    "                            <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                    "                        <div class=\"media-body\">\n" +
                    "                            <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                    "                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </div>\n" +
                    "                    </div>"*/);
            });
        }
    });
}