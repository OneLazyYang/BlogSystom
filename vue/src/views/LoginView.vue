<template>
    <div class="one">
        <div style="width: 400px; height: 350px; margin: 150px auto; background-color:rgba(107,149,224,0.5); border-radius: 10px">
            <div style="width: 100%; height: 100px; font-size: 30px; line-height: 100px; text-align: center; color: #4a5ed0">欢迎登录</div>
            <div style="margin-top: 25px; text-align: center; height: 320px;">
                <el-form :model="user">
                    <el-form-item>
                        <el-input v-model="user.username" prefix-icon="el-icon-user" style="width: 80%" placeholder="请输入用户名"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-input v-model="user.password" show-password prefix-icon="el-icon-lock" style="width: 80%" placeholder="请输入密码"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button style="width: 80%; margin-top: 10px" type="primary" @click="login()">登录</el-button>
                    </el-form-item>
                    <div style="text-align: center">
                        未有账号？<a href="javascript:void(0)" style="text-decoration: none" @click="navRegister">点击注册</a>
                    </div>
                </el-form>
            </div>
        </div>
    </div>
</template>

<script>
import request from "@/utils/request";

export default {
    name: "LOGIN",
    data() {
        return {
            user:{},
        }
    },
    methods: {
        login() {
            request.post("/auth/login", this.user).then(res => {
                if (res.code === '0') {
                this.$message({
                    message: '登录成功',
                    type: 'success'
                });
                localStorage.setItem("user",JSON.stringify(res.data));
                this.$router.push("/layout");
                } else {
                this.$message({
                    message: res.msg,
                    type: 'error'
                });
                }
            })
        },
        navRegister() {
            this.$router.push("/register");
        }
    }
}
</script>

<style scoped>
</style>