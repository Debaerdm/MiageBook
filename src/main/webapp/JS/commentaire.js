function getCommentaires(id) {
    $.ajax({
        type: 'GET',
        url: 'rest/commentaire/allCommentaireOfStatus/' + id,
        dataType: 'json',
        success: function (json) {
            console.log(JSON.stringify(json));

            $.each(json, function (idx, obj) {
                let id_status = obj.id_status;
                let texte = obj.texte;
                let date_publication = obj.date;
                let nom = obj.loginBean.nom;
                let prenom = obj.loginBean.prenom;

                let date = new Date(date_publication);

                let MM = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

                $("#commentaireStatus_" + id).append(
                    "                                <div class=\"media\">\n" +
                    "                                    <div class=\"media-left\"> <a href=\"javascript:void(0)\"> <img alt=\"64x64\" src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" class=\"media-object\"> </a> </div>\n" +
                    "                                    <div class=\"media-body\">\n" +
                    "                                        <h4 class=\"media-heading\">" + prenom + " " + nom + "<br> <small class=\"date\"><i class=\"fa fa-clock-o\"></i> " + ((date.getDate() < 10) ? "0" : "") + date.getDate() + " " + MM[date.getMonth()] + ". " + date.getHours() + ":" + date.getMinutes() + "</small> </h4>\n" +
                    "                                        <p>" + texte + "</p>\n" +
                    "                                    </div>\n" +
                    "                                </div>" +
                    "<div style=\"background-color: black; height: 1px;\"></div>");
            });
        }
    });
}