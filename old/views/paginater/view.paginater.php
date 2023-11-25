<?php if ( $pager->getNumPages() > 0 ) { ?>
	
	<div style="float:right; width: 300px;">
		<div class="recordset_bar">NAVIGATE <?php print $pager->getNumPages(); print( $pager->getNumPages() > 1 ) ? ' PAGES' : ' PAGE' ;?> &nbsp;<em>
		<?php print $pager->getLimit(); print( $pager->getLimit() > 1 ) ? ' items' : ' item';?> per page</em></div>
			<div class="info_box">
			<fieldset class="info" id="recordset_menu">
				<ul>
					<?php print $pager->buildSlicesNavigator($sortKeyArray, $sortDirectionArray, $displayTypeArray, 1, '' , '') ;?>	
				</ul>
			</fieldset>
		</div>
	</div>
	
<?php } ?>