<?php

/*
 * Copyright (c) 2009, Romain Ruetschi <romain@kryzalid.com>
 * Code licensed under the BSD License:
 * See http://romac.github.com/files/BSD.txt
 */

/**
 * Source file containing class Cellophane_Item.
 *
 * @package    Cellophane
 * @license    http://romac.github.com/files/BSD.txt New BSD License
 * @author     Romain Ruetschi <romain@kryzalid.com>
 * @version    0.1
 * @see        Cellophane_Item
 */

/**
 * Class Cellophane_Item.
 *
 * Description for class Cellophane_Item.
 *
 * @package    Cellophane
 * @license    http://romac.github.com/files/BSD.txt New BSD License
 * @author     Romain Ruetschi <romain@kryzalid.com>
 * @version    0.1
 */
class Cellophane_Item
{

    /**
     * DescriptionId
     *
     * @var integer
     */
    protected $_descriptionId = 0;

    /**
     * Description
     *
     * @var mixed
     */
    protected $_description;

    /**
     * Default price
     *
     * @var float
     */
    protected $_defaultPrice = 0.0;

    /**
     * Sale price
     *
     * @var float
     */
    protected $_salePrice    = '';

    /**
     * Weight
     *
     * @var integer
     */
    protected $_weight       = 0.0;

    /**
     * Shipping detail
     *
     * @var mixed
     */
    protected $_shippingDetail;

    /**
     * Offer
     *
     * @var mixed
     */
    protected $_offer;

    /**
     * Driver
     *
     * @var Cellophane_Driver
     */
    protected $_driver = NULL;

    public function __construct( $descriptionId )
    {
        $this->_descriptionId  = $descriptionId;
        $this->_driver         = Cellophane_Driver::getInstance();
        $this->_description    = $this->_fetchDescription();
        $this->_defaultPrice   = $this->_description[ 'item_default_price' ];
        $this->_onSale         = $this->_description[ 'item_status_id' ] == 2 ? true : false;
        $this->_salePrice      = $this->_description[ 'item_sale_price' ];
        $this->_weight         = $this->_description[ 'item_weight' ];
        $this->_shippingDetail = $this->_fetchShippingDetail();
        $this->_offer          = $this->_fetchOffer();
    }

    protected function _fetchDescription()
    {
        $result = $this->_driver->select(
            'item_description',
            '*',
            'item_description_id = ' . $this->_driver->quote( intval( $this->_descriptionId ) ),
            '',
            '',
            '1'
        );

        if( !$result ) {

            throw new Exception(
                'Le produit sélectionné (' . $this->_descriptionId . ') n\'a pas de description associée.'
            );
        }

        return $result[ 0 ];
    }

    protected function _fetchShippingDetail()
    {
        $id = $this->_description[ 'shipping_detail_id' ];

        $shippingDetail = $this->_driver->select(
            'shipping_detail',
            '*',
            'shipping_detailid = ' . $this->_driver->quote( intval( $id ) ),
            '',
            '',
            '1'
        );

        if( !$shippingDetail ) {

            return array();
        }

        return $shippingDetail[ 0 ];
    }

    public function _fetchOffer()
    {
        $id =  $this->_description[ 'offer_id' ];

        $offer = $this->_driver->select(
            'offer',
            '*',
            'offerid = ' . $this->_driver->quote( intval( $id ) ),
            '',
            '',
            '1'
        );

        if( !$offer ) {

            return array();
        }

        return $offer[ 0 ];
    }

    public function getWeight()
    {
        return $this->_weight;
    }

    public function getComputedPrice()
    {
        $price = ( $this->_onSale ) ? $this->_salePrice : $this->_defaultPrice;

        if( empty( $this->_offer[ 'offer_discount' ] ) ) {

            return $price;
        }

        $price -= ( $this->_offer[ 'offer_discount' ] / 100 ) * $price;

        return $price;
    }

    public function getShippingRate()
    {
        if( empty( $this->_shippingDetail[ 'shipping_detail_rate' ] ) ) {

            return 0.0;
        }

        return $this->_shippingDetail[ 'shipping_detail_rate' ] / 100.0;
    }

    public function getDefaultPrice()
    {
        return $this->_defaultPrice;
    }

    public function getSalePrice()
    {
        return $this->_salePrice;
    }

    public function getOffer()
    {
        return $this->_offer;
    }

    public function getShippingDetail()
    {
        return $this->_shippingDetail;
    }

}