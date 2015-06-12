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

#include "modulemanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("Settings");
    app.setOrganizationDomain("papyros.io");
    app.setOrganizationName("Papyros");

    qmlRegisterType<Module>();
    qmlRegisterType<ModuleManager>("io.papyros.settings", 0, 1, "ModuleManager");

    QString fileName = QStandardPaths::locate(QStandardPaths::GenericDataLocation,
            QStringLiteral("papyros-settings/app/main.qml"));

    if (fileName.isEmpty()) {
        qWarning() << "Failed to find the main QML file, aborting.";
        return 1;
    }

    QQmlApplicationEngine engine(fileName);
    return app.exec();
}
