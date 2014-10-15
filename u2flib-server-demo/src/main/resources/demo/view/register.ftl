<html>
<head>
<title>Java U2F Demo</title>

<script src="chrome-extension://pfboblefjcgdjicmnffhdgionmgcdmne/u2f-api.js"></script>

<script>
var request = ${data};
var signs = [];
setTimeout(function() {
    u2f.register([request], signs,
    function(data) {
        var form = document.getElementById('form');
        var reg = document.getElementById('tokenResponse');
        if(data.errorCode) {
            alert("U2F failed with error: " + data.errorCode);
            return;
        }
        reg.value=JSON.stringify(data);
        form.submit();
    });
}, 1000);
</script>

</head>
    <body>
    <p>Enter a username and then touch your U2F token.</p>
        <form method="POST" action="finishRegistration" id="form" onsubmit="return false;">
            <label for="username">Username</label>
            <input name="username" id="username" autofocus />
            <input type="hidden" name="tokenResponse" id="tokenResponse"/>
        </form>
    </body>
</html>