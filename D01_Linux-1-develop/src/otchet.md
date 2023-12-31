## Part 1. Установка ОС

- Версия, полученная с помощью команды `cat /etc/issue`.

![1part](src/Screenshot/1.png)
## Part 2. Создание пользователя

- Новый пользователь с правами adm был создан с помощью команды `sudo useradd -G adm test_2`. С помощью запроса `cat /etc/passwd` можно увидеть нового пользователя.

![2part](src/Screenshot/2.png)

## Part 3. Настройка сети ОС


- Название машины (hostname) задается командой `sudo vim /etc/hostname`.
- Часовой пояс устанавливается командой `sudo timedatectl set-timezone Europe/Moscow`.
- Названия сетевых интерфейсов с помощью консольной команды можно получить командой `ls /sys/class/net`. Сетевые интерфейсы данной системы: enp0s3, **lo (loopback device)** – виртуальный интерфейс, присутствующий по умолчанию в любом Linux. Он используется для отладки сетевых программ и запуска серверных приложений на локальной машине. С этим интерфейсом всегда связан адрес 127.0.0.1.
- **DHCP** — сетевой протокол, позволяющий сетевым устройствам автоматически получать IP-адрес и другие параметры, необходимые для работы в сети TCP/IP. Данный протокол работает по модели «клиент-сервер».
- Определение и вывод на экран внешний ip-адрес шлюза (ip) и внутренний IP-адрес шлюза, он же ip-адрес по умолчанию (gw). Это можно реализовать с помощью команды.

![3part](src/Screenshot/3.png)

- Задать статичные (заданные вручную, а не полученные от DHCP сервера) настройки ip, gw, dns. Необходимо определить файл конфигурации с помощью команды ls /etc/netplan/, таковым в нашем случае является `00-installer-config.yaml`.
Далее необходимо перейти к редактированию этого файла с помощью vim - `sudo vim /etc/netplan/00-installer-config.yaml`. Параметр `dhcp` устанавливаем на `no`. `addresses` - `10.0.2.0/24`. `gateway4` - `10.0.2.2`. `nameservers: addresses:` - `[8.8.8.8, 1.1.1.1]`. Сохраняем изменения - `sudo netplan apply`.
Проверяем изменения с помощью команды `ip route show`. После перезагрузки виртуальной машины настройки статического IP-адреса остались такими же.

- Успешное пропингование удаленных хостов 1.1.1.1 и ya.ru. `ping 1.1.1.1` и `ping ya.ru`.
 
![ya.ru](src/Screenshot/5.png)

![1.1.1.1](src/Screenshot/6.png)

## Part 4. Обновление ОС

- Обновление системы можно выполнить с помощью команды `sudo apt-get upgrade`. Для проверки списков пакетов используется функция `sudo apt-get update`. Перед обновлением были слдующие пакеты: 

![Список пакетов](src/Screenshot/7.png) 

- После выполнения обновлений, проверяем, снова запустив команду обновления системы.

![После обновления](src/Screenshot/8.png)

## Part 5. Использование команды sudo

- Команда sudo может использоваться для выполнения пользователем какой-либо команды, требующей права суперпользователя (root), то есть получение прав root для выполнения какой-либо команды на время её выполнения.
- Чтобы разрешить пользователю выполнять команду `sudo` необходимо выполнить команду `usermod -aG sudo test_2`.

![Права root](src/Screenshot/9.png)

- Далее было необходимо переключиться между пользователями с помощью команды `sudo su test_2` и ввести команду для изменения hostname.

![Смена пользователя](src/Screenshot/10.png)

- Ниже представлены скриншоты изменения hostname с 'user-1' на 'user-test-2' и подтверждение изменений.

![Старый hostname](src/Screenshot/11.png)

![Новый hostname](src/Screenshot/12.png)

![Изменения](src/Screenshot/13.png)

## Part 6. Установка и настройка службы времени

- Для вывода времени, часового пояса, в котором находишься необходимо использовать команду `timedatectl`.
- Для получения необходимого вывода `NTPSynchronized=yes`, необходимо использовать команду `timedatectl show`.

![Время](src/Screenshot/14.png)

## Part 7. Установка и использование текстовых редакторов

- Для установки текстовых рдакторов необходимо использовать команду `sudo apt install редактор`. Пакет **VIM** уже установлен, как и **NANO**, поэтому вывод следующий. Полный процесс установки был при **JOE**.

![](src/Screenshot/15.png)

- Для создания файла в VIM необходимо выполнить команду `vim test_vim.txt`, в NANO необходимо выполнить команду `nano test_vim.txt`, JOE необходимо выполнить команду `joe test_vim.txt`.  
-  Для выхода с сохранением из VIM необходимо нажать **Esc -> ввести :wq -> Enter**, из NANO - **Ctrl + X -> Y -> Enter**, из JOE **Ctrl + K -> Q -> Y**.

![](src/Screenshot/16.png)

![](src/Screenshot/17.png)

![JOE создание](src/Screenshot/18.png)

- Для выхода без сохранения из VIM необходимо нажать **Esc -> ввести :q! -> Enter**, из NANO - **Ctrl + X -> N**, из JOE **Ctrl + K -> Q -> N**.

![VIM без сохр](src/Screenshot/19.png)

![NANO без сохр](src/Screenshot/20.png)

![JOE без сохр](src/Screenshot/21.png)

- Для поиска в VIM необходимо ввесть **/что ищем**, для замены **:s/что меняем/на что меняем**.

![Поиск VIM](src/Screenshot/22.png)

![Замена VIM](src/Screenshot/23.png)

- В NANO для поиска - **Ctrl + W -> что ищем -> Enter**, для замены - **Ctrl + \ -> что меняем -> на что меняем -> да/нет**.

![Поиск NANO](src/Screenshot/24.png)

![Замена NANO](src/Screenshot/25.png)

- В JOE для поиска - **Ctrl + KF -> что ищем -> Enter**, для замены - **Ctrl + KF -> что ищем -> R -> на что меняем -> Enter -> Y**.

![Поиск JOE](src/Screenshot/26.png)

![Замена JOE](src/Screenshot/27.png)

## Part 8. Установка и базовая настройка сервиса SSHD

- Для установки SSHd использовалась функция `sudo apt-get install ssh` и `sudo apt install openssh-server`.
- Добавление пакета в автозагрузку `sudo systemctl enable sshd`.
- Проверка работы SSHd `systemctl status sshd`.
- Для смены порта через текстовый редактор открывем файл `/etc/ssh/sshd_config` через nano. Убираем символ # и вместо `Port 22` вводим `Port 2022`.
- Команда ps является очень гибким инструментом для определения работающих в системе программ и оценки используемых ими ресурсов. Она выводит статистику и информацию о состоянии процессов в системе, в том числе ИД процесса или нити, объем выполняемого ввода-вывода и используемый объем ресурсов процессора и памяти. `ps опции | grep параметр`.
A, -e, (a) - выбрать все процессы;
-a - выбрать все процессы, кроме фоновых;
-d, (g) - выбрать все процессы, даже фоновые, кроме процессов сессий;
-N - выбрать все процессы кроме указанных;
-С - выбирать процессы по имени команды;
-G - выбрать процессы по ID группы;
-p, (p) - выбрать процессы PID;
--ppid - выбрать процессы по PID родительского процесса;
-s - выбрать процессы по ID сессии;
-t, (t) - выбрать процессы по tty;
-u, (U) - выбрать процессы пользователя.

![ps](src/Screenshot/28.png)

- Вывод соответсвует заданному

![netstat](src/Screenshot/29.png)

- Ключ -tan означает: t - просмотр только tcp соединений, a - показать состояние всех сокетов; обычно сокеты, используемые серверными процессами, не показываются, n - показывать сетевые адреса как числа. netstat обычно показывает адреса как символы. Эту опцию можно использовать с любым форматом показа. 
- Proto - протокол (tcp, udp, raw), используемый сокетом.
- Recv-Q - счётчик байт не скопированных программой пользователя из этого сокета.
- Send-Q - счётчик байтов, не подтверждённых удалённым узлом.
- Локальный адрес (Local address)— это адрес, к которому привязан рассматриваемый сокет .
- Внешний адрес (Foreign Address) — IP-адрес и номер порта удаленного компьютера, к которому подключен сокет . Имена, соответствующие IP-адресу и порту, отображаются, если не указан параметр -n. Если порт еще не установлен, номер порта отображается звездочкой (*).
- State - статус состояния TCP-соединения. LISTEN - сокет ожидает входящих подключений. Такие сокеты не включаются в вывод, пока вы не укажете опцию --listening (-l) или --all (-a).

## Part 9. Установка и использование утилит top, htop

- Uptime - up 2:33.
- Количество авторизованных пользователей - 1 user.
- Общая загрузка системы - load avererage: 0,00 0,00 0,00.
- Общее количество процессов - tasks 112 total, 1 running, 111 sleeping.
- Загрузка CPU - 0,0 us, 0,0 ni, 100 id, 0,0 wa, 0,0 hi, o,o si, 0,0 st.
- Загрузка памяти - 3920,0 total, 3047,8 free, 170,3 used, 701,9 buff/cache.
- PID процесса, занимающего больше всего памяти - 665 (0,9 % MEM - доля задачи в использовани памяти, 18728 RES - используемая оперативная память, является подмножеством VIRT, представляет физическую память, не помещённую в раздел подкачки, которую в текущий момент использует задача. Также является суммой полей RSan, RSfd и Rssh.).
- PID процесса, занимающего больше всего процессорного времени - 13 (00:04.84).

![top](src/Screenshot/30.png)

- Сортировка по PID.

![htop](src/Screenshot/31.png)

- Сортировка по PERCENT_CPU.

![htop](src/Screenshot/32.png)

- Сортировка по PERCENT_MEM.

![htop](src/Screenshot/33.png)

- Сортировка по TIME.

![htop](src/Screenshot/34.png)

- Фильтр для процессов sshd.

![htop](src/Screenshot/35.png)

- С процессом syslog, найденным, используя поиск.

![htop](src/Screenshot/36.png)

- С добавленным выводом hostname, clock и uptime.

![htop](src/Screenshot/37.png)

## Part 10. Использование утилиты fdisk

- Название жесткого диска - sda (модель VBOX HARDDISK).

- Размер - 30 Гб.

- Количество секторов - 62 914 560 (sda1 - 1 Mб (2048), sda2 - 2 Гб (4 194 304), sda3 - 28 Гб (58 714 112)).

![htop](src/Screenshot/38.png)

- Размер swap - 2,9 Гб.

![htop](src/Screenshot/39.png)

## Part 11. Использование утилиты df

- Для корневого раздела (/) (команда `df`) размер раздела - 14 339 080 (1K-blocks).
Размер занятого пространства - 5 633 476 (Used).

- Размер свободного пространства - 7 955 424 (Availabale).

- Процент использования - 42% (Use%).

![htop](src/Screenshot/40.png)

- Для корневого раздела (/) (команда `df -Th`) размер раздела - 14 Гб (Size).
Размер занятого пространства - 5,4 (Used).

- Размер свободного пространства - 7,6 (Availabale).

- Процент использования - 42% (Use%).

## Part 12. Использование утилиты du

- Вывод команды `du`.

![htop](src/Screenshot/41.png)

- Вывод размера папок /home, /var, /var/log (в байтах, в человекочитаемом виде).

![htop](src/Screenshot/42.png)

- Вывод размера всего содержимого в /var/log.

![htop](src/Screenshot/43.png)

## Part 13. Установка и использование утилиты ncdu

- Размер папок /home, /var, /var/log с помощью ncdu.

![htop](src/Screenshot/44.png)

![htop](src/Screenshot/45.png)

![htop](src/Screenshot/46.png)

## Part 14. Работа с системными журналами

- Время последней успешной авторизации - Вторник Август 29 14:54.

- Имя пользователя - user_1.

- Метод входа в систему - tty1 (виртуальный терминал, вход по логину и паролю).

![htop](src/Screenshot/47.png)

- Логи перезапуска SSHd.

![htop](src/Screenshot/48.png)

![htop](src/Screenshot/49.png)

## Part 15. Использование планировщика заданий CRON

- Строчки в системных журналах о выполнении задания для CRON.

![htop](src/Screenshot/50.png)

- Список текущих заданий для CRON (пользователь user_1).

![htop](src/Screenshot/51.png)

 - Удаленные задачи из планировщика заданий.
 
 ![htop](src/Screenshot/52.png)
