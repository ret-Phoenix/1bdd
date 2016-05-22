﻿#Использовать logos

Перем Лог;
Перем БДД;

Перем ПомощникТестирования;
Перем НаборФичКаталогаПроекта;

Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯВыполнилПодключениеТестовогоСкрипта");
	ВсеШаги.Добавить("ЯПодготовилТестовыйКаталогДляФич");
	ВсеШаги.Добавить("УстановилТестовыйКаталогКакТекущий");
	ВсеШаги.Добавить("ЯПодготовилСпециальнуюТестовуюФичу");
	ВсеШаги.Добавить("ЯПодставилФайлШаговСУжеРеализованнымиШагамиДляФичи");
	ВсеШаги.Добавить("ЯЗапустилВыполнениеФичи");
	ВсеШаги.Добавить("ПроверкаПоведенияФичиЗакончиласьСКодомВозврата");
	ВсеШаги.Добавить("ЯПолучилНаборФичИзКаталогаФичПроектаИсключаяТекущуюФичу");
	ВсеШаги.Добавить("УстановилКаталогаФичПроектаКакТекущий");
	ВсеШаги.Добавить("ПроверкаПоведенияКаждойФичиИзНабораФичЗакончиласьСКодомВозврата");
	ВсеШаги.Добавить("ПроверкаПоведенияФичИзКаталогаЗакончиласьСКодомВозврата");

	Возврат ВсеШаги;
КонецФункции

//я выполнил подключение тестового скрипта "ПроверкаГенерации"
Процедура ЯВыполнилПодключениеТестовогоСкрипта(ИмяСкрипта) Экспорт
	 ПомощникТестирования = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, ИмяСкрипта+".os"));

	 ДопЛог = Логирование.ПолучитьЛог(ПомощникТестирования.ИмяЛога());
	 ДопЛог.УстановитьУровень(Лог.Уровень());
КонецПроцедуры

//я подготовил тестовый каталог для фич
Процедура ЯПодготовилТестовыйКаталогДляФич() Экспорт
	 ПомощникТестирования.ЯПодготовилТестовыйКаталогДляФич();
КонецПроцедуры

//я подготовил специальную тестовую фичу "ПередачаПараметров"
Процедура ЯПодготовилСпециальнуюТестовуюФичу(ИмяФичи) Экспорт
	ПомощникТестирования.ЯПодготовилСпециальнуюТестовуюФичу(ИмяФичи);
КонецПроцедуры

//я запустил выполнение фичи "ПередачаПараметров"
Процедура ЯЗапустилвыполнениеФичи(ИмяФичи) Экспорт
КонецПроцедуры

//проверка поведения фичи "ПередачаПараметров" закончилась со статусом "Пройден"
Процедура ПроверкаПоведенияФичиЗакончиласьСоСтатусом(ИмяФичи, ОжидаемыйСтатусВыполненияСтрока) Экспорт
	ПомощникТестирования.ПроверкаПоведенияФичиЗакончиласьСоСтатусом(ИмяФичи, ОжидаемыйСтатусВыполненияСтрока);
КонецПроцедуры

//я подставил файл шагов с уже реализованными шагами для фичи "ПередачаПараметров"
Процедура ЯПодставилФайлШаговСУжеРеализованнымиШагамиДляФичи(ИмяФичи) Экспорт
	ПомощникТестирования.ЯПодставилФайлШаговСУжеРеализованнымиШагамиДляФичи(ИмяФичи);
КонецПроцедуры

//проверка поведения фич из каталога "." закончилась со статусом "Пройден"
Процедура ПроверкаПоведенияФичИзКаталогаЗакончиласьСоСтатусом(ПутьКаталога, ОжидаемыйСтатусВыполненияСтрока) Экспорт
	ПомощникТестирования.ПроверкаПоведенияФичиЗакончиласьСоСтатусом(ПутьКаталога, ОжидаемыйСтатусВыполненияСтрока);
КонецПроцедуры

//проверка поведения фичи "ПередачаПараметров" закончилась с кодом возврата 0
Процедура ПроверкаПоведенияФичиЗакончиласьСКодомВозврата(ИмяФичиИлиПутьКаталога, ОжидаемыйКодВозврата) Экспорт
	ПомощникТестирования.ПроверкаПоведенияФичиЗакончиласьСКодомВозврата(ИмяФичиИлиПутьКаталога, ОжидаемыйКодВозврата);
КонецПроцедуры

//проверка поведения фич из каталога "." закончилась с кодом возврата 0
Процедура ПроверкаПоведенияФичИзКаталогаЗакончиласьСКодомВозврата(Знач ПутьКаталога, Знач ОжидаемыйКодВозврата) Экспорт
	Если ПутьКаталога = "ТестовыйПолный" Тогда
		ПутьКаталога = ПомощникТестирования.ВременныйКаталогФичи.ПолноеИмя;
	ИначеЕсли ПутьКаталога = "ТестовыйОтносительный" Тогда
		ПутьКаталога = ОбъединитьПути("..", ПомощникТестирования.ВременныйКаталогФичи.Имя);
	КонецЕсли;
	ПомощникТестирования.ПроверкаПоведенияФичИзКаталогаЗакончиласьСКодомВозврата(ПутьКаталога, ОжидаемыйКодВозврата);
КонецПроцедуры

//я получил набор фич из каталога фич проекта исключая текущую фичу
Процедура ЯПолучилНаборФичИзКаталогаФичПроектаИсключаяТекущуюФичу() Экспорт
	 НаборФичКаталогаПроекта = НайтиФайлы(КаталогФич().ПолноеИмя, "*.feature");
	 ФайлТекущегоСценария = Новый Файл(ТекущийСценарий().Источник);
	 Номер = -1;
	 Для каждого ФайлФичи Из НаборФичКаталогаПроекта Цикл
		 Номер = Номер + 1;
		Если ФайлФичи.ИмяБезРасширения = ФайлТекущегоСценария.ИмяБезРасширения Тогда
	 		НаборФичКаталогаПроекта.Удалить(Номер);
			Прервать;
	 	КонецЕсли;
	 КонецЦикла;
КонецПроцедуры

//проверка поведения каждой фичи из набора фич закончилась с кодом возврата 0
Процедура ПроверкаПоведенияКаждойФичиИзНабораФичЗакончиласьСКодомВозврата(ОжидаемыйКодВозврата) Экспорт
	Для каждого ФайлФичи Из НаборФичКаталогаПроекта Цикл
		ИмяФичи = ФайлФичи.ИмяБезРасширения;
		ПомощникТестирования.ПроверкаПоведенияФичиЗакончиласьСКодомВозврата(ИмяФичи, ОжидаемыйКодВозврата);
	КонецЦикла;
КонецПроцедуры

//установил каталога фич проекта как текущий
Процедура УстановилКаталогаФичПроектаКакТекущий() Экспорт
	УстановитьТекущийКаталог(КаталогФич().ПолноеИмя);
КонецПроцедуры

//установил тестовый каталог как текущий
Процедура УстановилТестовыйКаталогКакТекущий() Экспорт
	 ПомощникТестирования.УстановилТестовыйКаталогКакТекущий();
КонецПроцедуры


Функция КаталогФич()
	Возврат Новый Файл(ОбъединитьПути(ТекущийСценарий().Каталог, ".."));
КонецФункции // КаталогФич()

Лог = Логирование.ПолучитьЛог("bdd.ВыполнениеФич.feature");
//Лог.УстановитьУровень(УровниЛога.Отладка);
