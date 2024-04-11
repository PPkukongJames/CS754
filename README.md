# CS754
DATABASE GROUP 

## command

**- install environment :** conda env create -f environment.yml

**- active env :** conda activate advance-db

## NOTE

**- Create project :** django-admin startproject <project-name>

**- run server:** python manage.py runserver

**- create app:** python manage.py startapp <app-name> (หลังจากเพิ่มแล้วต้องใส่ชื่อแอพใน INSTALLED_APPS ของ setting.py)

**- block:** 

    - root : {% block <tag-name> % } ... {% endblock %}
    
    - leaf : {% extend "<file>.html" %} ... {% block <tag-name> % } HTML SYNTEX {% endblock %}

**- form:** use POST method ต้องใส่ {% csrf_token %}
<!--  NOT USE (hint) -> models 

Migration -> นำ model(domain class) ไปสร้าง table ใน database

- python manage.py makemigrations -> สร้างไฟล์ migration

- python manage.py makemigrate -> นำ app ไปใช้

- python manage.py createsuperuser -> สร้าง admin (ต้องไประบุ table ที่จัดการได้ใน admin.py ด้วย admin.site.register(<modelname>))

 -->
