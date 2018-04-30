var goodColor = "#66cc66";
var badColor = "#ff6666";

function checkPass() {
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('passwordRequired');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...

    //Compare the values in the password field
    //and the confirmation field
    if(pass1.value === pass2.value) {
        //The passwords match.
        //Set the color to the good color and inform
        //the user that they have entered the correct password
        pass2.style.borderColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Mot de passe correcte"
    } else {
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.borderColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Mot de passe incorrecte"
    }
}

/*function validatephone(phone) {
    var maintainplus = '';
    var numval = phone.value
    if ( numval.charAt(0)=='+' )
    {
        var maintainplus = '';
    }
    curphonevar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    phone.value = maintainplus + curphonevar;
    var maintainplus = '';
    phone.focus;
}*/

// validates text only
function Validate(txt) {
    var nom = document.getElementById("nom");
    var prenom = document.getElementById("prenom");
    var login = document.getElementById("login");

    if (nom === txt) {
        nom.style.borderColor = (nom.value.length > 0)? goodColor : badColor;
    }

    if (prenom === txt) {
        prenom.style.borderColor = (prenom.value.length > 0)? goodColor : badColor;
    }

    if (login === txt) {
        login.style.borderColor = (login.value.length > 3 && login.value.length < 17)? goodColor : badColor;
    }


    txt.value = txt.value.replace(/[^a-zA-Z-'\n\r.]+/g, '');
}
// validate email
function email_validate(email) {
    var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
    var emailObj = document.getElementById('email');

    if(regMail.test(email) === false) {
        document.getElementById("status").innerHTML  = "<span class='warning'>L'adresse mail est pas valide.</span>";
        emailObj.style.borderColor = badColor;
    }
    else {
        document.getElementById("status").innerHTML	= "<span class='valid'>Email valide !</span>";
        emailObj.style.borderColor = goodColor;
    }
}
// validate date of birth
/*function dob_validate(dob) {
    var regDOB = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/;

    if(regDOB.test(dob) === false)
    {
        document.getElementById("statusDOB").innerHTML	= "<span class='warning'>DOB is only used to verify your age.</span>";
    }
    else
    {
        document.getElementById("statusDOB").innerHTML	= "<span class='valid'>Thanks, you have entered a valid DOB!</span>";
    }
}*/

// validate address
/*function add_validate(address) {
    var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;

    if(regAdd.test(address) === false)
    {
        document.getElementById("statusAdd").innerHTML	= "<span class='warning'>Address is not valid yet.</span>";
    }
    else
    {
        document.getElementById("statusAdd").innerHTML	= "<span class='valid'>Thanks, Address looks valid!</span>";
    }
}*/
