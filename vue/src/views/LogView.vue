<template>
    <div>
        <div style="margin-bottom: 15px">
            <el-input v-model="params.username" style="width: 200px;" placeholder="请输入操作人"></el-input>
            <el-button type="primary" style="margin-left: 10px" @click="findBySearch()">查询</el-button>
            <el-button type="primary" style="margin-left: 10px" @click="reset()">清空</el-button>
        </div>
        <div>
            <el-table :data="tableData" style="width: 100%;font-size: 20px;">
            <el-table-column prop="name" label="操作内容"></el-table-column>
            <el-table-column prop="time" label="操作时间"></el-table-column>
            <el-table-column prop="username" label="操作人"></el-table-column>
            <el-table-column prop="ip" label="ip"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
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
    </div>
</template>
    
<script>
import request from "@/utils/request";

export default {
    data() {
        return {
            params: {
                username: '',
                pageNum: 1,
                pageSize: 5
            },
            tableData: [],
            total: 0,
            dialogFormVisible: false,
        }
    },
    created() {
        this.findBySearch();
    },
    methods: {
        findBySearch() {
            request.get("/log/search", {
            params: this.params
            }).then(res => {
            if (res.code === '0') {
                this.tableData = res.data.list;
                this.total = res.data.total;
            } else {
                this.$message({
                message: res.msg,
                type: 'success'
                });
            }
            })
        },
        reset() {
            this.params = {
            pageNum: 1,
            pageSize: 5,
            username: '',
            }
            this.findBySearch();
        },
        handleSizeChange(pageSize) {
            this.params.pageSize = pageSize;
            this.findBySearch();
        },
        handleCurrentChange(pageNum) {
            this.params.pageNum = pageNum;
            this.findBySearch();
        },
        del(id) {
            request.delete("/log/" + id).then(res => {
            if (res.code === '0') {
                this.$message({
                message: '删除成功',
                type: 'success'
                });
                this.findBySearch();
            } else {
                this.$message({
                message: res.msg,
                type: 'success'
                });
            }
            })
        }
    }
}
</script>
