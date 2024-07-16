<template>
  <div>
    <div>
      <el-table :data="tableData" style="width: 100%; font-size: 20px;line-height: 75px;">
        <el-table-column label="头像">
          <template v-slot="scope">
            <el-image
                style="width: 70px; height: 70px; border-radius: 50%;"
                :src="'http://localhost:8080/api/files/' + scope.row.img"
                :preview-src-list="['http://localhost:8080/api/files/' + scope.row.img]">
            </el-image>
          </template>
        </el-table-column>
        <el-table-column prop="username" label="姓名"></el-table-column>
        <el-table-column prop="password" label="密码"></el-table-column>
        <el-table-column prop="email" label="邮箱"></el-table-column>
        <el-table-column prop="created" label="创建时间"></el-table-column>
        <el-table-column prop="last_modified" label="更新时间"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button type="primary" @click="edit(scope.row)">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div>
      <el-dialog title="请填写信息" :visible.sync="dialogFormVisible" width="30%">
        <el-form :model="form">
          <el-form-item label="头像" label-width="15%">
            <el-upload action="http://localhost:8080/api/files/upload" :on-success="successUpload">
              <el-button size="small" type="primary">点击上传</el-button>
            </el-upload>
          </el-form-item>
          <el-form-item label="姓名" label-width="15%">
            <el-input v-model="form.username" autocomplete="off" style="width: 90%"></el-input>
          </el-form-item>
          <el-form-item label="密码" label-width="15%">
            <el-input v-model="form.password" autocomplete="off" style="width: 90%"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" label-width="15%">
            <el-input v-model="form.email" autocomplete="off" style="width: 90%"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="submit()">确 定</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import request from "../utils/request"

export default {
  data() {
    return {
      form:{},
      tableData: [],
      dialogFormVisible:false,
      //user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")):{}
    }
  },
  created(){
    this.findBySearch();
  },
  methods:{
    findBySearch() {
      request.get("/auth/me").then(res => {
        if (res.code === '0') {
          this.tableData = res.data;
        } else {
        }
      })
    },
    submit(){
      request.post("/auth/submit",this.form).then(res=>{
        if(res.code==='0'){
          this.$message({
            message: '操作成功',
            type: 'success'
          });
          this.dialogFormVisible = false;
          this.findBySearch();
        }else{
          this.$message({
            message: res.msg,
            type: 'error'
          });
        }
      })
    },
    edit(obj){
      this.form=obj;
      this.dialogFormVisible = true;
    },
    successUpload(res){
      this.form.img=res.data;
    }
  }
}
</script>



