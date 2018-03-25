<?php
if (isset($_SESSION) === false) {
    session_start();
}

header('Content-Type: text/html; charset=utf-8');
if (isset($_SESSION['Teacher_Id'])) {
  //$_SESSION['error'] = 'Logged in';
    header('Location: add.php');
    exit;
}
?>
<!DOCTYPE html>
  <html>

  <head>
    <title>Login</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- //for-mobile-apps -->
    <!-- //custom-theme -->
    <link href="style2.css" rel="stylesheet" type="text/css" media="all" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
    function validateLogin() {
      Useremail = document.getElementById('Useremail');
      Password = document.getElementById('Password');
      if (Useremail.value == "" || Password.value == "") {
        return false;
      }
      return true;
    }
    </script>
  </head>

  <body>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-6 col-md-offset-6 infobox radio-style">
          <form method="post" action="loginform.php" accept-charset="utf-8" onsubmit="return validateLogin();">
            <fieldset>
              <legend>Login</legend>
              <?php if(isset($_SESSION) && isset($_SESSION['error'])) {
                echo "<div style=\"color: red;margin-bottom: 15px;\">{$_SESSION['error']}</div>";
                unset($_SESSION['error']);
              }
              ?>
              <div class="form-group">
                <div class="row">
                  <label class="col-xs-12 col-md-3 control-label text-left" for="Useremail">Teacher_id</label>
                  <div class="col-xs-12 col-md-9">
                    <input name="Useremail" id="Useremail" type="text">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <label class="col-xs-12 col-md-3 control-label text-left" for="Password">Password</label>
                  <div class="col-xs-12 col-md-9">
                    <input name="Password" id="Password" type="password">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-md-9 col-md-offset-3">
                  <button type="submit" class="btn btn-info">Login</button>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </body>

  </html>