#include "system.h"
#include <QDateTime>
#include <QDebug>

System::System(QObject *parent)
    : QObject(parent), m_carLocked(true), m_outdoorTemp(32), m_name("Junho"), m_currentTime("12:34am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

QString System::name() const
{
    return m_name;
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCarLocked(bool carLocked)
{
    if(m_carLocked == carLocked)
        return;
    m_carLocked = carLocked;
    emit carLockedChanged(m_carLocked);
}

void System::setOutdoorTemp(int outdoorTemp)
{
    if(m_outdoorTemp == outdoorTemp)
        return;
    m_carLocked = outdoorTemp;
    emit outdoorTempChanged(m_outdoorTemp);
}

void System::setName(QString name)
{
    if (m_name == name)
        return;

    m_name = name;
    emit nameChanged(m_name);
}

void System::setcurrentTime(QString currentTime)
{
    if (m_currentTime == currentTime)
        return;

    m_currentTime = currentTime;
    emit currentTimeChanged(m_currentTime);
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm ap");
    setcurrentTime(currentTime);

    m_currentTimeTimer->start();
}
