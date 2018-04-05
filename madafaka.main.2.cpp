#include<bits/stdc++.h>
using namespace std;

class SymbolInfo
{
private:
    string name;
    string type;


public:
    SymbolInfo* next;

    SymbolInfo(string name,string type)
    {
        this->name= name;
        this->type= type;
        this->next= NULL;
    }
    void set_name(string name)
    {
        this->name=name;
    }

    void set_type(string type)
    {
        this->type=type;
    }

    string get_name()
    {
        return this->name;
    }
    string get_type()
    {
        return this->type;
    }
};


class ScopeTable
{
private:
    SymbolInfo** s_info;
    int n;

public:

    ScopeTable* parentScope;
    int id;


    // constructor
    ScopeTable(int n)
    {
        this->n=n;
        this->parentScope=NULL;
        s_info = new SymbolInfo*[n];
        for (int i = 0; i < n; i++)
            s_info[i] = NULL;
    }

    //destructor
    ~ScopeTable()
    {
        for (int i = 0; i <n ; ++i)
        {
            SymbolInfo* entry = s_info[i];
            while (entry != NULL)
            {
                SymbolInfo* prev = entry;
                entry = entry->next;
                delete prev;
            }
        }
        delete[] s_info;
    }

    //getter method
    int get_size()
    {
        return this->n;
    }

    //print function
    void Print()
    {
        int n=get_size();
        SymbolInfo* entry;
        for (int i = 0; i < n; i++)
        {
            cout<<i;
            entry= s_info[i];
            while(entry!=NULL)
            {
                cout<<"=>"<<entry->get_name()<<"--"<<entry->get_type();
                entry=entry->next;
            }
            cout<<endl;
        }

    }

    //hash_function

    int HashFunction(string key)
    {

        int ind=0;
        for (int i = 0; i < key.length(); i++)
        {
            ind=ind*13 + key.at(i);
        }
        return ind%get_size();
    }


    //insert function
    bool Insert(string name, string type)
    {
        int ind = HashFunction(name);
        SymbolInfo* prev = NULL;
        SymbolInfo* entry = s_info[ind];
        while (entry != NULL)
        {
            prev = entry;
            entry = entry->next;
        }
        if (entry == NULL)
        {
            entry = new SymbolInfo(name, type);
            if (prev == NULL)
            {
                s_info[ind] = entry;
                return true;
            }
            else
            {
                prev->next = entry;
                return true;
            }
        }
        //else
        //{
        //entry->value = value;
        //}
        return false;
    }


    //search function
    SymbolInfo* LookUp(string key)
    {
        bool flag = false;
        int ind = HashFunction(key);
        SymbolInfo* entry = s_info[ind];
        while (entry != NULL)
        {
            string m= entry->get_name();
            if (!m.compare(key))
            {
                flag = true;
                return entry;
            }
            entry = entry->next;
        }
        if (!flag)
            cout<<"not found";
        //return -1;
    }

    /*delete*/

    bool Remove(string key)
    {
        int ind = HashFunction(key);
        SymbolInfo* head = s_info[ind];
        SymbolInfo* prev = NULL;
        SymbolInfo* entry = head;
        string m;

        if (entry == NULL)
        {
            cout<<"No Element found at key "<<key<<endl;
            return false;
        }
        m=head->get_name();
        if(head->next == NULL &&(!m.compare(key)))
        {
            s_info[ind]=NULL;
            return true;
        }
        else
        {
            if(entry->next == NULL &&(!m.compare(key)))
            {
                s_info[ind]=NULL;
                return true;
            }
            while (entry->next != NULL)
            {
                m=entry->get_name();
                if(!m.compare(key))
                {
                    if(prev==NULL)
                    {
                        s_info[ind]=entry->next;
                        delete entry;
                    }
                    else
                    {
                        prev->next=entry->next;
                        entry = entry->next;
                        delete entry;
                    }
                }
                else
                {
                    prev = entry;
                    entry = entry->next;
                }

            }
        }

        /*if (prev != NULL)
        {
            prev->next = entry->next;
        }
        delete entry;
        cout<<"Element Deleted"<<endl;*/
    }


};


class SymbolTable{

public:
    int length;
    int total_scope=0;
    ScopeTable* scope;

    SymbolTable(int n){
        this->length=n;
        scope=0;
    }

    void EnterScope(){
        total_scope++;
        ScopeTable* cur_st;
        cur_st=new ScopeTable(length);
        cur_st->id=total_scope;
        cur_st->parentScope=scope;
        scope=cur_st;
        scope->Insert("mm","mm");
        //PrintCurrentScope();
        cout<<"---"<<scope->id<<endl;
    }

    void ExitScope(){
        total_scope--;
        ScopeTable* cur_st;
        cur_st=scope;
        scope=scope->parentScope;
        delete cur_st;
    }

    void PrintCurrentScope(){
        scope->Print();
    }


    bool st_Insert(string name,string type){
        bool a=scope->Insert(name,type);
        return a;
    }


    void PrintAllScope(){
        ScopeTable* cur_st;
        cur_st=scope;
        while(cur_st!=NULL){
            cout<<cur_st->id<<"--id"<<endl;
            cur_st->Print();
            cur_st=cur_st->parentScope;
        }
    }


};






int main()
{
    SymbolTable s1= SymbolTable(6);

    s1.EnterScope();
    s1.EnterScope();
    s1.st_Insert("kalsda","kasdjhada");
   // s1.PrintCurrentScope();

    cout<<"-------------------------------"<<endl;
    s1.PrintAllScope();
    s1.ExitScope();
    s1.ExitScope();
    cout<<"-------------------------------"<<endl;
    s1.PrintAllScope();
    /*string m,n;
    int b;
    cout<<"1. insert"<<"2.search"<<"3.print"<<"4.delete"<<endl;
    while(1)
    {
        cin>> b;
        if(b==1)
        {
            cin>>m;
            cin>>n;
            s.Insert(m,n);
        }
        else if(b==2)
        {
            cin>>m;
            s.LookUp(m);
        }
        else if(b==4)
        {
            cin>>m;
            s.Remove(m);
        }
        else
        {
            s.Print();
        }

    }*/
    return 0;
}
