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
#ifndef MODULEMANAGER_H
#define MODULEMANAGER_H

#include <QObject>
#include <QQmlListProperty>
#include <QQmlParserStatus>
#include <QFileSystemWatcher>

#include "module.h"

class ModuleManager : public QObject, public QQmlParserStatus
{
    Q_OBJECT
    Q_INTERFACES(QQmlParserStatus)

    Q_PROPERTY(QString filter READ filter WRITE setFilter NOTIFY filterChanged)
    Q_PROPERTY(QQmlListProperty<Module> personalModules READ personalModules NOTIFY modulesChanged)
    Q_PROPERTY(QQmlListProperty<Module> hardwareModules READ hardwareModules NOTIFY modulesChanged)
    Q_PROPERTY(QQmlListProperty<Module> systemModules READ systemModules NOTIFY modulesChanged)

public:
    ModuleManager(QObject *parent = 0);
    //~ModuleManager();

    // reimplemented virtual methods
    void classBegin();
    void componentComplete();

    QString filter() const { return m_filter; }

    QQmlListProperty<Module> personalModules();
    QQmlListProperty<Module> hardwareModules();
    QQmlListProperty<Module> systemModules();

public slots:
    void setFilter(const QString &filter);

Q_SIGNALS:
    void filterChanged();
    void modulesChanged();

private Q_SLOTS:
    void reloadModules();

private:
    QQmlListProperty<Module> qmlList(QList<Module *> &list);
    QStringList modulePaths();

    QFileSystemWatcher *m_dirWatcher;
    QString m_filter;
    QList<Module *> m_personalModules;
    QList<Module *> m_hardwareModules;
    QList<Module *> m_systemModules;
};

#endif // MODULEMANAGER_H
