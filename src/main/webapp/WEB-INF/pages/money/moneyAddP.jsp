<%--
  Created by IntelliJ IDEA.
  User: yanglijun
  Date: 2019/4/16
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/layui.css">
    <script src="/js/layui.js"></script>
    <script src="/js/vue.min.js"></script>
    <script src="/js/jquery.js"></script>
</head>
<body>
<div class="layui-container">
    <div id="app">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>项目经费申请</legend>
        </fieldset>
        <form>
            <div class="layui-row">
                <div class="layui-form-item">
                    <label class="layui-form-label">经费数目</label>
                    <div class="layui-input-inline">
                        <input type="text" name="moneyValue" required
                               placeholder="经费数目" autocomplete="off" class="layui-input" v-model="moneyValue">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请项目</label>
                    <select class="layui-form-label-col layui-input-inline" name="moneyProjectid" lay-filter="assort1" v-model="moneyProjectid">
                        <option :value="0">请选择</option>
                        <template v-for="graduate in graduates">
                            <option :value="graduate.graduateId">{{graduate.graduateName}}</option>
                        </template>
                    </select>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">审批人</label>
                    <select class="layui-form-label-col layui-input-inline" name="moneyLeaderid" lay-filter="assort1" v-model="moneyLeaderid">
                        <option :value="0">请选择</option>
                        <template v-for="leader in leaders">
                            <option :value="leader.leaderId">{{leader.leaderName}}</option>
                        </template>
                    </select>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-normal" @click="prebtn()">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-normal" @click="reset()">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
<script src="/js/jquery.cookie.js"></script>
<script>

    var leaders;
    $.ajax({
        url: "http://localhost:8080/leader/getLeaders.do",
        data: {

        },
        type: "get",
        dataType: "json",
        async: false,
        success: function (data) {
            leaders = data;
        }
    });
    var graduates;
    $.ajax({
        url: "http://localhost:8080/graduate/getGraduates.do",
        data: {

        },
        type: "get",
        dataType: "json",
        async: false,
        success: function (data) {
            graduates = data;
        }
    });
    var vue = new Vue({
        el: "#app",
        data: {
            leaders:leaders,
            graduates:graduates,
            moneyValue: 0,
            moneyLeaderid:0,
            moneyGraduateid:0
        },
        methods: {
            subbtn: function () {
                window.event.returnValue=false;
                $.ajax({
                    url: "http://localhost:8080/money/postMoneyAddG.do",
                    type: "post",
                    data: {
                        moneyLeaderid:this.moneyLeaderid,
                        moneyGraduateid:this.moneyGraduateid,
                        moneyValue:this.moneyValue
                    },
                    async: false,
                    success: function (data) {
                        if (data == 1) {
                            alert("添加成功");
                            window.location.href="http://localhost:8080/money/moneyShowG.do";
                        }
                    }
                });
            },
            reset:function(){
                this.moneyLeaderid=0;
                this.moneyGraduateid=0;
                this.moneyValue=0;
            },
            prebtn:function(){
                this.subbtn();
            }
        }
    });
</script>
</body>
</html>