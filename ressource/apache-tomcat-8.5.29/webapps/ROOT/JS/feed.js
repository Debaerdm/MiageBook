$(document).ready(getFeed());

function getFeed() {
    let currentUser = document.getElementById("login").value;
    $.ajax({
        type: 'GET',
        url: '/rest/status/allStatus/'+currentUser,
        dataType: 'json',
        success: function(json) {
            console.log(JSON.stringify(json));

            let myNode = document.getElementById("status");
            while (myNode.firstChild) {
                myNode.removeChild(myNode.firstChild);
            }

            $.each(json, function(idx, obj) {
                let id = obj.id;
                let titre = obj.titre;
                let texte = obj.texte;
                let date_publication = obj.date;
                let nom = obj.loginBean.nom;
                let prenom = obj.loginBean.prenom;

                let date = new Date(date_publication);

                let MM = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov", "Dec"];

                var id_stat = "commentaireStatus_"+id;

                $("#status").append("" +
                    "<div class=\"btn-group pull-right postbtn\">" +
                    "<button type=\"button\" class=\"dotbtn dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"> <span class=\"dots\"></span> </button>" +
                    "<ul class=\"dropdown-menu pull-right\" role=\"menu\">" +
                    "<li><a href=\"javascript:void(0)\">Hide this</a></li>" +
                    "<li><a href=\"javascript:void(0)\">Report</a></li>" +
                    "</ul>" +
                    "</div>" +
                    "<div class=\"col-md-12\">" +
                    "<div class=\"media\">" +
                    "<div class=\"media-left\"> <a href=\"javascript:void(0)\"> <img src=\"https://bootdey.com/img/Content/avatar/avatar3.png\" alt=\"\" class=\"media-object\"> </a> </div>" +
                    " <div class=\"media-body\">" +
                    "<h4 class=\"media-heading\">"+prenom + " "+ nom+"<br>" +
                    "<small class=\"date\"><i class=\"fa fa-clock-o\"></i> "+ ((date.getDate() < 10)? "0":"") + date.getDate() + " " + MM[date.getMonth()] + ". "+ date.getHours()+":"+date.getMinutes()+"</small> </h4>" +
                    "<p><strong>"+titre+"</strong></p>" +
                    "<p>"+texte+"</p>" +
                    "</div>" +
                    "<form method='post' action='/commentaireservice'>" +
                    "<textarea class=\"form-control\" name='text-commentaire' placeholder=\"Poster un commentaire\"></textarea>" +
                    "<input id='addCommentaire' name='idStatus' type='hidden' value='" + id + "'>" +
                    "<br>" +
                    "<button type=\"submit\" class=\"btn btn-success pull-right\"> Commenter </button>" +
                    "</form>" +
                    "</div>" +
                    "</div>" +
                    " <div id=\""+id_stat+"\" class=\"col-md-11 col-sm-offset-1 commentsblock border-top\">" +
                    "</div>");

                getCommentaires(id);
            });
        }
    });
}