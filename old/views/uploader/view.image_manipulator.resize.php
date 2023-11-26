<div class="form_div">
  <div id="info_bar">RESIZE FORM</div>
  <form id="" action="" method="post">
    <fieldset>	
      <img src="<?php print $uploader->filterDisplayableFiles($uploader->getFileExtension()); ?>" alt="" />
      <ol>
        <li class="top">
          <label>File name :</label>
          <strong><?php print $uploader->getFileName().$uploader->getFileExtension();?></strong>
        </li>
        <li class="top">
          <label>Current width :</label>
          <input type="input" class="shortest_input" value="<?php print $img_manipulator->getSourceImageWidth();?>"
          name="img_current_width" /> px
        </li>
        <li>
          <label>Current height : </label>
          <input type="input" class="shortest_input" value="<?php print $img_manipulator->getSourceImageHeight();?>"
          name="img_current_height" /> px
        </li>
        <li>
          <label>Parametric transformation :</label>
          <select name="param_trans">
            <?php
            $shrinkage_values_r = array(100,75,66,50,33,25,10,5);
            for ($i=100; $i > 0; $i--) {
              $shrinkage_values_r[] = $i;
            }
            foreach ($shrinkage_values_r as $key => $value) {
              print '<option value="';
              calculateShrinkage($img_manipulator->getSourceImageWidth(), $value);
              print 'x';
              calculateShrinkage($img_manipulator->getSourceImageHeight(), $value);
              print '">';
              print $value.'%';
              print ' of original size';
              print ' (';
              calculateShrinkage($img_manipulator->getSourceImageWidth(), $value);
              print 'x';
              calculateShrinkage($img_manipulator->getSourceImageHeight(), $value);
              print ')';
              print '</option>';
            }

            ?>
          </select>
        </li>
        <?php if (($uploader->getFileExtension() == '.jpg') || ($uploader->getFileExtension() == '.png')) { ?>
        <li>
          <label>Quality<br/>decrease :</label>
          <select name="decrease_quality">
            <?php
            $i=100;
            while ($i > 0) {
              $quality_decrease[] = $i;
              $i = $i-10;
            }
            foreach ($quality_decrease as $key => $value) {
              print '<option value="'.$value.'">'.$value.'% of original quality</option>';
            }
            ?>						
          </select>	
        </li>
        <? } ?>
        <li class="bottom">
          <input type="hidden" name="file_name" 	    value="<?php print $uploader->getFileName()?>" />
          <input type="hidden" name="file_extension"  value="<?php print $uploader->getFileExtension();?>" />
          <input type="hidden" name="original_width"  value="<?php print $img_manipulator->getSourceImageWidth();?>" />
            <input type="hidden" name="original_height" value="<?php print $img_manipulator->getSourceImageHeight();?> " />
          <input type="hidden" name="folder_name"     value="<?php print $_GET['folder_name'] ;?>" />
            <input type="hidden" name="slice" value="<?php print $_GET['slice'] ;?>" />
            <input type="hidden" name="resize" value="1" />
          <label>&nbsp;</label>
          <input type="submit" name="submit" class="submit" value="Resize" />
        </li>
      </ol>
    </fieldset>
  </form>
</div>