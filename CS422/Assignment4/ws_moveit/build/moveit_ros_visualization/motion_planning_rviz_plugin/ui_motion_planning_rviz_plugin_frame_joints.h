/********************************************************************************
** Form generated from reading UI file 'motion_planning_rviz_plugin_frame_joints.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MOTION_PLANNING_RVIZ_PLUGIN_FRAME_JOINTS_H
#define UI_MOTION_PLANNING_RVIZ_PLUGIN_FRAME_JOINTS_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QTreeView>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MotionPlanningFrameJointsUI
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *joints_view_label_;
    QSpacerItem *horizontalSpacer;
    QRadioButton *radio_degree_;
    QRadioButton *radio_radian_;
    QTreeView *joints_view_;
    QLabel *nullspace_label;
    QVBoxLayout *nullspace_layout_;
    QSlider *dummy_ns_slider_;
    QButtonGroup *button_group_units_;

    void setupUi(QWidget *MotionPlanningFrameJointsUI)
    {
        if (MotionPlanningFrameJointsUI->objectName().isEmpty())
            MotionPlanningFrameJointsUI->setObjectName(QString::fromUtf8("MotionPlanningFrameJointsUI"));
        MotionPlanningFrameJointsUI->resize(400, 300);
        verticalLayout = new QVBoxLayout(MotionPlanningFrameJointsUI);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        joints_view_label_ = new QLabel(MotionPlanningFrameJointsUI);
        joints_view_label_->setObjectName(QString::fromUtf8("joints_view_label_"));

        horizontalLayout->addWidget(joints_view_label_);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        radio_degree_ = new QRadioButton(MotionPlanningFrameJointsUI);
        button_group_units_ = new QButtonGroup(MotionPlanningFrameJointsUI);
        button_group_units_->setObjectName(QString::fromUtf8("button_group_units_"));
        button_group_units_->addButton(radio_degree_);
        radio_degree_->setObjectName(QString::fromUtf8("radio_degree_"));
        radio_degree_->setChecked(true);

        horizontalLayout->addWidget(radio_degree_);

        radio_radian_ = new QRadioButton(MotionPlanningFrameJointsUI);
        button_group_units_->addButton(radio_radian_);
        radio_radian_->setObjectName(QString::fromUtf8("radio_radian_"));

        horizontalLayout->addWidget(radio_radian_);


        verticalLayout->addLayout(horizontalLayout);

        joints_view_ = new QTreeView(MotionPlanningFrameJointsUI);
        joints_view_->setObjectName(QString::fromUtf8("joints_view_"));
        joints_view_->setEditTriggers(QAbstractItemView::EditKeyPressed);
        joints_view_->setSelectionMode(QAbstractItemView::NoSelection);
        joints_view_->setRootIsDecorated(false);
        joints_view_->setItemsExpandable(false);
        joints_view_->setExpandsOnDoubleClick(false);

        verticalLayout->addWidget(joints_view_);

        nullspace_label = new QLabel(MotionPlanningFrameJointsUI);
        nullspace_label->setObjectName(QString::fromUtf8("nullspace_label"));

        verticalLayout->addWidget(nullspace_label);

        nullspace_layout_ = new QVBoxLayout();
        nullspace_layout_->setObjectName(QString::fromUtf8("nullspace_layout_"));
        dummy_ns_slider_ = new QSlider(MotionPlanningFrameJointsUI);
        dummy_ns_slider_->setObjectName(QString::fromUtf8("dummy_ns_slider_"));
        dummy_ns_slider_->setEnabled(false);
        dummy_ns_slider_->setMinimum(-1);
        dummy_ns_slider_->setMaximum(1);
        dummy_ns_slider_->setOrientation(Qt::Horizontal);

        nullspace_layout_->addWidget(dummy_ns_slider_);


        verticalLayout->addLayout(nullspace_layout_);


        retranslateUi(MotionPlanningFrameJointsUI);

        QMetaObject::connectSlotsByName(MotionPlanningFrameJointsUI);
    } // setupUi

    void retranslateUi(QWidget *MotionPlanningFrameJointsUI)
    {
        MotionPlanningFrameJointsUI->setWindowTitle(QApplication::translate("MotionPlanningFrameJointsUI", "Form", nullptr));
        joints_view_label_->setText(QApplication::translate("MotionPlanningFrameJointsUI", "Group joints:", nullptr));
        radio_degree_->setText(QApplication::translate("MotionPlanningFrameJointsUI", "degree", nullptr));
        radio_radian_->setText(QApplication::translate("MotionPlanningFrameJointsUI", "radian", nullptr));
#ifndef QT_NO_TOOLTIP
        nullspace_label->setToolTip(QApplication::translate("MotionPlanningFrameJointsUI", "The sliders below allow for jogging the nullspace of the current configuration,\n"
"i.e. trigger joint motions that don't affect the end-effector pose.\n"
"\n"
"Typically, redundant arms (with 7+ joints) offer such a nullspace.\n"
"However, also singular configurations provide a nullspace.\n"
"\n"
"Each basis vector of the (linear) nullspace is represented by a separate slider.", nullptr));
#endif // QT_NO_TOOLTIP
        nullspace_label->setText(QApplication::translate("MotionPlanningFrameJointsUI", "Nullspace exploration:", nullptr));
#ifndef QT_NO_TOOLTIP
        dummy_ns_slider_->setToolTip(QApplication::translate("MotionPlanningFrameJointsUI", "The slider will become active if the current robot configuration has a nullspace.\n"
"That's typically the case for redundant robots, i.e. 7+ joints, or singular configurations.", nullptr));
#endif // QT_NO_TOOLTIP
    } // retranslateUi

};

namespace Ui {
    class MotionPlanningFrameJointsUI: public Ui_MotionPlanningFrameJointsUI {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MOTION_PLANNING_RVIZ_PLUGIN_FRAME_JOINTS_H
