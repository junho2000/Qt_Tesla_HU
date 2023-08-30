#ifndef AUDIOCONTROLLER_H
#define AUDIOCONTROLLER_H

#include <QObject>

class AudioController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setvolumeLevel NOTIFY volumeLevelChanged)
    int m_volumeLevel;

public:
    explicit AudioController(QObject *parent = nullptr);
    int volumeLevel() const;
    Q_INVOKABLE void incrementVolume(const int &val);

signals:
    void volumeLevelChanged(int volumeLevel);

public slots:
    void setvolumeLevel(int volumeLevel);

};

#endif // AUDIOCONTROLLER_H
