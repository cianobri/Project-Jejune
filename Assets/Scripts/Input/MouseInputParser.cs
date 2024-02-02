using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
/*
Script for logging the input from the mouse.
*/
public class MouseInputParser : MonoBehaviour
{
    // Using Vector3 for compatibility.
    public Vector3 screenPosition;

    public Vector3 leftClickScreenPosition;
    public Vector3 leftClickWorldPosition;

    public Vector3 rightClickScreenPosition;
    public Vector3 rightClickWorldPosition;

    public GameObject leftClickObject;
    public GameObject rightClickObject;

    public bool leftClickTrue = false;
    public bool rightClickTrue = false;

    public UnityEvent leftMouseClickEvent;
    public UnityEvent rightMouseClickEvent;

    Camera cam;

    Vector3 mWorldPosition;
    Ray raycast;
    RaycastHit raycastHit;

    public static MouseInputParser instance;
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
    void Start()
    {
        Refresh();
    }

    public void Refresh()
    {
        cam = Camera.main;
        if (cam == null)
        {
            Debug.LogWarning("No main camera found!");
        }
        leftClickObject = null;
        rightClickObject = null;
    }
    
    void Update()
    {

        screenPosition = Input.mousePosition;
        leftClickTrue = Input.GetMouseButtonDown(0);
        rightClickTrue = Input.GetMouseButtonDown(1);

        if(leftClickTrue)
        {
            if (cam == null)
            {
                Refresh();
            } else
            {
                // Left mouse button clicked.
                leftClickObject = RaycastGameObject();
                leftClickWorldPosition = RaycastWorldPosition();
                leftClickScreenPosition = screenPosition;
                leftMouseClickEvent.Invoke();

                if (GameManager.instance.currentGameState == GameManager.GameState.Exploration)
                {
                    IInteractable interactable = leftClickObject.GetComponent<IInteractable>();
                    if (interactable != null)
                    {
                        interactable.Interact();
                    }
                }     
            }    
        }
        if (rightClickTrue)
        {
            // Right mouse button clicked.
            rightClickObject = RaycastGameObject();
            rightClickWorldPosition = RaycastWorldPosition();
            rightClickScreenPosition = screenPosition;
            rightMouseClickEvent.Invoke();
        }
    }

    GameObject RaycastGameObject()
    {
        if (cam != null)
        {
            raycast = cam.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(raycast, out raycastHit))
            {
                return raycastHit.collider.gameObject;
            } else
            {
                return null;
            }
        } else{
            Debug.Log("Cam is null, refreshing.");
            Refresh();
            return null;
        }
    }

    Vector3 RaycastWorldPosition()
    {
        // This function is always called after RaycastGameObject.
        return raycastHit.point;
    }
}
