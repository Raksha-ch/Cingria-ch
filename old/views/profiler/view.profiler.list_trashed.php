<div class="list_div">
	<div id="info_bar">DELETED FILES &nbsp; &middot; &nbsp; There are <em><?php print $trash_browser->countItems();?> deleted files</em> in <em>Trashcan</em></div>
		<ol>	
			<?php
			if($trash_browser->countItems() > 0) {
				foreach($trash_browser->buildItemsArray($trash_browser->getItemsArray()) as $row) {
				$trashcan_folder = $uploader->getTrashcan();
				$popup = img_popup($trashcan_folder.$row);
				print <<<EOD
				<li>
					<span style="float:left;"><a href="$trashcan_folder$row" $popup><img src="img/icons/bin.png" alt="" class="icon"/>&nbsp;$row&nbsp;</a></span>
					<span style="float:right;"><a href="?page=profiler&amp;action=erase&amp;file_to_be_erased=$row" onclick="return(confirm('Erase?'));" class="delete_hover">erase</a></span>
				</li>
EOD;
				}
			}
			?>	
		</ol>
</div>