<template>
  <div style="margin:10px 0 0 10px">
    <div style="margin-bottom: 15px">
      <el-input v-model="params.title" style="width: 200px" placeholder="请输入标题"></el-input>
      <el-button type="warning" style="margin-left: 10px" @click="findBySearch()">查询</el-button>
      <el-button type="warning" style="margin-left: 10px" @click="reset()">清空</el-button>
      <el-button type="primary" style="margin-left: 10px" @click="add()">发布</el-button>
    </div>
    <div>
      <el-table :data="tableData" style="width: 100%; font-size: 20px;line-height: 75px;">
        <el-table-column prop="title" label="标题"></el-table-column>
        <el-table-column prop="content" label="内容"></el-table-column>
        <el-table-column prop="created" label="创建时间"></el-table-column>
        <el-table-column prop="last_modified" label="更新时间"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button type="primary" @click="edit(scope.row)">编辑</el-button>
            <el-popconfirm title="确定删除吗？" @confirm="del(scope.row.id)">
                <el-button slot="reference" type="danger" style="margin-left: 5px">删除</el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div style="text-align: center;margin-top: 10px">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="params.pageNum"
          :page-sizes="[5, 10, 15, 20]"
          :page-size="params.pageSize"
          layout="total, sizes, prev, pager, next"
          :total="total">
      </el-pagination>
    </div>
    <div>
      <el-dialog title="请填写信息" :visible.sync="dialogFormVisible" width="30%">
        <el-form :model="form">
          <el-form-item label="标题" label-width="15%">
            <el-input v-model="form.title" autocomplete="off" style="width: 90%"></el-input>
          </el-form-item>
          <el-form-item label="内容" label-width="15%">
            <el-input v-model="form.content" autocomplete="off" style="width: 90%"></el-input>
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
      params: {
        title:'',
        pageNum:1,
        pageSize:5
      },
      form:{},
      tableData: [],
      total:0,
      dialogFormVisible:false,
    }
  },
  created(){
    this.findBySearch();
  },
  methods:{
    findBySearch() {
      request.get("/posts/search", {params: this.params}
      ).then(res => {
          if (res.code === '0') {
            this.tableData = res.data.list;
            this.total = res.data.total;
          } else {
            this.$message({
              message: res.msg,
              type: 'error'
            });
          }
      })
    },
    reset(){
      this.params = {
        title:'',
        pageNum:1,
        pageSize:5
      }
      this.findBySearch();
    },
    add(){
      this.form={};
      this.dialogFormVisible = true;
    },
    submit(){
      request.post("/posts/submit",this.form).then(res=>{
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
    del(id){
      request.delete("/posts/" + id).then(res=>{
        if(res.code==='0'){
          this.$message({
            message: '删除成功',
            type: 'success'
          });
          this.findBySearch();
        }else{
          this.$message({
            message: res.msg,
            type: 'error'
          });
        }
      })
    },
    handleSizeChange(pageSize){
      this.params.pageSize = pageSize;
      this.findBySearch();
    },
    handleCurrentChange(pageNum){
      this.params.pageNum = pageNum;
      this.findBySearch();
    },
    successUpload(res){
      this.form.headImageFilePath=res.data;
    }
  }
}
</script>



