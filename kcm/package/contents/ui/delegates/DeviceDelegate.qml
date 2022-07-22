/*
    SPDX-FileCopyrightText: 2020 Aditya Mehra <aix.m@outlook.com>
    SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents2
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.kirigami 2.12 as Kirigami
import QtGraphicalEffects 1.14

ItemDelegate {
    id: delegate

    implicitWidth: connectionView.width
    implicitHeight: Kirigami.Units.gridUnit * 4
    property QtObject deviceObj: model
    
    Behavior on implicitWidth {
        NumberAnimation {
            duration: Kirigami.Units.longDuration
            easing.type: Easing.InOutQuad
        }
    }
    
    Keys.onReturnPressed: {
        clicked();
    }
    
    onClicked: {
        deviceSetupView.forceActiveFocus()
    }

    contentItem: Item {
        id: deviceItemLayout
        
        Item {
            id: deviceSvgIcon
            width: PlasmaCore.Units.iconSizes.huge
            height: width
            y: deviceItemLayout.height / 2 - deviceSvgIcon.height / 2
            
            PlasmaCore.IconItem {
                anchors.centerIn: parent
                source: model.deviceIconName
                width: Kirigami.Units.iconSizes.large
                height: width
            }
        }
        
        ColumnLayout {
            id: textLayout
            
            anchors {
                left: deviceSvgIcon.right
                right: deviceItemLayout.right
                top: deviceSvgIcon.top
                bottom: deviceSvgIcon.bottom
                leftMargin: Kirigami.Units.smallSpacing
            }

            PlasmaComponents.Label {
                id: deviceNameLabel
                Layout.fillWidth: true
                visible: text.length > 0
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                maximumLineCount: 2
                textFormat: Text.PlainText
                color: Kirigami.Theme.textColor
                text: i18n(model.deviceName)
            }
        }
    }
}
