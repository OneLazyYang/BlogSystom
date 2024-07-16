<template>
    <div id="app">
        <el-container>
            <el-header style="background-color: #4c535a">
                <div style="margin-top: 15px;"><span style="font-size: 22px; margin-left: 15px;  color: white">基于Spring Boot的博客系统</span>
                <el-dropdown style="float: right" >
                    <span class="el-dropdown-link" style="color: white; font-size: 18px">{{ user.username }}<i class="el-icon-arrow-down el-icon--right"></i></span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item>
                            <div @click="logout">退出登录</div>
                        </el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown></div>
            </el-header>
        </el-container>
        <el-container>
            <el-aside style="overflow: hidden; min-height: 100vh; background-color: #545c64; width: 250px">
                <el-menu :default-active="$route.path" router background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
                    <el-submenu index="1">
                        <template slot="title">
                        <i class="el-icon-s-home" style="font-size: 24px"></i><span style="font-size: 20px">个人管理</span>
                        </template>
                        <el-menu-item-group>
                        <el-menu-item index="/user" style="font-size: 20px">个人信息</el-menu-item>
                        <el-menu-item index="/post" style="font-size: 20px">发表博客</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-menu-item index="/blog">
                        <i class="el-icon-location" style="font-size: 24px"></i>
                        <span slot="title" style="font-size: 20px">浏览博客</span>
                    </el-menu-item>
                </el-menu>
            </el-aside>
            <el-main>
                <router-view/>
            </el-main>
        </el-container>
    </div>
</template>

<script>
export default {
    name: "Layout",
    data(){
        return{
            user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")):{}
        }
    },
    methods:{
        logout(){
            localStorage.removeItem("user");
            this.$router.push("/");
        },
    }
}
</script>

<style>
.el-menu{
border-right: none !important;
}
</style>