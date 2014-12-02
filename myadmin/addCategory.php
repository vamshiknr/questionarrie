<?php
require_once 'manageCategories.php';
require_once 'header.php';
$categories = new categories();
$parentCategories = $categories->getCategories(NULL, true);
?>
<div class="header">
    <h1 class="page-title">Add Category</h1>
    <ul class="breadcrumb">
        <li><a href="dashboard.php">Dashboard</a> </li>
        <li><a href="categories.php">Categories</a> </li>
        <li class="active">Add Category</li>
    </ul>

</div>
<div class="main-content">

    <ul class="nav nav-tabs">
        <li class="active"><a href="#home" data-toggle="tab">Category Details</a></li>

    </ul>

    <div class="row">
        <div class="col-md-4">
            <br>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="home">
                    <form id="tab" name="addcategory" method="post" action="<?php echo $admin_url . '/category.php'; ?>">
                        <div class="form-group">
                            <label>Category Name</label>
                            <input type="text" name="category" value="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Category Parent</label>
                            <select name="categoryparent" id="DropDownTimezone" class="form-control">
                                <option value="">Select Any Category</option>
                                <?php
                                if (isset($parentCategories)) {
                                    while ($parent = mysql_fetch_object($parentCategories)) {
                                        echo '<option value="' . $parent->category_id . '">' . $parent->category_name . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                        <div class="btn-toolbar list-toolbar">
                            <button type="submit" name="addSubmit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                            <a href="#myModal" data-toggle="modal" class="btn btn-danger">Delete</a>
                        </div>
                    </form>
                </div>
            </div>


        </div>
    </div>

    <div class="modal small fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Delete Confirmation</h3>
                </div>
                <div class="modal-body">

                    <p class="error-text"><i class="fa fa-warning modal-icon"></i>Are you sure you want to delete the user?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require_once 'footer.php';
?>