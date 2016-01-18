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

#include "module.h"

#include <QFileInfo>
#include <QJsonDocument>

Module::Module(const QString &path, QObject *parent) : QObject(parent)
{
    m_id = QFileInfo(path).fileName();
    m_path = path;

    QFile metadataFile(path + "/metadata.json");

    if (!metadataFile.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open the module metadata");
        return;
    }

    json = QJsonDocument::fromJson(metadataFile.readAll()).object();
}

Module::Category Module::category() const
{
    if (categoryName() == "personal")
        return Module::PersonalCategory;
    else if (categoryName() == "hardware")
        return Module::HardwareCategory;
    else if (categoryName() == "system")
        return Module::SystemCategory;
    else
        return Module::UnknownCategory;
}

QUrl Module::componentUrl() const
{
    return QUrl("file://" + m_path + "/Main.qml");
}

QString Module::id() const
{
    return m_id;
}

QString Module::name() const
{
    return json["name"].toString();
}

QUrl Module::iconSource() const
{
    return json["iconSource"].toVariant().toUrl();
}

QString Module::categoryName() const
{
    return json["category"].toString();
}

QStringList Module::keywords() const
{
    return json["keywords"].toVariant().toStringList();
}

int Module::priority() const
{
    if (json.contains("priority")) {
        return json["priority"].toVariant().toInt();
    }
    else {
        return 1;
    }
}

bool Module::developerOnly() const
{
    if (json.contains("developerOnly")) {
        return json["developerOnly"].toVariant().toBool();
    }
    else {
        return false;
    }
}
