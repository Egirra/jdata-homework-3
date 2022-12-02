# Домашнее задание к занятию 2: JDBC API, JdbcTemplate, NamedParametersJdbcTemplate
## Задача 1: DAO слой

### Описание
Попрактикуемся в работе с Spring JDBC, попутно закрепляя уже пройденные темы. Вам надо написать приложение для работы с БД, использую скрипты, который вы написали во [втором задании](../../sql-agg/task/README.md)

1. Создайте spring boot приложение, с зависимостями на два starter'а - `spring-boot-starter-jdbc` и `spring-boot-starter-web`

2. Перенесите скрипт создания таблицы в файл `schema.sql`, чтобы spring boot автоматически создавал таблицу.

2. Перенесите скрипт запроса из второго задания в папку `resources`. Перепишите скрипт так, чтобы она возвращал `product_name` для именованного параметра `name`(а не только для `alexey`), который вы будете передавать в методы выполнения скрипта `NamedParameterJdbcTemplate` вместе со скриптом запроса.

3. Напишите репозиторий для работы с БД. Для этого:
- создайте класс и пометьте его аннотацией Repository, либо создайте бин репозитория в Java config классе
- добавьте в поле класса String, которое содержит ваше содержание вашего скрипта. Само содержание вы можете считать с помощью кода ниже. Вам надо будет передать в метод `read` название вашего скрипта, который лежит в папке `resources`. Например так: `read(myScript.sql)`.
- создайте метод `getProductName(String name)`, который будет принимать имя и возвращать название продукта из базы данных.
```java
private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
``` 

4. Напишите контроллер, с методом-обработчиком GET-метода запроса с маппингом на endpoint `/products/fetch-product`. В query params запроса будет приходить строковый параметр `name`, который вам надо будет передавать дальше в репозиторий. То есть, ваш метод должен уметь обрабатывать запрос вида `localhost:8080/products/fetch-product?name=Ivan`.
   Контроллер должен будет возвращать название продукта, который он получит от репозитория.

5. Написанный код выложите в отдельный репозиторий на гитхабе и прикрепите ссылку на него в домашнем задании.