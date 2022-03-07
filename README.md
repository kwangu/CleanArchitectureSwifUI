# CleanArchitectureSwifUI

SwiftUI와 Combine로 구성한 Clean Architecture Sample

<BR>
<BR>

# Layer 구분

![clean](https://user-images.githubusercontent.com/26737689/156976845-04989d1e-34f2-4e37-8abf-c0d6779c776b.png)

- Presentation Layer: UI 관련 레이어
- Domain Layer: 비즈니스 룰과 로직 담당 레이어
- Data Layer: 원격/로컬등 외부에서 데이터를 가져오는 레이어
- 각 레이어들의 Dependency 방향은 모두 원밖에서 원안쪽으로 향하고 있음
- UI를 담당하는 Presentation Layer는 MVVM 패턴으로 구현됨

<BR>

![R1280x0](https://user-images.githubusercontent.com/26737689/156977195-6d876abb-5bb8-47cb-b63c-e2a1b57b8173.png)

- Domain Layer에서 Data Layer를 실행 시킬 수 있는 이유는 Dependency Inversion 으로 구현되었기 때문

<BR>

###

Dependency Inversion이란?

- 각 모듈간의 의존성을 분리시키기 위해 추상화된 인터페이스만 제공하고 의존성은 외부에서 주입(Dependency Injection)시킴

<BR>
<BR>

# Reference

- https://eunjin3786.tistory.com/207
- https://medium.com/swlh/clean-architecture-for-swiftui-6d6c4eb1cf6a
- https://gon125.github.io/posts/SwiftUI를-위한-클린-아키텍처/

<BR>
<BR>

# ScreenShoot

![video](https://user-images.githubusercontent.com/26737689/156978608-6eb89f93-a490-48c9-9248-49964354c0d4.gif)
