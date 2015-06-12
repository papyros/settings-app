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

#ifndef MODULE_H
#define MODULE_H

#include <QObject>
#include <QUrl>
#include <QFile>
#include <QVariant>
#include <QJsonObject>

class Module : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QUrl iconSource READ iconSource CONSTANT)
    Q_PROPERTY(Category category READ category CONSTANT)
    Q_PROPERTY(QString categoryName READ categoryName CONSTANT)
    Q_PROPERTY(QStringList keywords READ keywords CONSTANT)
    Q_PROPERTY(QUrl componentUrl READ componentUrl CONSTANT)

    Q_ENUMS(Category)

public:
    enum Category {
        UnknownCategory,
        PersonalCategory,
        HardwareCategory,
        SystemCategory
    };

    Module(const QString &path, QObject *parent = 0);

    QString name() const { return json["name"].toString(); }
    QUrl iconSource() const { return json["iconSource"].toVariant().toUrl(); }
    Category category() const;
    QString categoryName() const { return json["category"].toString(); }
    QStringList keywords() const { return json["keywords"].toVariant().toStringList(); }
    QUrl componentUrl() const;

private:
    QJsonObject json;
    QString m_path;
};

#endif // MODULE_H
