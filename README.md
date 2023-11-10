# Test task Intern Dev

Ruby 3.2.2  
Gems added: pg, dry-validation  
Tests using Minitest are added for dry-validation only  
How to run the application:  
1. docker-compose up --build  
2. docker-compose exec web rake db:migrate  

To test model validations:  
1. docker-compose exec web rails db:test:prepare  
2. docker-compose exec web rails test  

There is no controller test functions, to manually test api requests you will need Patient model instance, create it in rails console:  
1. docker-compose exec web rails c  
2. p = Patient.create(full_name:"John Doe")  
It will create a patient with ID 1 and the name John Doe; other parameters will be set to nil  
 
Routes manual testing in order:  

1. post '/consultation_requests' payload example:  
{"consultation_request": {
    "patient_id": 1,
    "request_text": "example text"
    }
}

2. post '/consultation_requests/:request_id/recommendations' set the request_id to 1, payload example:
{"recommendation": {
    "recommendation_text": "example text"
    }
}

3. get '/patients/:patient_id/recommendations', set the request_id to 1, no payload for this one

4. get '/make_api_request', this is route to get data from OpenFDA

Task:

**Задача**: Разработать backend для сервиса «Онлайн рекомендации»

**Описание**:
Создайте микросервис на Ruby, который будет предоставлять возможность пользователям (пациентам) отправлять запросы на консультацию с медицинскими специалистами и получать рекомендации на основе анализа их медицинских данных, полученных из внешнего API.

**Функционал**:

1. Отправка запросов на консультацию
2. Получение и анализ медицинских данных из внешнего API 3. Формирование и отправка рекомендаций пациентам

**Требования**:

1. Backend
    
    1.1. Разработать RESTful API на Ruby on Rails (или любом другом ruby фреймворке).
    
    1.2. Реализовать следующие модели:
    
    - Пациент (ФИО, дата рождения, номер телефона, email)
    
    - Запрос на консультацию (пациент, текст запроса, дата создания) 
    
    - Рекомендация (запрос на консультацию, текст рекомендации)
    
    1.3. Реализовать следующие endpoint’ы:
    - POST /consultation_requests - создание запроса на консультацию
    - POST /consultation_requests/:request_id/recommendations - создание рекомендации для конкретного запроса на консультацию
    - GET /patients/:patient_id/recommendations - получение списка рекомендаций для конкретного пациента

1.4. Интегрировать внешний API для анализа медицинских данных (можно использовать фиктивный API, который возвращает моковые данные, к примеру OpenFDA).

1.5. (Не обязательно) Реализовать механизм отправки уведомлений пациентам по email при получении новой рекомендации.

2. Database
    
    2.1. Использовать PostgreSQL.
    
    2.2. Продумать структуру базы данных и связи между таблицами.
    
3. Будет плюсом
    
    3.1. Использовать библиотеку dry-rb. 
    
    3.2. Покрыть код тестами.
    
    3.3. Докер
    

**Сдача задания:**

Разместить код в репозитории на GitHub.
    - POST /consultation_requests/:request_id/recommendations - создание рекомендации для конкретного запроса на консультацию
