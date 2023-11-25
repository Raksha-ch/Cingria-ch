<?php

class ImageManipulator {
	
	private $_source_img_url				= '';
  	private $_source_img_extension 			= '';
  	private $_source_img 					= '';
  	private $_source_img_size				= '';
  	private $_source_img_width				= '';
  	private $_source_img_height				= '';
  	private $_destination_img_width 		= '';
  	private $_destination_img_height		= '';
  	private $_destination_img_quality		= '';
  	private $_created_image_true_color 		= '';
  	private $_created_image_from_extension	= '';
	
	public $size_value						= '';
	public $file_source						= '';
	public $file_extension					= '';
	public $preserve_alpha					= '';
	public $png_quality						= '';
	public $quality							= '';
	public $exif							= '';
	public $exif_info						= '';

	function __construct() {
	}
	
	function setRedir($_redir) 									{ $this->_redir = $_redir; }
	function getRedir() 										{ return $this->_redir; }
	
	function setSourceImageUrl($_source_img_url) {
		$this->_source_img_url = $_source_img_url;
	}
	
	function getSourceImageUrl() {
		return $this->_source_img_url;
	}
	
	function setSourceImageExtension($_source_img_extension) {
		$this->_source_img_extension = $_source_img_extension;
	}
	
	function getSourceImageExtension() {
		return $this->_source_img_extension;
	}
	
	
	function setSourceImage($_source_img) {
  		$this->_source_img = $_source_img;
  	}
	
	function getSourceImage() {
		return $this->_source_img;
	}
	
	function setSourceImageSize($_source_img_size) {
		$img_size_r = getimagesize($_source_img_size);
		$this->setSourceImageWidth($img_size_r[0]);
		$this->setSourceImageHeight($img_size_r[1]);
	}
	
	function setSourceImageWidth($_source_img_width) {
  		$this->_source_img_width = $_source_img_width;
  	}
	
	function getSourceImageWidth() {
		return $this->_source_img_width;
	}
	
	function setSourceImageHeight($_source_img_height) {
  		$this->_source_img_height = $_source_img_height;
  	}
	
	function getSourceImageHeight() {
		return $this->_source_img_height;
	}
	
	function setDestinationImageWidth($_destination_img_width) {
		$this->_destination_img_width = $this->checkSizeValue($_destination_img_width);
  	}
	
	function getDestinationImageWidth() {
		return $this->_destination_img_width;
	}
	
	function setDestinationImageHeight($_destination_img_height) {
		$this->_destination_img_height = $this->checkSizeValue($_destination_img_height);
	}
	
	function getDestinationImageHeight() {
		return $this->_destination_img_height;
	}
	
	function setDestinationImageQuality($_destination_img_quality) {
		$this->_destination_img_quality = $_destination_img_quality;
  	}
	
	function getDestinationImageQuality() {
		return $this->_destination_img_quality;
	}
	
	function setCreatedTrueColor($_created_image_true_color) {
		$this->_created_image_true_color = $_created_image_true_color;
	}
	
	function getCreatedTrueColor() {
		return $this->_created_image_true_color;
	}
	
	function setCreatedImageFromExtension($_created_image_from_extension) {
		$this->_created_image_from_extension = $_created_image_from_extension;
	}
	
	function getCreatedImageFromExtension() {
		return $this->_created_image_from_extension;
	}
	
	function checkSizeValue($size_value) {
		$size_value = (integer)abs($size_value);
		try {
	  		if (!is_integer($size_value))  {
	  			throw new myExceptions('Entered value <em>'.$size_value.'</em> is not an integer.
	  			Please enter a round number.');
	  		}
	  	}
	  	catch(myExceptions $e) {
	  		print $e->getError();
	  	}
		
		if ($size_value < 1)  {
			$size_value = 1;
		}
		return $size_value;
	}
	
	function imageCreateFromExtension($file_source, $file_extension) {
		switch($file_extension) {
			case '.jpg': 
		         $_created_image_from_extension = imagecreatefromjpeg($file_source); 
		         break; 
		    case '.png': 
		         $_created_image_from_extension = imagecreatefrompng($file_source);
		         break; 
		    case '.gif': 
		         $_created_image_from_extension = imagecreatefromgif($file_source); 
		    	 break; 
		    default: 
		         echo("Error Invalid Image Type"); 
		         die; 
		     	 break; 
		 }
		$this->setCreatedImageFromExtension($_created_image_from_extension);
	}
	
	function imageCreateTrueColor($_destination_img_width,$_destination_img_height,$preserve_alpha='1') {
		$_created_image_true_color = imagecreatetruecolor($_destination_img_width,$_destination_img_height); 
		if($preserve_alpha == '1') {
			imagealphablending($_created_image_true_color, false);
			imagesavealpha($_created_image_true_color, true);
		}
		$this->setCreatedTrueColor($_created_image_true_color);
	}
		
	function imageCopyResize() {
		imagecopyresized(
			$this->getCreatedTrueColor(),
			$this->getCreatedImageFromExtension(),
			0,  0,  0,  0,
			$this->getDestinationImageWidth(),
			$this->getDestinationImageHeight(),
			$this->getSourceImageWidth(),
			$this->getSourceImageHeight()
			); 
	}
	
	function calculatePngQualityRatio($png_quality) {
		$png_quality = floor($png_quality/11.1);
		return $png_quality;
	}
	
	function returnImage($quality='100') {
		switch($this->getSourceImageExtension()) {
			case '.jpg': 
				 imagejpeg($this->getCreatedTrueColor(),$this->getSourceImageUrl(),$quality); 
		         break; 
		    case '.png': 
				 imagepng($this->getCreatedTrueColor(),$this->getSourceImageUrl(),$this->calculatePngQualityRatio($quality));
				break; 
		    case '.gif': 
				 imagegif($this->getCreatedTrueColor(),$this->getSourceImageUrl()); 
		    	 break; 
		    default: 
		         echo("Error Invalid Image Type"); 
		         die; 
		     	 break; 
		 }
		$serialized_info=serialize($this->printResizedImageInfo());	
		header("location:".$this->getRedir().'&info_box=resized&file='.$this->getSourceImage().$this->getSourceImageExtension().'&serialized_info='.$serialized_info);		
	}
	
	function printResizedImageInfo() {
		
		if($this->getSourceImageExtension()=='.jpg') {
			$this->quality = $this->getDestinationImageQuality();
		}
		elseif($this->getSourceImageExtension()=='.png') {
			$this->quality = $this->calculatePngQualityRatio($this->getDestinationImageQuality());
		}
		$resized_image_info_r = array(
									'name'		=> $this->getSourceImage(),
									'extension'	=> $this->getSourceImageExtension(),
									'width'		=> $this->getDestinationImageWidth(),
									'height'	=> $this->getDestinationImageHeight(),
									'quality'	=> $this->quality
									);
		return $resized_image_info_r;
	}
	
	function uploadedFileInfo() {
		$uploaded_file_info_r = array(
									'name'		=> $this->getFileName(),
									'extension'	=> $this->getFileExtension(),
									'type'		=> $_FILES['file']['type'],
									'filesize'	=> number_format($_FILES['file']['size']),
									'error'		=> $_FILES['file']['error'],
									'src'		=> $this->filterDisplayableFiles($this->getFileExtension()),
									'target'	=> $this->getTarget()
									);
		return $uploaded_file_info_r;
	  }
	
	
}
?>