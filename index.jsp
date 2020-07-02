<%--
  Created by IntelliJ IDEA.
  User: 28016
  Date: 2020/6/29
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>

</body>
</html>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>购物车</title>
</head>
<style type="text/css">
  h1{
    text-align: center;
  }
  table{
    margin: 0 auto;
  }
  body{
    font-size: larger;color: crimson;
    background-image: url(img/2.jpg);
    background-repeat: no-repeat;
    background-size: 100%;
  }
  table th,table td{

  }
</style>
<body >
<h1>购物车byhan</h1>
<table border="1" >
  <tr>
    <!--文本th-->
    <th>商品</th>
    <th  >单价</th>
    <th>颜色</th>
    <th>库存</th>
    <th>好评率</th>
    <th>操作</th>
  </tr>
  <tr>
    <td>面膜</td>
    <td  >150</td>
    <td>白色</td>
    <td>100</td>
    <td>88%</td>
    <td align="center">
      <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
    </td>
  </tr>
  <tr>
    <td>口红</td>
    <td  >350</td>
    <td>白色</td>
    <td>166</td>
    <td>82%</td>
    <td align="center">
      <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
    </td>
  </tr>
  <tr>
    <td>鼠标</td>
    <td >150</td>
    <td>黑色</td>
    <td>99</td>
    <td>75%</td>
    <td align="center">
      <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
    </td>
  </tr>
  <tr>
    <td>键盘</td>
    <td  >120</td>
    <td>黑色</td>
    <td>50</td>
    <td>80%</td>
    <td align="center">
      <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
    </td>
  </tr>
</table>
<h1> 结算【剁手吧】</h1>
<table border="1">
  <thead>
  <tr>
    <th>商品</th>
    <th >单价</th>
    <th>数量</th>
    <th>金额</th>
    <th>删除</th>
  </tr>
  </thead>
  <tbody id="goods">
  <!--<tr>
  <td>面膜</td>
  <td>150</td>
  <td align="center">
      <input type="button" value="-" id="jian" onclick="change(this,-1);"/>-->
  <!--readonly规定输入字段为只读-->
  <!--<input id="text" type="text" size="1" value="1" readonly="readonly" />
  <input type="button" value="+" id="add" onclick="change(this,1);"/>
</td>
<td> <input id="money" size="1" value="80"></input></td>
<td align="center">
  <input type="button" value="X" onclick="del(this)" />
</td>
</tr>-->
  </tbody>
  <tfoot>
  <tr>
    <td colspan="3" align="center" >总计</td>
    <td id="total"></td>
    <td>元</td>
  </tr>
  </tfoot>
</table>
</body>
<script type="text/javascript">
    //this js中指当前对象
    function add_shoppingcar(btn){
        var tr=btn.parentNode.parentNode;
        var tds=tr.getElementsByTagName("td");
        var name=tds[0].innerHTML;
        var price=tds[1].innerHTML;
        var tbody=document.getElementById("goods");
        var row=tbody.insertRow();//insertRow表格开头插入新行
        row.innerHTML="<td>"+name+"</td>"+
            "<td>"+price+"</td>"+
            "<td align='center'>"+
            "<input type='button' value='-' id='jian'  onclick='change(this,-1)'  />"+
            "<input id='text' type='text' size='1' value='1' readonly='readonly' />"+
            "<input type='button' value='+' id='add'  onclick='change(this,1)'  />"+
            "</td>"+
            "<td>"+price+"</td>"+
            "<td align='center'>"+
            "<input type='button' value='X' onclick='del(this)'/>"+
            "</td>"+
            "</tr>"
        total();
    }
    //增加减少数量，用n正负1来表示点击了加减按钮
    function change(btn,n){
        //获取数量的三个input对象
        var inputs = btn.parentNode.getElementsByTagName("input");
        //获取原来的数量
        var amount = parseInt(inputs[1].value);
        //当amount=1时不能再点击"-"符号
        //用n<0来表示点击了减button
        if(amount<=1 && n<0){
            return;
        }
        //根据加减来改变数量
        inputs[1].value = amount + n;
        //将改变后的数量值赋值给amount
        amount = inputs[1].value;
        //获取表格中的行
        var tr = btn.parentNode.parentNode;
        //获取所有的列
        var tds = tr.getElementsByTagName("td");
        //获取单价
        var price = parseFloat(tds[1].innerHTML);
        //总价=单价*数量
        var m = price * amount;
        //将总价赋值给相应的位置
        tds[3].innerHTML = m;
        //调用total方法，求总计
        total();
    }


    function total(){
        var tbody=document.getElementById("goods");
        var trs=tbody.getElementsByTagName("tr");
        var sum=0;
        for(var i=0;i<trs.length;i++){
            var tds=trs[i].getElementsByTagName("td");
            var m=tds[3].innerHTML;
            sum += parseFloat(m);
        }
        var total=document.getElementById("total");
        total.innerHTML = sum;
    }
    function del(i){
        var tr=i.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        //tr.remove(tr);
        total();
    }
</script>
</html>
