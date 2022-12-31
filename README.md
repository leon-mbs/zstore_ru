Zippy Store
========
Учетная программа (склад, торговля, создание) с веб-интерфейсом.
Предназначена для автоматизации малого бизнеса с упрощенной формой учета, не использующего
полноценный бухгалтерский учет.
   
Русифицированная (в  процессе перевода)   версия проекта: [https://github.com/leon-mbs/zstore](https://github.com/leon-mbs/zstore)
Домашняя страница: [https://zippy.com.ua/zstore](https://zippy.com.ua/zstore)

####
Основная функциональность
 
* управление складами
* закупка
* продажа
* учет курса валют при закупке
* учет платежей и взаиморасчеты с котрагентами
* партийный учет и учет по сериям производителя
* управление пользователями и доступом, личный кабинет пользователя
* работа с льдами и другие элементы CRM
* отчеты по продаже, закупке, движению товара
* услуги, задачи, календарь выполнения работ
* учет оборудования
* API для обмена с другими информационными системами, например интернет-магазином, написанном на другой платформе.
* поддержка сканера (клавиатурного) штрихкода 
* поддержка принтеров чеков и этикеток 
* разделение доступа между филиалом (например торговыми точками)
* модуль интеграции с Опенкарт
* модуль интеграции с Woocomerce
* интеграция с сервисами СМС рассылок
* модуль для общественного питания
* расчет зарплаты
* производство


Требования: PHP7.4+ MySQL 5.7+  


Настройка системы.
--------------------

   Создать БД (кодирование utf8_general_ci), выполнить SQL скрипты (папка DB) сначала структуру db.sql затем данные инициализации initdata.sql .
  
   Скопировать содержимое папки www в корневой каталог сайта.
   Выполнить composer.json для загрузки сторонних библиотек (или скопировать  готовую  папку  vendor с  [https://zippy.com.ua/download/fullzstore.zip](архива)  ).

  
   Конфигурационные файлы находятся в папке config.

   Установить параметры соединения с базой данных в файле config.php и Установить настройки почтового сервера.
   В общих настройках установите основные параметры рабочего окружения и включить необходимые модули .
   Также необходимо убедиться, что разрешено право записи в папки uploads и logs.
   Залогиниться дефолтным пользователем admin admin
   Изменить дефолтный пароль в профиле. 
   Задать персональные настройки профиля.
