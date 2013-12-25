function confirmdelete() {
    var ans;
    ans = confirm("Do you really want to delete?");
    return ans;
}

function alpha(e) {

    var valid = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ()';

    var chr = String.fromCharCode(e.keyCode);
    if (valid.indexOf(chr) >= 0) return;
    {
        alert("Enter only alphabets!");
    }

    return false;

}

function caps(e) {

    var valid = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';

    var chr = String.fromCharCode(e.keyCode);
    if (valid.indexOf(chr) >= 0) return;
    {
        alert("Enter only capital letters!");
    }

    return false;
}

function alphanumeric(e) {

    var valid = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- ';

    var chr = String.fromCharCode(e.keyCode);
    if (valid.indexOf(chr) >= 0) return;
    {
        alert("Enter only apha numeric character!");
    }

    return false;
}

function digit(e) {
    var valid = '0123456789';

    var chr = String.fromCharCode(e.keyCode);

    if (valid.indexOf(chr) >= 0) return;
    {
        alert("Enter only digits!");
    }

    return false;
}

//function Mobile(b) {
//    if (b.keyCode < 48 || b.keyCode > 57) {
//        if (e.length <=10) {
//            alert("Enter Correct value");
//            return ;
//        }
//        return false;
//    }
//}
//function mob(e) {
//    var valid = '0123456789.';

//    var chr = String.fromCharCode(e.keyCode);

//    if (valid.indexOf(chr) >= 0) return;
//    {
//        if (e.length<= 10) {
//            alert("enter correct value");
//        }
//       
//    }

//    return false;
//}
