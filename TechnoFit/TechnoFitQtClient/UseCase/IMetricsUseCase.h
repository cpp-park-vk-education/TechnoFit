#pragma once

class IMetricsUseCase
{
public:
    virtual void RefreshData(int user_id) = 0;
    virtual void ThreadRefresher(int user_id) = 0; 
    virtual ~IMetricsUseCase()
    {

    }
};