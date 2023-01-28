<?php

if (isset($_SESSION['customer_id'])) {
    $customer_id = $_SESSION['customer_id'];
} else {
    $customer_id = '';
}
$db_name = 'mysql:host=localhost;dbname=food_db';
$user_name = 'root';
$user_password = '';
$conn = new PDO($db_name, $user_name, $user_password);
?>
@extends('front.master')
@section('title', 'profile')
@section('body')

    <div class="heading">
        <h3>my profile</h3>
        <p><a href="/">home </a> <span> / profile</span></p>
    </div>

    <section class="user-details">
        <?php
                $customer_id = request()->query('cs_id');
            $select_profile = $conn->prepare("SELECT `customer`.`name`, `customer`.`phone_num`, `customer`.`address`, `user`.`email` FROM `customer` inner join user ON `user`.`cs_id` = `customer`.`id` WHERE `customer`.`id` = ?");
            $select_profile->execute([$customer_id]);
            if($select_profile->rowCount() > 0){
               $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
         ?>
        <div class="user">
            <img src="front/images/user-icon.png" alt="">
            <p><i class="fas fa-user"></i> <span><?= $fetch_profile['name'] ?></span></p>
            <p><i class="fas fa-phone"></i> <span><?= $fetch_profile['phone_num'] ?></span></p>
            <p><i class="fas fa-envelope"></i> <span><?= $fetch_profile['email'] ?></span></p>
            <a href="update_profile.html" class="btn">update profile</a>
            <p class="address"><i class="fas fa-map-marker-alt"></i> <span><?= $fetch_profile['address'] ?></span></p>
            <a href="update_address.html" class="btn">update address</a>
        </div>

        <?php
            }
        ?>

    </section>

@endsection
