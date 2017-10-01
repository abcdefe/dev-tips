##	1：最基础的跳转

````java
Intent intent = new Intent();
intent.setClass(MainActivity.this,TableActivity.class);
startActivity(intent);
````

##	2:最基础的返回

调用activity的finish()方法

##	3：跳转传递简单值类型

````java
//传递
 Intent intent = new Intent(this,Test2Activity.class);
 intent.putExtra("name", "LIUYANWEI");
 startActivity(intent);
 //接收
Intent intent = getIntent();
String name = intent.getStringExtra("name");
````

##	4：跳转传递对象

````java
//对象需要继承序列化接口implements Serializable

//传递1
 Intent intent = new Intent(this,Test2Activity.class);
 Person person = new Person("liuyanwei",30);
 intent.putExtra("liuyanwei", person);
 startActivity(intent);

//传递2
 Intent intent = new Intent(this,Test2Activity.class);

 Person person = new Person("liuyanwei",30);
 Bundle bundle = new Bundle();
 bundle.putSerializable("liuyanwei", person);

 intent.putExtras(bundle);
 startActivity(intent);
 //接收
Intent intent = getIntent();
 Person person = (Person) intent.getSerializableExtra("liuyanwei");

````

##	5：使用高级的intent进行跳转

 step1：设置intent-filter

````java

<intent-filter>
    <action android:name="xx" />
    <category android:name="android.intent.category.DEFAULT" />
    <data
        android:host="www.lyw.com"
        android:mimeType="abc/xyz"
        android:port="8888"
        android:scheme="hello" />
</intent-filter>

````

step2：设置跳转

````java
 Intent intent = new Intent();
 intent.setDataAndType(Uri.parse("hello://www.lyw.com:8888/test"), "abc/xyz");
 startActivity(intent);
````

step3:接收参数

````java
 Intent intent = getIntent();
 String msg = "Scheme:"+  intent.getScheme() + "**type:" + intent.getType() + 
		 "**getData" + intent.getData();
//intent.getData()还能单独获取端口，路径等信息

````