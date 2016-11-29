<?php

/**
 * @file
 * Contains Drupal\testthing\TestThingFunctions\TestThingSharedFunctions.
 */

namespace Drupal\testthing\TestThingFunctions;

use Exception;

/**
 * TestThing shared functions.
 */
class TestThingSharedFunctions {
  public static function testthing_verifyInput($input) {
    $test_array = explode("\n", $input);
    $values = array();
    foreach ($test_array as $test) {
      
    }
  }
  public static function testthing_verifyName($test_name) {
    if (!ctype_alpha ($test_name)) {
      throw new Exception('Names must be alphabetic');
    }
    return true;
  }
  public static function testthing_verifyNumber($test_number) {
    if (!is_numeric($test_number)) {
      throw new Exception($test_number.' Numbers must be numeric');
    }
    return true;
  }
  public static function testthing_test($test_string) {
    $test_array = explode("\n", $test_string);
    $values = array();
    foreach ($test_array as $test) {
      list($name, $score) = explode(': ', $test);
      TestThingSharedFunctions::testthing_verifyName($name);
      TestThingSharedFunctions::testthing_verifyNumber($score);
      if (isset($values[$name])) {
        $values[$name] += $score;
      }
      else {
        $values[$name] = $score;
      }
    }
    ksort($values);
    $output = '';
    foreach ($values as $name => $score) {
      $score = (string)$score;
      if ($score > 0 && is_numeric($score[0])) { $score = '+'.$score; }
      $output .= $name.': '.$score."\n";
    }
    $output = trim($output);
    return $output;
  }
}