/*
 * System Settings - Settings app for Papyros
 * Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtCore/QStandardPaths>
#include <QDebug>
#include <Papyros/KQuickConfig>

#include "modulemanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("Settings");
    app.setOrganizationDomain("papyros.io");
    app.setOrganizationName("Papyros");

#if QT_VERSION >= QT_VERSION_CHECK(5, 7, 0)
    app.setDesktopFileName("io.papyros.Settings.desktop");
#endif

    // Set the X11 WML_CLASS so X11 desktops can find the desktop file
    qputenv("RESOURCE_NAME", "io.papyros.Settings");

    // TODO: Remove after we add a QML module directly to Papyros.Core
    qmlRegisterType<KQuickConfig>("Papyros.Core", 0, 1, "KQuickConfig");

    qmlRegisterType<Module>();
    qmlRegisterType<ModuleManager>("io.papyros.settings", 0, 1, "ModuleManager");
    qmlRegisterType(QUrl("qrc:/qml/ModuleView.qml"), "io.papyros.settings", 0, 1, "ModuleView");
    qmlRegisterType(QUrl("qrc:/qml/Subheader.qml"), "io.papyros.settings", 0, 1, "Subheader");

    QQmlApplicationEngine engine(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    return app.exec();
}
