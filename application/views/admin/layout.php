<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="<?php echo $meta_charset; ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $site_title; ?></title>
    <meta name="description" content="<?php echo $site_description; ?>" />
    <meta name="keywords" content="<?php echo $site_keywords; ?>" />
    <?php echo $meta_tag; ?>
    <?php echo $styles; ?>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- JS -->
    <?php echo $scripts_header; ?>
</head>
<body>
    <div class="container-fluid">
        <?php echo $content; ?>
    </div>
    <?php echo $scripts_footer; ?>
</body>
</html>