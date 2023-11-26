<div class="form_div">
  <form id="" action="" method="post">
    <div id="info_bar">EDITER DISCOGRAPHIE</div>
        <fieldset>
          <ol>
              <li>
              <label>Titre de la discographie</label>
              <input type="input" class="input" name="discography_title" value="<?php print $rows['0']['discography_title'] ?>" />
            </li>
          </ol>
      </fieldset>
    </div>

    <div class="form_div">
            <fieldset>
              <ol>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden"  name="discography_id" 		  value="<?php print $rows['0']['discography_id'] ;?>" />
                <input type="submit" name="submit" class="submit" value="Edit" />
            </li>

            </ol>
          </fieldset>
        </form>
    </div>

