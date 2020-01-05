<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-06
 * Time: 14:15
 */

namespace app\manage\model;


class Validationmap
{
    private static $coordArray;
    private static $vertx = [];
    private static $verty = [];
    /**
     * 设置坐标区域
     * @param mixed $coordArray
     */
    public static function setCoordArray(array $coordArray)
    {
        self::$coordArray = $coordArray;
    }
    /**
     * 验证区域范围
     * @param array $coordArray
     * @return bool
     */
    public static function isCityCenter(array $coordArray){
        if(!self::vaildatePoint($coordArray)){
            return false;
        }
        return self::pnpoly(count(self::$coordArray), $coordArray['lng'], $coordArray['lat']);
    }
    /**
     * 比较区域坐标
     * @param $nvert
     * @param $testx
     * @param $testy
     * @return bool
     */
    private static function pnpoly($nvert,$testx, $testy)
    {
        $c = false;
        for ($i = 0, $j = $nvert-1; $i < $nvert; $j = $i++) {
            if ( ( (self::$verty[$i]>$testy) != (self::$verty[$j]>$testy) ) && ($testx < (self::$vertx[$j]-self::$vertx[$i]) * ($testy-self::$verty[$i]) / (self::$verty[$j]-self::$verty[$i]) + self::$vertx[$i]) )
                $c = !$c;
        }
        return $c;
    }
    /**
     * 验证坐标
     * @param array $pointArray
     * @return bool
     */
    private static function vaildatePoint(array $pointArray){
        $maxY = $maxX = 0;
        $minY = $minX = 9999;
        foreach (self::$coordArray as $item){
            if($item['lng']>$maxX) $maxX = $item['lng'];
            if($item['lng'] < $minX) $minX = $item['lng'];
            if($item['lat']>$maxY) $maxY = $item['lat'];
            if($item['lat'] < $minY) $minY = $item['lat'];
            self::$vertx[] = $item['lng'];
            self::$verty[] = $item['lat'];
        }
        if ($pointArray['lng'] < $minX || $pointArray['lng'] > $maxX || $pointArray['lat'] < $minY || $pointArray['lat'] > $maxY) {
            return false;
        }
        return true;
    }

}