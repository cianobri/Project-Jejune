using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Events;

public class KeyInputParser : MonoBehaviour
{

    public UnityEvent pauseScreenPressed;

    public static KeyInputParser instance;
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

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            pauseScreenPressed.Invoke();
        }
    }
}
