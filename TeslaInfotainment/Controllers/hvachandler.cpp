#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent) : QObject(parent), m_targetTemperature(15)
{

}

int HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::incrementTargetTemperature(const int &val)
{
    int newTargetTemp = m_targetTemperature + val;
    settargetTemperature(newTargetTemp);
}

void HVACHandler::settargetTemperature(int targetTemperature)
{
    if (m_targetTemperature == targetTemperature)
        return;

    m_targetTemperature = targetTemperature;
    emit targetTemperatureChanged(m_targetTemperature);
}
