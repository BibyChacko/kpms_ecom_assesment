# KPMS Commerce
    An ecommerce application for buyig products
## Screenshots

![Jobbox Logo](/docs/images/ss1.jpeg)
![Jobbox Logo](/docs/images/ss2.jpeg)
![Jobbox Logo](/docs/images/ss3.jpeg)
![Jobbox Logo](/docs/images/ss4.jpeg)
![Jobbox Logo](/docs/images/ss5.jpeg)

Find screenshots at [ScreenShots](./docs/images)

## Freezed model
Freezed package is used in this project
Use this command
        `dart run build_runner watch --delete-conflicting-outputs`
to generate the model files
The common models will be find at [Common models](./lib/src/core/common/models)

## Clean code architecture
I followed uncle bob's clean code architecture
Our feature is divided based on concerns and according to SOLID into
        data -- Contains the models, repository 
        domain -- Contains the high level abstractions
        presentation -- Here contains teh controller and views (View and View Model)
Thus we are catering to MVVM 

## State Management 
We are using the GetX state management, check GetX State Management at https://pub.dev/packages/get

## Dependency Injection
We are using GetX dependency Injection
We have the common bindings at  [Common bindings](./lib/src/core/bindings/app_bindings.dart)

## Reusable
We have made certain widgets [Common widgets](./lib/src/core/common/widgets/)
and we have helpers as well taht can be reusbale [Helpers](./lib/src/core/helpers)
