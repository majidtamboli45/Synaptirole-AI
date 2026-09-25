# NestJS Tutorial

> Source: https://www.geeksforgeeks.org/javascript/nestjs/

NestJS is a progressive NodeJS framework for building efficient, reliable, and scalable server-side applications. It combines elements of object-oriented programming, functional programming, and functional reactive programming to provide a robust architecture for building server-side applications. This tutorial will guide you through the basics of NestJS, covering its key features, setup process, and building a simple application.
Why Learn NestJS?
NestJS is rapidly gaining popularity due to its robustness and flexibility. Here are some reasons to consider learning NestJS:
- TypeScript Support: NestJS is built with TypeScript, providing optional static typing, which helps catch errors early and improve code quality.
- Modular Architecture: Encourages a modular approach to development, making it easier to manage and scale applications.
- Built-in Support for REST and GraphQL: Simplifies the development of APIs with out-of-the-box support for REST and GraphQL.
- Dependency Injection: Comes with a powerful dependency injection system, promoting a decoupled and testable codebase.
- Community and Ecosystem: Backed by a strong community and a rich ecosystem of libraries and tools.
NestJS Tutorial Prerequisites
Before diving into NestJS, ensure you have a basic understanding of the following:
What is NestJS?
NestJS is a framework built on top of NodeJS and ExpressJS, designed to simplify the development of server-side applications with TypeScript and modern JavaScript. It is heavily inspired by Angular, sharing many design principles and concepts, making it familiar to developers coming from front-end frameworks.
Key Features of NestJS
- Modular Structure: NestJS supports a modular architecture where applications are built from reusable and loosely coupled modules.
- Dependency Injection: Built-in support for dependency injection, making it easier to manage dependencies and improve code maintainability.
- Support for TypeScript: NestJS is built with TypeScript, providing strong typing, interfaces, decorators, and other TypeScript features out of the box.
- Decorators and Metadata: Uses decorators extensively to define modules, controllers, services, and more, enhancing code readability and organization.
- Middleware and Interceptors: Middleware support for processing requests, and interceptors for manipulating responses across the application.
- Built-in HTTP Server: Based on ExpressJS, NestJS provides an efficient HTTP server for handling HTTP requests and responses.
Getting Started with NestJS
Step 1: Install NestJS globally in your system
To create a new NestJS project, you can use the NestJS CLI (@nestjs/cli). Install it globally using npm:
npm install -g @nestjs/cli
Step 2: Initialize NestJS Project
Creating a New NestJS Project using the below command
nest new my-nest-app
cd my-nest-app
You will be prompted to choose a package manager. Select either npm or yarn according to your preference.
Step 3: Generate a Module cats
nest generate module cats
Step 4: Create a Controller and Service
Generate a controller and a service for the cats module:
nest generate controller cats
nest generate service cats
Folder Structure:
Dependencies:
"dependencies": {
"@nestjs/common": "^10.0.0",
"@nestjs/core": "^10.0.0",
"@nestjs/platform-express": "^10.0.0",
"reflect-metadata": "^0.2.0",
"rxjs": "^7.8.1"
}
Example: This example demonstrates a basic NestJS application.
// cats.service.ts
import { Injectable } from '@nestjs/common';
@Injectable()
export class CatsService {
    private readonly cats = [];
    findAll(): string[] {
        return this.cats;
    }
    create(cat: string) {
        this.cats.push(cat);
    }
}
// cats.controller.ts
import { Controller, Get, Post, Body } from '@nestjs/common';
import { CatsService } from './cats.service';
@Controller('cats')
export class CatsController {
    constructor(private readonly catsService: CatsService) { }
    @Get()
    findAll(): string[] {
        return this.catsService.findAll();
    }
    @Post()
    create(@Body() cat: string) {
        this.catsService.create(cat);
    }
}
// cats.module.ts
import { Module } from '@nestjs/common';
import { CatsController } from './cats.controller';
import { CatsService } from './cats.service';
@Module({
    controllers: [CatsController],
    providers: [CatsService],
})
export class CatsModule { }
//app.module.ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CatsModule } from './cats/cats.module';
@Module({
    imports: [CatsModule],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule { }
Step 4: Running the Application:
Run your NestJS application:
npm run start
Visit http://localhost:3000/tasks to see the list of tasks or use tools like Postman to test the API endpoints.
Output:
Open Postman and test the APIs.
Core Concepts of NestJS
1. Modules
Modules are the building blocks of a NestJS application. They help organize related components such as controllers, services, and providers.
import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
@Module({
imports: [],
controllers: [AppController],
providers: [AppService],
})
export class AppModule { }
2. Controllers
Controllers handle incoming requests and return responses to the client. They are decorated with @Controller().
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
@Controller()
export class AppController {
constructor(private readonly appService: AppService) { }
@Get()
getHello(): string {
return this.appService.getHello();
}
}
3. Services
Services are used to handle business logic. They are decorated with @Injectable().
import { Injectable } from '@nestjs/common';
@Injectable()
export class AppService {
getHello(): string {
return 'Hello, World!';
}
}
4. Dependency Injection
NestJS uses dependency injection to manage and resolve dependencies, making the code more modular and testable.
import { Injectable } from '@nestjs/common';
@Injectable()
export class UsersService {
// ...
}
import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
@Module({
providers: [UsersService],
})
export class UsersModule { }
5. Building REST APIs
NestJS makes it easy to build RESTful APIs. Define routes in controllers and use services to handle business logic.
import { Controller, Get, Post, Body } from '@nestjs/common';
import { CatsService } from './cats.service';
import { CreateCatDto } from './create-cat.dto';
@Controller('cats')
export class CatsController {
constructor(private readonly catsService: CatsService) {}
@Get()
findAll(): string {
return this.catsService.findAll();
}
@Post()
create(@Body() createCatDto: CreateCatDto): string {
return this.catsService.create(createCatDto);
}
}
6. Using Middleware and Interceptors
Middleware and interceptors can be used to handle cross-cutting concerns such as logging, authentication, and more.
import { Injectable, NestMiddleware } from '@nestjs/common';
@Injectable()
export class LoggerMiddleware implements NestMiddleware {
use(req: Request, res: Response, next: Function) {
console.log(`Request...`);
next();
}
}
7. Exception Handling in NestJS
NestJS provides a built-in exception handling mechanism to manage errors in your application.
import { ExceptionFilter, Catch, ArgumentsHost, HttpException } from '@nestjs/common';
@Catch(HttpException)
export class HttpErrorFilter implements ExceptionFilter {
catch(exception: HttpException, host: ArgumentsHost) {
const ctx = host.switchToHttp();
const response = ctx.getResponse();
const request = ctx.getRequest();
const status = exception.getStatus();
response
.status(status)
.json({
statusCode: status,
timestamp: new Date().toISOString(),
path: request.url,
});
}
}
8. Testing NestJS Applications
NestJS supports unit and end-to-end testing with Jest. Write tests to ensure your application works as expected.
import { Test, TestingModule } from '@nestjs/testing';
import { CatsController } from './cats.controller';
import { CatsService } from './cats.service';
describe('CatsController', () => {
let catsController: CatsController;
let catsService: CatsService;
beforeEach(async () => {
const app: TestingModule = await Test.createTestingModule({
controllers: [CatsController],
providers: [CatsService],
}).compile();
catsController = app.get < CatsController > (CatsController);
catsService = app.get < CatsService > (CatsService);
});
describe('findAll', () => {
it('should return an array of cats', async () => {
const result = ['test'];
jest.spyOn(catsService, 'findAll').mockImplementation(() => result);
expect(await catsController.findAll()).toBe(result);
});
});
});
