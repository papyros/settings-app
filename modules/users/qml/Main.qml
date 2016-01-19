/*
 * System Settings - Settings app for Papyros
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
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
import QtQuick 2.4
import Material 0.2
import Material.Extras 0.1
import Material.ListItems 0.1 as ListItem
import Papyros.Desktop 0.1
import io.papyros.settings 0.1
import QtAccountsService 1.0

ModuleView {

    ListItem.Subheader {
        text: "Your Account"
        textColor: Theme.accentColor
    }

    UserListItem {
        iconSource: currentUser.iconFileName
        text: currentUser.realName
        subText: currentUser.userName
        isAdminUser: currentUser.accountType == UserAccount.AdministratorAccountType
    }

    ListItem.Subheader {
        text: "Other Accounts"
        textColor: Theme.accentColor

        // Only show if larger than one because the first user
        // is the current user and is hidden
        visible: userRepeater.count > 1
    }

    Repeater {
        id: userRepeater
        model: userModel
        delegate: UserListItem {
            iconSource: iconFileName
            text: realName
            subText: userName
            isAdminUser: accountType == UserAccount.AdministratorAccountType
            visible: userId != currentUser.uid
        }
    }

    UserAccount {
        id: currentUser
    }

    UsersModel {
        id: userModel
    }
}
