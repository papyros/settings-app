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

    Q_PROPERTY(QString id READ id CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QUrl iconSource READ iconSource CONSTANT)
    Q_PROPERTY(Category category READ category CONSTANT)
    Q_PROPERTY(QString categoryName READ categoryName CONSTANT)
    Q_PROPERTY(QStringList keywords READ keywords CONSTANT)
    Q_PROPERTY(QUrl componentUrl READ componentUrl CONSTANT)
    Q_PROPERTY(int priority READ priority CONSTANT)
    Q_PROPERTY(bool developerOnly READ developerOnly CONSTANT)

    Q_ENUMS(Category)

public:
    enum Category { UnknownCategory, PersonalCategory, HardwareCategory, SystemCategory };

    Module(const QString &path, QObject *parent = 0);

    QString id() const;
    QString name() const;
    QUrl iconSource() const;
    Category category() const;
    QString categoryName() const;
    QStringList keywords() const;
    QUrl componentUrl() const;
    int priority() const;
    bool developerOnly() const;

private:
    QJsonObject json;
    QString m_id;
    QString m_path;
};

#endif // MODULE_H
