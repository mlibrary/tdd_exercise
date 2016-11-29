<?php

/**
 * @file
 * Contains \Drupal\Tests\testthing\Unit\TestThingUnitTest.
 */

namespace Drupal\Tests\testthing\Unit;

use Drupal\Tests\UnitTestCase;
use Drupal\testthing\TestThingFunctions\TestThingSharedFunctions;

/**
 *
 * Tests for colins test thing.
 *
 * @group testthing
 */
class TestThingUnitTest extends UnitTestCase {

  /**
   * Modules installed for all tests.
   *
   * @var array
   */
  public static $modules = array('testthing');

  /**
   * Test Thing.
   */
  public function testThing() {
    $test_string = "Heather: +4\nChen: +10\nHelga: +22\nHeather: -7\nChen: +2\nBalthazar: -1";
    $expected_result = "Balthazar: -1\nChen: +12\nHeather: -3\nHelga: +22";
    $testit = TestThingSharedFunctions::testthing_test($test_string);
    $name = 'eli';
    $score = '+9';
    $testit1 = TestThingSharedFunctions::testthing_verifyName($name);
    $testit2 = TestThingSharedFunctions::testthing_verifyNumber($score);
    $this->assertEquals($testit, $expected_result);
    $this->assertTrue($testit1);
    $this->assertTrue($testit2);
  }
}