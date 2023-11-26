<div class="list_div">
  <div id="info_bar">		
    LISTE DES ARTISTES &nbsp; &middot; &nbsp; Il y a <em><?php print $session->getSessionVar( 'total_records')+1;?> enregistrements</em> dans la table <em>
    <?php print ucfirst($profiler->getTable());?></em>
  </div>

  <fieldset>	
  <?php	

  $slice = $_GET['slice_1'];

  foreach($rows as $row) {
    $pix				 = '';
    $profile_id			 = $row['profile_id'];
    $creation_date 		 = $row['profile_creation'];
    $modification_date 	 = ($row['profile_modification'] == '0000-00-00') ? '' : ' | updated '.$row['profile_modification'];

    $profile_category 	= $row['profile_category_name_en'];

    $name 		  		 = $row['profile_name'];
    $surname 	  		 = $row['profile_surname'];
    $full_name    		 = $surname.' '.$name;
    $email				 = $row['profile_email_address'];

    $phone				 = $row['profile_phone_number'];
    $address			 = $row['profile_address'];
    $zip				 = $row['profile_postal_code'];
    $city				 = $row['profile_city'];
    $country			 = $row['country_name_fr'];

    $company			 = $row['profile_company'];

    $company_phone		 = $row['profile_company_phone_number'];
    $company_url		 = $row['profile_company_url'];

    $profile_picture = $row['profile_picture_name'].$row['profile_picture_ext'];
    $img_url = $uploader->getTarget().$profile_picture;

    $popup				= file_popup($full_name, '610', '580');



    $class 				= ($profile_picture) ? 'profile_picture' : 'empty_profile_picture';
    $img 				= ($profile_picture) ? $img_url : 'empty_profile_picture';
    $action 			= ($profile_picture) ? 'delete_profile_picture' : 'add_profile_picture';
    $delete_picture 	= ($profile_picture) ? '<a href="?page=profiler&amp;action=delete_profile_picture&amp;file_field=profile_id&file_id='.$profile_id.'&file_to_be_trashed='.$profile_picture.'"  onclick="return(confirm(\'Delete?\'));">delete picture?</a>' : '';
    $picture 			= ($profile_picture) ? '<img src="'.$img_url.'" alt="" />' : '';




      ($company != '' && $company_url != '') ? $company='<img src="img/icons/link.gif" alt="link" /><a href="'.$company_url.'" onclick="window.open(this.href, \'_blank\'); return false;">'.$company.'</a>' : $company=$company;

      ($email == '') ? $email='n/a': $email=$email;
      ($phone == '') ? $phone='n/a': $phone=$phone;
      ($address == '') ? $address='n/a': $address=$address;
      ($zip == '') ? $zip='n/a': $zip=$zip;
      ($city == '') ? $city='n/a': $city=$city;
      ($country == '') ? $country='n/a': $country=$country;


        if ( $row['dir_name'] != '' ) {

        $where = " dir_name = '" . $row['dir_name'] ."' ";
        $pictures = $crud->select( '' , 'upload_file' , 'upload_file_name, upload_file_ext, upload_file_display' , '' , '' , '' , '' , '' ,'' );
            foreach ($pictures as $key => $value) {

                  if ( $value['upload_file_display'] == '0') {
                    $class_unav = ' class="unavailable_img" ';

                  };

                  $pix .= '<a href="'.$row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext'].'" ';

                  $pix .= img_popup($row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext']);

                  $pix .= '><img src="'.$row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext'].'" class="tiny_img" alt=""  '.$class_unav.'/></a>';

                  $class_unav	= '';



        }


      }




    if($_SESSION['display_type'] == 'full') {
print <<<EDO
          <div class="profiles">
          <div class="underlined_profile_line">
              <div class="records_left">
                $profile_cat <strong>$full_name</strong><span style="color:#999; font-size: 10px;"> [$creation_date$modification_date] $nbr_of_orders</span>
              <br/>
              <div style="float:left; margin: 6px 0 0 0;">
              $company $job
              </div>
              </div>
              <div class="records_right">
                <a href="?page=profiler&amp;action=delete_profile&amp;profile_id=$profile_id&amp;slice_1=$slice
              " onclick="return(confirm('Delete profile?'));" class="delete_hover">delete</a> |
                <a href="?page=profiler&amp;action=edit&amp;profile_id=$profile_id&amp;slice_1=$slice
              ">edit</a>
              </div>
            </div>
            <div class="profile_line">
            <div style="float:left; margin: -16px 0 0 -2px;">
              <span style="float:left;"><a href="mailto:$email">
              <img src="img/icons/email.png" class="icon" alt="email" />$email</a>
              </span>
              <img src="img/icons/phone.png" class="icon" alt="phone" />$phone<br/>
              </div>
            </div>
          <div>$pix</div>
          </div>
EDO;
  }

      if($_SESSION['display_type'] == 'half') {
  print <<<EDO
    <div class="profiles">
    <div class="underlined_profile_line">
        <div class="records_left">
          $profile_cat <strong>$full_name</strong><span style="color:#999; font-size: 10px;"> [$creation_date$modification_date] $nbr_of_orders</span>
        <br/>
        <div style="float:left; margin: 6px 0 0 0;">
        $company $job
        </div>
        </div>
        <div class="records_right">
          <a href="?page=profiler&amp;action=delete_profile&amp;profile_id=$profile_id&amp;slice_1=$slice
        " onclick="return(confirm('Delete profile?'));" class="delete_hover">delete</a> |
          <a href="?page=profiler&amp;action=edit&amp;profile_id=$profile_id&amp;slice_1=$slice
        ">edit</a>
        </div>
      </div>
      <div class="profile_line">
      <div style="float:left; margin: -16px 0 0 -2px;">
        <span style="float:left;"><a href="mailto:$email">
        <img src="img/icons/email.png" class="icon" alt="email" />$email</a>
        </span>
        <img src="img/icons/phone.png" class="icon" alt="phone" />$phone<br/>
        </div>
      </div>
    </div>
EDO;
    }

          if($_SESSION['display_type'] == 'minimal') {
      print <<<EDO
        <div class="profiles">
        <div class="underlined_profile_line">
            <div class="records_left">
              $profile_cat <strong>$full_name</strong><span style="color:#999; font-size: 10px;"> [$creation_date$modification_date]  $nbr_of_orders</span>
            </div>
            <div class="records_right">
              <a href="?page=profiler&amp;action=delete_profile&amp;profile_id=$profile_id&amp;slice_1=$slice
            " onclick="return(confirm('Delete profile?'));" class="delete_hover">delete</a> |
              <a href="?page=profiler&amp;action=edit&amp;profile_id=$profile_id&amp;slice_1=$slice
            ">edit</a>
            </div>
          </div>
        </div>
EDO;
        }

}
  ?>
  </fieldset>
</div>

<?php
if ($_GET['info_box']=='edited') {
  $profile_info_r = unserialize($_GET['serialized_info']);
  print <<<EDITEDINFO
  <div class="info_bar">EDIT INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/>Profile of <strong>{$profile_info_r['name']} {$profile_info_r['surname']}</strong> has been successfully edited.<br/><br/>
      </fieldset>
    </div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
  print <<<CREATEDPROFILE
  <div class="info_bar">PROFILE INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/><strong>New profile</strong> has been successfully created.<br/><br/>
      </fieldset>
    </div>
CREATEDPROFILE;
}


?>


<?php include 'views/paginater/view.paginater.php'; ?>
<?php include 'views/sorter/view.sorter.php'; ?>
