using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class InputManager : MonoBehaviour
{
    MouseInputParser  mouseInputParser;
    public UnityEvent leftMouseClickEvent;
    public UnityEvent rightMouseClickEvent;

    public static InputManager instance;
    private void Awake() 
    { 
        if (instance != null && instance != this) 
        { 
            Destroy(gameObject); 
        } 
        else 
        { 
            instance = this; 
        } 
        
    }



    public MouseInputParser GetMouseInputParser()
    {
        if (mouseInputParser != null)
        {
            return mouseInputParser;
        } else
        {
            return null;
        }
    }
}
