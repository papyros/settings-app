/*
 * System Settings - Settings app for Papyros
 * Copyright (C) 2015-2016 Michael Spencer <sonrisesoftware@gmail.com>
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

bool higherPriorityFirst(const Module *module1, const Module *module2)
{
    return module1->priority() > module2->priority();
}

ModuleManager::ModuleManager(QObject *parent) : QObject(parent)
{
    m_dirWatcher = new QFileSystemWatcher(modulePaths(), this);

    connect(m_dirWatcher, &QFileSystemWatcher::directoryChanged, this, [this](const QString &path) {
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

void ModuleManager::reloadModules()
{
    m_modules.clear();

    QList<Module *> personalModules;
    QList<Module *> hardwareModules;
    QList<Module *> systemModules;

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

                m_modules << module;

                switch (module->category()) {
                case Module::PersonalCategory:
                    personalModules << module;
                    break;
                case Module::HardwareCategory:
                    hardwareModules << module;
                    break;
                case Module::SystemCategory:
                    systemModules << module;
                    break;
                default:
                    qWarning() << "Module has an unkown category:" << module->categoryName();
                    break;
                }
            }
            else {
                qWarning() << "Module doesn't have a metadata file:" << moduleName;
            }
        }
    }

    std::sort(personalModules.begin(), personalModules.end(), higherPriorityFirst);
    std::sort(hardwareModules.begin(), hardwareModules.end(), higherPriorityFirst);
    std::sort(systemModules.begin(), systemModules.end(), higherPriorityFirst);

    m_personalModules = personalModules;
    m_hardwareModules = hardwareModules;
    m_systemModules = systemModules;
}

void ModuleManager::setFilter(const QString &filter)
{
    if (filter != m_filter) {
        m_filter = filter;

        // TODO: Do something with the filter

        filterChanged();
    }
}

Module *ModuleManager::getModule(QString id) const
{
    QList<Module *> modules = m_modules;

    foreach (Module *module, modules) {
        if (module->id() == id)
            return module;
    }

    return nullptr;
}
