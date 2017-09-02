
<center>

# PersonRelation

</center>

***

### 需求描述

> 用于10亿级别数据中的单条或者其关联的查询;


### 技术需求

1. **性能要求:**
	
	> 检索越快越好
	
2. **灵活性要求:**  
	
	> 可自由添加任意数据关联,可添加自定义关联;


### 解决方案简介

> 通过神经网络的方式.达到海量数据的性能优化,灵活性等需求;


### 网络抽象维度
> **抽象维度:**`根据数据样本分析`
> 
> 1. 关系维度
> 	* 根据`节点`与`节点`的关系创建网络关联,搜索时中心区域点亮;
> 
> 2. AIPointer维度
> 
> 	* 根据`节点指针`的快速检索;


### 性能优化

1. **单条检索**

	> 所有数据的索引是录入时自动生成的,而后期的检索都是依赖于此索引在神经网络中取值的;

2. **亲友关系检索**
	
	> 1. 所有`节点`关系之间的关联存于神经网络;
	>
	> 2. 而根据`某节点`检索其 `关联数据` ;就是以`此节点`为中心,作区域点亮;
	>
	> 3. 不相关的数据是压根不参与整个过程的;

### 灵活性：

1. 增删改查节点

	> 在增删改查`节点`的时候,神经网络自动同步生成新的节点及其`ID维度`;
	
2. 增删改查关系
	
	> 在增删改查`节点关系`时,神经网络为有关系的`节点`创建新的网络关联;


### 名词解释

1. 区域点亮
	> 在神经网络中,以点A为点亮点,向其指向的其它节点展开;  
	> 
	> `注:区域点亮对性能优化有重大意义;`
	
2. AIPointer维度
	> 如:`pointer`<1020304050>可拆分为最多10层;  
	>
	> 每输入一位号码,映射下一维0-9的10位数;直到指向最低维的'节点';
	>
	> `(因为网络的纵向通路是提前生成的,在索引时永远不存在从海量数据中检索的问题)`
	
3. 纵向
	> 指神经网络中,自动抽象的分层后,n与n+1层就是纵向的;而同一层的多条数据之间是横向关系;



<br><br><br><br><br>



<center>

# 项目设计

</center>

***

1. 本项目是将SMG系统的神经网络集成到本项目中来
2. 又作了一些适配本项目的工作
3. 所以其工作原理也就是SMG的神经网络的工作原理
	1. AIPointer
	2. 神经网络的软件实现
	3. 多维网络
	4. 数据逻辑 替代 代码逻辑
	5. 数据灵活抽象 替代 代码的死定义
	6. 解决`关系型` 和 `非关系型` 的搜索性能问题。（无搜索）


<br><br><br><br><br>



<center>

# 开发任务

</center>

***

### 主线任务
- [x] 生成数据时,随机产生关联;
- [x] UI控制面板和Log面板

### 今后版本开发
- [x] 多维网络的应用
	- [x] idline
	- [ ] 其它维度(如本项目中的 Name )
		- 姓名，
		- 拼音，
		- 首字母(基于拼音规则的生成关联)
	- [x] relationLine

- [ ] 不同维度间的交互与协作
	- [ ] 真实数据,存储位置与方式是分层的;
	- [ ] 而神经网络只关联Pointer;只操作Pointer与Port;
- [ ] 把AIPort和AIPointer作拆分,提高读取效率;


### 支线任务
- [x] AIDictionary的NSCoding把super已处理的去掉;
- [x] 解决TMCache的内存占用问题（有可能是死锁问题导致的）（随后直接弃用TMCache)

### 现不开发

- [ ] 移植到服务器,并测试10亿数据量时的性能
- [ ] 作AIPointer的内存网络缓存
- [ ] 配合其它成熟数据库的方式;(AIPointer此时为tableName+ID)


<br><br><br><br><br>

<center>

# 开发前_IO实验记录


***

### < ipad2 >



<font color="red">－300 Write－</font>

|Type|Time(s)|SingleTime(s)|Size(KB)|
|:---:|:---:|:---:|:---:|
|mArr单文件|0.125||21|
|kv分文件|6.2||84|
|kv分网络|2.6|0.0087|84|



<font color="red">－300 Read－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|mArr单文件|5.508|0.0187|
|kv分文件|9.236|0.0308|
|kv分网络|2.225|0.00742|

<font color="red">－1000 Write－</font>

|Type|Time(s)|SingleTime(s)|Size(KB)|
|:---:|:---:|:---:|:---:|
|mArr单文件|0.222||69|
|kv分文件|77||280|
|kv分网络|9.28|0.0093|280|

<font color="red">－1000 Read－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|mArr单文件|54.32|0.0543|
|kv分文件|202|0.202|
|kv分网络|8.337|0.00834|

***

### < 模拟器 >

<font color="red">－300 Write－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|kv分网络|0.494|0.0016|
|kv分网络+分文件|0.415|0.0014|

<font color="red">－300 Read－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|kv分网络|0.32|0.0011|
|kv分网络+分文件|0.411|0.0014|

<font color="red">－2000 Write－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|kv分网络|5.545|0.0028|
|kv分网络+分文件|11.4413|0.0057|

<font color="red">－2000 Read－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|kv分网络|2.654|0.0013|
|kv分网络+分文件|2.528|0.00126|


<font color="red">－20000 Write－</font>

|Type|Time(s)|Single(s)|Size(KB)|
|:---:|:---:|:---:|:---:|
|kv分网络|53.867|0.0027|8600KB|

<font color="red">－20000 Read－</font>

|Type|Time(s)|Single(s)|
|:---:|:---:|:---:|
|kv分网络(内存)|94.475|0.0047|
|kv分网络(硬盘)|13.554|0.00067|

<font color="red">－100000 Write－</font>

|Type|Time(s)|Single(s)|Size(KB)|
|:---:|:---:|:---:|:---:|
|kv分网络|420|0.0042||

<font color="red">－20000 Read－</font>

<font color="red">－结果－</font>

|Type|Size(KB)|Read(s)硬盘|Read(s)内存|Write(s)|
|:---:|:---:|:---:|:---:|:---:|
|ori文件(模拟器)|0.43|0.00067||0.0017-0.0028|
|ori文件(ipad2)|0.43||0.0074-0.0083|0.009|

`name="哈哈"时,size为0.28KB`

</center>




<br><br><br><br><br>




<center>

# 开发后_V1.0 测试数据

</center>

***

## Write



TMCache `无@autoreleasepool {}`

1. 5000 24.84s
2. 5000 28.06s
3. 5000 38.42s

TMCache `无@autoreleasepool {}` `agelimit5` `bytelimit1000`

1. 5000 24.34s
2. 5000 25.64s
3. 5000 37.62s

TMCache `无@autoreleasepool {}` `agelimit1` `bytelimit100`

1. 5000 22.49s
2. 5000 24.66s
3. 5000 34.00s

TMCache `分段1000` `agelimit1` `bytelimit100`

1. 5000 21.28s
2. 5000 24.90s
3. 5000 34.21s

TMCache `无@autoreleasepool {}` `无agelimit` `无bytelimit`

1. 5000 19.21s
2. 5000 20.43s
3. 5000 28.80s


换PINCache

1. 5000 20.22s
2. 5000 22.3s
3. 5000 23.18s
4. 5000 28.91s
5. 5000 22.28s
6. 5000 24.49s
8. 5000 23.28s

TMCache

1. 1w 33.45s
2. 2w 94.159s


PINCache `不分段` `峰值内存占用60m`

1. 5000 41.74s 
2. 5000 38.93s 

PINCache `分段1000` `峰值内存占用7m`

1. 5000 35.25s 
2. 5000 33.17s 
3. 5000 34.57s
4. 1w 75.57s
5. 10w 820s



```
> 总结:

1. TMCache死锁问题太爆内存;
2. PINCache无线程死锁导致的内存问题...
3. TMCache加分段,加agelimit和bytelimit均无明显效果;
4. PINCache加上分段后,内存的占用很小,Write性能也非常稳定;

```

## Read

1. 单Person 0.000007s
2. 2Person 0.0018s - 0.0026s
3. 3Person 0.017s - 0.042s


## 图示


***

![](https://raw.githubusercontent.com/jiaxiaogang/Resource/master/Img/PersonRelation/PersonRelation%E6%BC%94%E7%A4%BA.gif)




<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>