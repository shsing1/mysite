<form class="form-signin" id="login" role="form" action="<?php echo base_url('admin_guest/login_action') ?>">
    <h2 class="form-signin-heading">請先登入</h2>
    <input type="email" class="form-control" name="login_identity"  placeholder="Email" required autofocus>
    <input type="password" class="form-control" name="login_password" placeholder="密碼" required>
    <div class="checkbox">
        <label>
            <input type="checkbox"  name="remember_me" value="1"> 記住我
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
</form>