$(document).ready(getUsers());

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

function getUsers() {
    $.ajax({
        type: 'GET',
        url: '/rest/users/allusers',
        dataType: 'json',
        success: function(json) {
            console.log(JSON.stringify(json));

            let myNode = document.getElementById("allUsers");
            while (myNode.firstChild) {
                myNode.removeChild(myNode.firstChild);
            }

            const mediaDiv = document.createElement("div");
            setAttributes(mediaDiv, {"class":"media", "style":"border: dotted 1px"});

            const profilLink = document.createElement("a");
            profilLink.value = 'Voir le profile';

            const form = document.createElement("form");
            setAttributes(form, {"onsubmit":"return confirm('Etes-vous sur ?')", "action": "/suppressionAmisManager", "method": "post" });
            const buttonSubmit = document.createElement("button");
            buttonSubmit.value = "Ajouter à mes amis";
            setAttributes(buttonSubmit, {"class": "btn btn-primary followbtn", "type":"submit"});
            form.appendChild(buttonSubmit);
            const inputAddHidden = document.createElement("input");
            const divLogo = document.createElement("div");
            divLogo.setAttribute("class", "media-left");
            const aLogo = document.createElement("a");
            divLogo.appendChild(aLogo);
            const imgLogo = document.createElement("img");
            imgLogo.setAttribute("src", "https://bootdey.com/img/Content/avatar/avatar1.png");
            setAttributes(imgLogo, {"src":"https://bootdey.com/img/Content/avatar/avatar1.png", "alt":"", "class":"media-object"});
            aLogo.appendChild(imgLogo);
            const divName = document.createElement("div");
            divName.setAttribute("class", "media-body");
            const hName = document.createElement("h4");
            hName.setAttribute("class", "media-heading");
            const spanName = document.createElement("span");
            divName.appendChild(hName);
            divName.appendChild(spanName);

            $.each(json, function(idx, obj){
                let login = obj.login;
                let nom = obj.nom;
                let prenom = obj.prenom;
                let connecter = obj.connecter;
                let date_connection = obj.date_connection;

                console.log(date_connection);

                // document.getElementById("myAnchor").setAttribute("href", "https://www.w3schools.com");

                /*$("#allUsers").append(
                    "<div class=\"media\" style=\"border: dotted 1px \">\n" +
                    "<a href=\"profile.jsp#"+login+"\">Voir le profil</a>" +
                    " <form onsubmit=\"return confirm('Etes-vous sur ?')\" action=\"\\suppressionAmisManager\" method=\"post\">\n" +
                    "   <input id='ajouterAmis' name='ajouter' type=\"hidden\" value='" + login + "'>\n" +
                    "    <button class=\"btn btn-primary followbtn\" type=\"submit\">Ajouter à mes Amis</button>\n" +
                    " </form>\n" +
                    " <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                    "  <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                    " <div class=\"media-body\">\n" +
                    " <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                    "                            En ligne / Derniere connexion il y a ...    </div>\n"
                );*/

                profilLink.setAttribute("href", "profile.jsp#"+login);
                aLogo.setAttribute("href",  "profile.jsp#"+login);
                setAttributes(inputAddHidden, {"id":"ajouterAmis", "name":"ajouter", "type":"hidden", "value": login});
                hName.value = nom + " " + prenom;
                if (connecter !== 0) {
                    spanName.value = "En ligne"
                } else {
                    spanName.value = date_connection.dayOfMonth + " " + date_connection.month.slice(0,4).toLowerCase() +
                        ". "+ date_connection.hour+":"+date_connection.minute;
                }

                mediaDiv.appendChild(profilLink);
                mediaDiv.appendChild(form);
                mediaDiv.appendChild(divLogo);
                mediaDiv.appendChild(profilLink);

                $("#allUsers").append(mediaDiv);
            });
        }
    }).complete(function() {
        setTimeout(function () {
            getUsers();
        }, 10000);
    })
}