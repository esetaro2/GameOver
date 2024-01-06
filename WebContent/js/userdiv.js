function showdiv(){
    document.getElementById('userbtn1').style.display='none';
    document.getElementById('usermini').style.display='flex';
    document.getElementById('userbtn2').style.display='inline-block';
    document.getElementById('userbtn2').style.opacity='1';
}

function hidediv(){
    document.getElementById('userbtn2').style.display='none';
    document.getElementById('usermini').style.display='none';
    document.getElementById('userbtn1').style.display='inline-block';
}