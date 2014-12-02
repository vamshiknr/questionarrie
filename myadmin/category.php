<?php

require_once './manageCategories.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$cats = new categories();
if (isset($_POST['addSubmit'])) {
    $catName = trim($_POST['category']);
    $catParent = trim($_POST['categoryparent']);
    if (!empty($catName)) {
        if ($cats->checkUniqueness($catName) < 1) {
            $cats->insertCategory($catName, $catParent);
            header('Location:categories.php');
        } else {
            echo "Category already exists<br/>";
            echo "<a href='" . $_SERVER['HTTP_REFERER'] . "'>Back</a>";
        }
    }
}

if (isset($_POST['editSubmit'])) {
    $catName = trim($_POST['category']);
    $catParent = trim($_POST['categoryparent']);
    $catStatus = trim($_POST['statuses']);
    $catId = trim($_POST['categoryId']);
    if (!empty($catName)) {
        if ($cats->updateCategory($catId, $catName, $catStatus, $catParent)) {
            header('Location:categories.php');
        } else {
            echo "Category already exists<br/>";
            echo "<a href='" . $_SERVER['HTTP_REFERER'] . "'>Back</a>";
        }
    }
}

if (isset($_POST['categoryDelete'])) {
    $catId = trim($_POST['categoryDelete']);
    if (!empty($catId)) {
        $cats->deleteCategory($catId);
        header('Location:categories.php');
    }
}
