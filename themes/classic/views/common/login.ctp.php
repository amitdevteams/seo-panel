<?php
    // Retrieve email and password from URL parameters
    $email = isset($_GET['email']) ? $_GET['email'] : '';
    $password = isset($_GET['password']) ? $_GET['password'] : '';
?>

<div class="container col-md-6">
    <h2 class="public_head">
        <i class="fas fa-user-tie"></i>
        <?php echo ucwords($spText['common']['signin'])?>
    </h2>
    <div class="public_form">
        <form name="loginForm" method="post" action="<?php echo SP_WEBPATH?>/login.php">
            <input type="hidden" name="sec" value="login">
            <input type="hidden" name="red_referer" value="<?php echo $post['red_referer']?>">
            <div class="form-group">
                <label for="email"><?php echo $spText['login']['Email']?>:</label> 
                <input type="text" class="form-control" id="userName" name="userName" required="required" value="<?php echo $email; ?>">
                <?php echo $errMsg['userName']?>
            </div>
            <div class="form-group">
                <label for="pwd"><?php echo $spText['login']['Password']?>:</label>
                <input type="text" class="form-control" id="password" name="password" required="required" value="<?php echo $password; ?>">
                <?php echo $errMsg['password'] ? $errMsg['password']."<br>" : ""?>
                <div class="form-group" style="margin-top: 5px;">
                    <a href="<?php echo SP_WEBPATH?>/login.php?sec=forgot"><?php echo $spText['login']['Forgot password?']?></a>
                </div>
            </div>
            <button name="login" id="autoClick" type="submit" class="btn btn-primary"><?php echo ucwords($spText['common']['signin'])?></button>
            <?php if(!isLoggedIn() && SP_USER_REGISTRATION){ ?>
                &nbsp;<a href="<?php echo SP_WEBPATH?>/register.php"><?php echo $spText['login']['Register']?></a>
            <?php }?>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        scriptDoLoad("<?php echo SP_WEBPATH?>/?sec=sync_all_se", "tmp");
        $('#autoClick').click();
    });
</script>
