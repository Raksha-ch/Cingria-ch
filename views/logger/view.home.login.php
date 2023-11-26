<div style="float:left; margin-top: 24px;">
  <div class="form_div">

    <?php
    if ( $session->getSessionVar('login_status') == 0 && $session->getSessionVar( 'user_login_status' ) == 0) {
    ?>

    <div id="info_bar">ADMIN LOGIN FORM</div>

    <form id="try_profile_form" action="" method="post" enctype="multipart/form-data">
      <fieldset>
        <ol>
            <li>
            <label>Login</label>
            <input type="input" class="input" name="login_value" />
          </li>
          <li>
            <label>Password</label>
            <input type="password" class="input" name="password_value" />
          </li>
          <li class="bottom">
            <label>&nbsp;</label>
              <input type="submit" name="submit" class="submit" value="Login as admin" />
          </li>
          </ol>
        </fieldset>
      </form>

    <?php }
    if ( $session->getSessionVar('login_status') != 0 ) {
    ?>

    <div id="info_bar"><strong>Welcome to Burling</strong>, dear user!</div>
    <div id="login_screen">
      <br/>You are currently logged in as <strong><?php print $session->getSessionVar( 'username' )?></strong>.
      <br/><br/><br/>
      <img src="img/icons/next.png" alt="arrow" /> I am done working,
      <a href="?page=home&amp;action=logout">log me out</a>.
      <br/>
      <img src="img/icons/next.png" alt="arrow" /> I am not <strong><?php print $session->getSessionVar( 'username' ) ?></strong>,
      <a href="mailto:yan.saraillon@societe-ecran.tv">I would like to contact the webmaster</a>.
    </div>
    <?php } ?>
  </div>

  <?php if ( ( $login->getLoginErrorFlag() == 0 ) && ( $session->getSessionVar( 'login_status' ) == 0 ) && ( $session->getSessionVar( 'user_login_status' ) == 0 )  ) { ?>	

    <div class="info_bar">WELCOME!</div>
      <div class="info_box">
        <fieldset class="info">
          <?php
          include 'txts/info.html';
          ?>
        </fieldset>
      </div>
  <?php } ?>

  <?php if ( $login->getLoginErrorFlag() == 1 ) { ?>
  <div class="error_info_bar">ERROR INFO</div>
    <div class="info_box">
      <fieldset class="info">
        <br/>
        There is <strong>no matching profile</strong>.<br/>
        Please try again or <a href="mailto:yan.saraillon@societe-ecran.tv"><strong>contact the webmaster</strong></a>.<br/><br/>
      </fieldset>
  </div>
  <?php } ?>	
</div>
