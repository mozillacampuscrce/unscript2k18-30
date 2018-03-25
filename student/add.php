<?php
if (isset($_SESSION) === false) {
    session_start();
}

header('Content-Type: text/html; charset=utf-8');
if (!isset($_SESSION) || (!isset($_SESSION['Teacher_Id']))) {
	$_SESSION['error'] = 'Invalid login';
    header('Location: login.php');
    exit;
}

$tid    = $_SESSION['Teacher_Id'];
$conn   = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
$result = mysqli_query($conn, "SELECT * FROM subject WHERE Teacher_Id='$tid'");

$subjects = [];
$row      = null;
// print_r($result);
while ($row = mysqli_fetch_assoc($result)) {
    $record  = mysqli_query($conn, "SELECT * FROM subject_record WHERE Subject_Id='{$row['Subject_Id']}'");
    $studIds = [];
    while ($row2 = mysqli_fetch_assoc($record)) {
        array_push($studIds, $row2['Student_Id']);
    }

    $subjects[$row['Subject_Id']] = $studIds;
}
?>
<!DOCTYPE html>
  <html lang="en">

  <head>
    <title>Add attendance</title>
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
      function invert(button,subjectId) {
        var checkBoxes = $("input[id^="+subjectId+"]");
        checkBoxes.prop("checked", !checkBoxes.prop("checked"));
        if(button.innerText == "Select all") {
          button.innerText = "Deselect all";
        } else {
          button.innerText = "Select all";
        }
      }
    </script>
  </head>

  <body>
  	<?php foreach ($subjects as $Subject_Id => $studIds) {
  	?>
    <div class="container infobox radio-style">
    <div class="col-xs-12 col-md-10 col-md-offset-1">
      <form class="form-horizontal" method="post" action="submit.php">
      	<input type="hidden" name="subject" value="<?php echo $Subject_Id;?>">
      	<h3><?php echo $Subject_Id;
      	$i=0;?></h3>
        <?php 
        	foreach ($studIds as $Student_Id) { $i++;?>
        <input type="checkbox" name="studId[<?php echo $Student_Id; ?>]" id="<?php echo $Subject_Id.$Student_Id;?>" value="1">
        <label for="<?php echo $Subject_Id.$Student_Id; ?>"><?php echo $Student_Id; ?></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <?php 
        if($i%8==0) {
        	echo '<br>';
        }} ?>
        <?php if($i%8 != 0) { ?>
        <br>
        <?php } ?>
          <button type="button" onclick="invert(this,'<?php echo $Subject_Id;?>')" class="btn btn-info">Select all</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button type="submit" class="btn btn-info">Submit</button>
      </form>
     </div>
    </div>
   <?php } ?>
   <div class="container infobox radio-style">
    <div class="col-xs-12 col-md-10 col-md-offset-1">
   <a href="logout.php"><button type="button" class="btn btn-info">Logout</button></a>
 </div>
</div>
  </body>

  </html>