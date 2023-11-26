<div style="float:right; width: 300px;">
  <div class="debug_bar">SORTING &amp; DISPLAYING PREFERENCES</div>
    <div class="info_box">
        <div class="info_box">
        <fieldset class="info">
          <div class="form_infobox">
          <form action="" method="" name="jump" id="jump" accept-charset="utf-8">
            <ol>
            <li>
            <label>
            Sort by :
            </label>
            <select name="sorting_list" id="sorting_list" onchange="go()" ><?php print $sort_menu;?></select>
            </li>
            </ol>
          </form>
          </div>
          <?php
          if($display_menu!='') {
          ?>
          <div class="form_infobox">
          <form action="" method="" name="jump2" id="jump2" accept-charset="utf-8">
            <ol>
            <li style="border-top: 1px solid #e6e6e6;">
            <label style="width: 50px;text-align: left;">
             Display :</label>
            <select name="displaying_list" id="displaying_list" onchange="go2()"><?php print $display_menu;?></select>
          </li>
          </ol>				</form>
          </div>
          <?php } ?>
        </fieldset>
    </div>
  </div>
</div>