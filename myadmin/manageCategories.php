<?php

require_once '../constants.php';
require_once 'checksession.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class categories
{

    private $db;
    public $perPage = PER_PAGE;
    public $first = 0;

    public function __construct()
    {
        $this->db = new DB();
    }

    public function getCategories($categoryId = NULL, $limit = NULL)
    {
        return $this->_fetchCategories($categoryId, $limit);
    }

    public function getToalRecords($categoryId = NULL)
    {
        $str = $this->_execCategories($categoryId, true);
        return $this->db->Total($str);
    }

    private function _fetchCategories($categoryId = NULL, $limit = NULL)
    {
        $str = $this->_execCategories($categoryId, $limit);
        $records = $this->db->returns($str);
        return $records;
    }

    private function _execCategories($categoryId = NULL, $limit = NULL)
    {
        $temp = '';
        if (!is_null($categoryId)) {
            $temp = " and c.category_id = " . trim((int) $categoryId);
        }
        $str = "select c.*, ca.adminusername as createdby from certification_categories c "
                . "join certfication_status cs on c.category_status_id = cs.status_id "
                . "left join certification_admin ca on ca.adminid = c.createdby "
                . "where cs.status_title = 'Active'" . $temp;
        if (is_null($limit)) {
            $str .= ' limit ' . $this->first . ', ' . $this->perPage;
        }
        return $str;
    }

    public function checkUniqueness($name, $categoryId = NULL, $parentId = 0)
    {
        try {
            $cond = '';
            if (!is_null($categoryId)) {
                $cond = ' and c.category_id!=' . $categoryId . ' and c.category_parent_id=' . $parentId;
            }
            $str = "select count(c.category_name) as tcount from certification_categories c "
                    . "join certfication_status cs on c.category_status_id = cs.status_id "
                    . "left join certification_admin ca on ca.adminid = c.createdby "
                    . "where cs.status_title = 'Active' and c.category_name='" . $name . "'" . $cond;
            $fObject = $this->db->fetchObject($str);
            return $fObject->tcount;
        } catch (Exception $ex) {
            echo $ex->getMessage();
            exit;
        }
    }

    public function insertCategory($categoryName, $parentId = 0)
    {
        $keys = '';
        $values = '';
        if (!empty($parentId)) {
            $keys = 'category_parent_id,';
            $values = $parentId . ',';
        }
        $str = 'insert into certification_categories(category_name,' . $keys . ' createdby, createddatetime, updatedby) '
                . 'values ("' . $categoryName . '", ' . $values . '"' . $_SESSION['userId'] . '", now(), "' . $_SESSION['userId'] . '")';
        $this->db->Execute($str);
    }

    public function deleteCategory($categoryId)
    {
        $str = $this->_execCategories($categoryId);
        $str = 'delete from certification_categories where category_id = ' . $categoryId;
        $this->db->flatExecute($str);
        return true;
    }

    public function updateCategory($categoryId, $categoryName, $statusId, $parentId)
    {
        if ($this->checkUniqueness($categoryName, $categoryId, $parentId) > 0) {
            return false;
        } else {
            $str = 'update certification_categories set category_name = "' . $categoryName . '",'
                    . ' category_parent_id = ' . $parentId . ','
                    . ' updatedby=' . $_SESSION['userId'] . ','
                    . ' category_status_id=' . $statusId
                    . ' where category_id=' . $categoryId;
            $this->db->Execute($str);
            return true;
        }
    }

    public function fetchStatuses()
    {
        $str = "select * from certfication_status";
        return $this->db->Returns($str);
    }

}
