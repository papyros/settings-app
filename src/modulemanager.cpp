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

#include "modulemanager.h"

#include <QStandardPaths>
#include <QDebug>
#include <QDir>
#include <QFile>

ModuleManager::ModuleManager(QObject *parent) : QObject(parent)
{
    m_dirWatcher = new QFileSystemWatcher(modulePaths(), this);

    connect(m_dirWatcher, &QFileSystemWatcher::directoryChanged, this, [this](const QString& path) {
        qDebug() << "Modules path modified:" << path;
        reloadModules();
    });
}

QStringList ModuleManager::modulePaths()
{
    return QStandardPaths::locateAll(QStandardPaths::GenericDataLocation,
            "papyros-settings/modules", QStandardPaths::LocateDirectory);
}

void ModuleManager::classBegin()
{
    // Nothing to do...
}

void ModuleManager::componentComplete()
{
    reloadModules();
}

QQmlListProperty<Module> ModuleManager::personalModules()
{
    auto countFunc = [](QQmlListProperty<Module> *prop) {
        return static_cast<ModuleManager *>(prop->object)->m_personalModules.count();
    };
    auto atFunc = [](QQmlListProperty<Module> *prop, int index) {
        return static_cast<ModuleManager *>(prop->object)->m_personalModules.at(index);
    };
    return QQmlListProperty<Module>(this, 0, countFunc, atFunc);
}

QQmlListProperty<Module> ModuleManager::hardwareModules()
{
    auto countFunc = [](QQmlListProperty<Module> *prop) {
        return static_cast<ModuleManager *>(prop->object)->m_hardwareModules.count();
    };
    auto atFunc = [](QQmlListProperty<Module> *prop, int index) {
        return static_cast<ModuleManager *>(prop->object)->m_hardwareModules.at(index);
    };
    return QQmlListProperty<Module>(this, 0, countFunc, atFunc);
}

QQmlListProperty<Module> ModuleManager::systemModules()
{
    auto countFunc = [](QQmlListProperty<Module> *prop) {
        return static_cast<ModuleManager *>(prop->object)->m_systemModules.count();
    };
    auto atFunc = [](QQmlListProperty<Module> *prop, int index) {
        return static_cast<ModuleManager *>(prop->object)->m_systemModules.at(index);
    };
    return QQmlListProperty<Module>(this, 0, countFunc, atFunc);
}

void ModuleManager::reloadModules()
{
    Q_FOREACH (const QString &path, modulePaths()) {
        qDebug() << "Searching for modules in" << path;
        QDir dir(path);
        QStringList modules = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot, QDir::Name);

        Q_FOREACH (const QString &moduleName, modules) {
            QDir moduleDir(dir.absoluteFilePath(moduleName));
            QFile metadataFile(moduleDir.absoluteFilePath("metadata.json"));

            qDebug() << "Checking possible module:" << metadataFile.fileName();

            if (metadataFile.exists()) {
                qDebug() << "Found module!";
                Module *module = new Module(dir.absoluteFilePath(moduleName), this);

                switch (module->category()) {
                    case Module::PersonalCategory:
                        m_personalModules.append(module);
                        break;
                    case Module::HardwareCategory:
                        m_hardwareModules.append(module);
                        break;
                    case Module::SystemCategory:
                        m_systemModules.append(module);
                        break;
                    default:
                        qWarning() << "Module has an unkown category:" << module->categoryName();
                        break;
                }
            } else {
                qWarning() << "Module doesn't have a metadata file:" << moduleName;
            }
        }
    }

    qDebug() << m_personalModules.size() << "personal modules";
    qDebug() << m_hardwareModules.size() << "hardware modules";
    qDebug() << m_systemModules.size() << "system modules";

    emit modulesChanged();
}

void ModuleManager::setFilter(const QString& filter)
{
    if (filter != m_filter) {
        m_filter = filter;

        // TODO: Do something with the filter

        filterChanged();
    }
}
