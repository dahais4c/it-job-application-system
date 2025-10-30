# IT岗位求职记录系统

## 项目简介
IT岗位求职记录系统是一个基于Spring Boot的Web应用，用于记录和管理IT行业的求职岗位信息。用户可以添加、查询、编辑和删除岗位记录，并支持按企业名称、岗位名称和薪资范围进行搜索筛选。

## 技术栈
- **后端框架**：Spring Boot 3.2.0
- **ORM框架**：Spring Data JPA
- **数据库**：MySQL 8.0+
- **前端技术**：HTML5 + CSS3 + JavaScript
- **构建工具**：Maven

## 快速开始

### 环境要求
- JDK 17+
- Maven 3.9+
- MySQL 8.0+

### 数据库配置
1. 创建MySQL数据库
```sql
CREATE DATABASE job_application_db;
```

2. 配置数据库连接
编辑 `src/main/resources/application.properties` 文件：
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/job_application_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 构建和运行
1. 构建项目
```bash
mvn clean install
```

2. 运行应用
```bash
java -jar target/th-1.0-SNAPSHOT.jar
```

3. 访问应用
打开浏览器，访问：http://localhost:8080/jobapp

## 功能特性

1. **岗位管理**
   - 添加新岗位
   - 查询岗位列表
   - 编辑岗位信息
   - 删除岗位记录

2. **搜索筛选**
   - 按企业名称模糊搜索
   - 按岗位名称模糊搜索
   - 按薪资范围筛选

3. **用户界面**
   - 响应式设计
   - 直观的操作体验
   - 模态框编辑和删除操作

## 项目结构
```
├── src/
│   ├── main/
│   │   ├── java/org/example/
│   │   │   ├── Application.java           # 应用程序入口
│   │   │   ├── entity/Role.java           # 岗位实体类
│   │   │   ├── repository/RoleRepository.java # 数据访问层
│   │   │   ├── service/RoleService.java   # 业务逻辑接口
│   │   │   ├── service/impl/RoleServiceImpl.java # 业务逻辑实现
│   │   │   └── controller/RoleController.java # REST控制器
│   │   └── resources/
│   │       ├── application.properties     # 应用配置
│   │       └── static/index.html          # 前端页面
│   └── test/
├── pom.xml                                # Maven配置
├── .gitignore                             # Git忽略文件
└── README.md                              # 项目说明
```

## API文档

### 岗位管理API

#### 获取所有岗位
```
GET /api/roles
```

#### 根据ID获取岗位
```
GET /api/roles/{id}
```

#### 添加岗位
```
POST /api/roles
Content-Type: application/json

{
  "companyName": "公司名称",
  "jobTitle": "岗位名称",
  "salary": 15000,
  "requirements": "岗位要求"
}
```

#### 更新岗位
```
PUT /api/roles/{id}
Content-Type: application/json

{
  "companyName": "新公司名称",
  "jobTitle": "新岗位名称",
  "salary": 18000,
  "requirements": "新岗位要求"
}
```

#### 删除岗位
```
DELETE /api/roles/{id}
```

#### 按条件搜索岗位
```
GET /api/roles/search?companyName=公司&jobTitle=开发&minSalary=10000&maxSalary=20000
```

## 注意事项

1. 首次运行时，系统会自动创建数据库表结构
2. 确保MySQL数据库服务正常运行
3. 建议使用Chrome、Firefox等现代浏览器访问应用

## 许可证

MIT License

## 联系方式

如有问题或建议，请联系项目维护者。