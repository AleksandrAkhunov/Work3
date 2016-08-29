Процедура КопироватьФайлСВложенными(ТекущийФайл, КаталогКуда);
	Если ТекущийФайл.ЭтоКаталог() Тогда
		ФайлПроверки = Новый Файл(КаталогКуда + "\" + ТекущийФайл.Имя);
		Если НЕ ФайлПроверки.Существует() Тогда
			СоздатьКаталог(ФайлПроверки.ПолноеИмя);
		КонецЕсли;
		МассивФайлов = НайтиФайлы(ТекущийФайл.ПолноеИмя,"*.*");
		Для Каждого ТекущийФайл ИЗ МассивФайлов Цикл
			КопироватьФайлСВложенными(ТекущийФайл, ФайлПроверки.ПолноеИмя);
		КонецЦикла;
	Иначе
		КопироватьФайл(ТекущийФайл.ПолноеИмя,КаталогКуда+"\"+ТекущийФайл.Имя);
	КонецЕсли;
КонецПроцедуры

КаталогГит = Новый Файл(".git");
Если НЕ КаталогГит.Существует() Тогда
	ЗапуститьПриложение("git init");
КонецЕсли;
Если КаталогГит.Существует() Тогда
	КаталогХукс = Новый Файл(".git\hooks");
	Если НЕ КаталогХукс.Существует() Тогда
		СоздатьКаталог(".git\hooks");
	КонецЕсли;
КонецЕсли;
КаталогРепо = Новый Файл(ТекущийКаталог()).Путь;

КаталогПреКоммит = КаталогРепо + "precommit1c";
ПроверкаПреКоммит = Новый Файл(КаталогРепо + "precommit1c");
Если ПроверкаПреКоммит.Существует() Тогда
	МассивКаталогов = Новый Массив;
	МассивКаталогов.Добавить("ibService");
	МассивКаталогов.Добавить("tools");
	МассивКаталогов.Добавить("v8Reader");
	Для Каждого ВремКаталог ИЗ МассивКаталогов Цикл
		ФайлПроверки = Новый Файл(КаталогХукс.ПолноеИмя + "\"+ ВремКаталог);
		Если НЕ ФайлПроверки.Существует() Тогда
			СоздатьКаталог(КаталогХукс.ПолноеИмя + "\"+ВремКаталог);
		КонецЕсли;
		МассивФайлов = НайтиФайлы(КаталогПреКоммит + "\"+ВремКаталог,"*.*");
		Для Каждого ТекущийФайл ИЗ МассивФайлов Цикл
			КопироватьФайлСВложенными(ТекущийФайл,КаталогХукс.ПолноеИмя + "\"+ВремКаталог);
		КонецЦикла;
	КонецЦикла;
	КопироватьФайл(КаталогПреКоммит + "\pre-commit",КаталогХукс.ПолноеИмя + "\pre-commit");
	КопироватьФайл(КаталогПреКоммит + "\v8files-extractor.os",КаталогХукс.ПолноеИмя + "\v8files-extractor.os");
КонецЕсли;

МассивКаталогов = Новый Массив;
МассивКаталогов.Добавить("doc");
МассивКаталогов.Добавить("examples");
МассивКаталогов.Добавить("features");
МассивКаталогов.Добавить("lib");
МассивКаталогов.Добавить("license");
МассивКаталогов.Добавить("spec");
МассивКаталогов.Добавить("src");
МассивКаталогов.Добавить("tools");
МассивКаталогов.Добавить("vendor");
Для Каждого ВремКаталог ИЗ МассивКаталогов Цикл
	ФайлПроверки = Новый Файл(ВремКаталог);
	Если НЕ ФайлПроверки.Существует() Тогда
		СоздатьКаталог(ВремКаталог);
	КонецЕсли;
КонецЦикла;

ФайлПроверки = Новый Файл("README.md");
Если НЕ ФайлПроверки.Существует() Тогда
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Записать(ФайлПроверки.ПолноеИмя);
КонецЕсли;