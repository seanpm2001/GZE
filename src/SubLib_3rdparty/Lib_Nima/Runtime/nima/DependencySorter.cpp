#include "DependencySorter.hpp"

using namespace nima;


void DependencySorter::sort(ActorComponent* root, std::vector<ActorComponent*>& order)
{
    order.clear();
    visit(root, order);
}

bool DependencySorter::visit(ActorComponent* component, std::vector<ActorComponent*>& order)
{
    if(m_Perm.find(component) != m_Perm.end())
    {
        return true;
    }
    if(m_Temp.find(component) != m_Temp.end())
    {
        fprintf(stderr, "Dependency cycle!\n");
        return false;
    }

    m_Temp.emplace(component);

    auto dependents = component->dependents();
    for(auto dependent : dependents)
    {
        if(!visit(dependent, order))
        {
            return false;
        }
    }
    m_Perm.emplace(component);
    order.insert(order.begin(), component);

    return true;
}
