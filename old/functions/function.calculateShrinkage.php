<?php
  function calculateShrinkage($original_size,$shrinkage_ratio) {
    $shrinkage_value = ($original_size/100)*$shrinkage_ratio;
    print floor($shrinkage_value);
  }
?>