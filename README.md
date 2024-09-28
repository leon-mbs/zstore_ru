Zippy-склад
========

Складская программа (склад, торговля, производство) с веб-интерфейсом.
Предназначена для автоматизации малого бизнеса с упрощенной формой учета, не использующего
полноценный бухгалтерский учет.
   
Русифицированная   версия проекта: [https://github.com/leon-mbs/zstore](https://github.com/leon-mbs/zstore)  
Версия  не включает  специфические для Украины  модули     
 


## Основная функциональность
 
* управление складами
* закупка
* продажа
* учет платежей и взаиморасчеты с контрагентами
* партионный учет и учет по сериям производителя
* управление пользователями и доступом, личный кабинет пользователя
* работа с лидами и другие элементы CRM
* отчеты по продаже, закупке, движению товара
* услуги, задачи, календарь выполнения работ
* учет оборудования
* API для обмена с другими информационными системами, например интернет-магазином, написанном на другой платформе.
* поддержка сканера (клавиатурного) штрихкода 
* поддержка принтеров чеков и этикеток 
* разделение доступа между филиалом (например торговыми точками)
* интеграция с Опенкарт
* интеграция с Woocomerce
* интеграция с сервисами СМС рассылок
* модуль для общепита
* расчет зарплаты
* производство


Требования: PHP8.1+ MySQL 5.7+  

## Установка системы.

   Создать БД (кодировка utf8_general_ci), выполнить SQL скрипт db/db.sql  .
  
   Скопировать содержимое папки www в корневой каталог сайта.
   Выполнить composer.json для загрузки сторонних библиотек (или скачать [готовую сборку](https://ru.zippy.com.ua/download/fullzstore.zip)  ).

   Скачать  [готовую  сборку](https://ru.zippy.com.ua/download/fullzstore.zip)  если нет возможности выплонить composer
  
   Конфигурационные файлы находятся в папке config.

   Задать параметры соединения с базой данных в файле config.php и  настройки почтового сервера.
   В общих настройках установите основные параметры рабочего окружения и включить необходимые модули .
   Также необходимо убедиться, что разрешено право записи в папки uploads и logs.
   Залогиниться дефолтным пользователем admin admin
   Изменить дефолтный пароль в профиле. 
   Задать персональные настройки профиля.

   
   
 

 
