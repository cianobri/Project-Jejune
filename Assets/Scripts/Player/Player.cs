using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using Pathfinding;
[RequireComponent(typeof(CharacterController),typeof(Pathfinding.Seeker))]
public class Player : MonoBehaviour
{
    public enum PlayerAnimationState
    {
        Idle,
        Walking
    }
    public static Player instance;
    public Vector3 moveTarget;
    public PlayerAnimationState currentAnimationState = PlayerAnimationState.Idle;

    PlayerMove playerMove;
    UnityEvent leftMouseClickEvent;
    UnityEvent rightMouseClickEvent;
    UnityEvent updateMoveTargetEvent;
    CharacterController charController;
    Pathfinding.Seeker pathSeeker;
    Path path;
    float interactDistance;
    GameObject interactTarget;
    Coroutine InteractWhenTargetReachedCoroutine;
    bool coroutineRunning = false;

    void Awake()
    {
        if (instance != null && instance != this) 
        { 
            Destroy(gameObject); 
        } 
        else 
        { 
            instance = this; 
        } 

        playerMove = GetComponent<PlayerMove>();
        charController = GetComponent<CharacterController>();
        pathSeeker = GetComponent<Pathfinding.Seeker>();
    }

    void Start()
    {
        if (MouseInputParser.instance != null)
        {
            MouseInputParser.instance.rightMouseClickEvent.AddListener(SeekTo);
          
        }
        else
        {
            Debug.LogError("InputManager or MouseInputParser is null.");
        }
    }

    void OnEnable()
    {
        if (coroutineRunning)
        {
            StopCoroutine(InteractWhenTargetReachedCoroutine);
            interactTarget.GetComponent<IInteractable>().SetInteractableNotActive();
        }
    }

    void SeekTo()
    {
        
        if(GameManager.instance.currentGameState == GameManager.GameState.Exploration)
        {
            moveTarget = MouseInputParser.instance.rightClickWorldPosition;
        } else{
            moveTarget = transform.position;
        }

        if(GameManager.instance.DebugOn)
        {
            Debug.Log(moveTarget);
        }

        TryMoveTo(moveTarget);   
    }

    public void SetPosition(Vector3 position)
    {
        transform.position = position;
    }

    public void TryMoveTo(Vector3? targetPosition)
    {
        if (coroutineRunning)
        {
            StopCoroutine(InteractWhenTargetReachedCoroutine);
            interactTarget.GetComponent<IInteractable>().SetInteractableNotActive();
        }
        if (targetPosition.HasValue)
        {
            pathSeeker.StartPath(transform.position, targetPosition.Value, OnPathComplete);
        }
    }

    public void SeekAndInteract(GameObject interactable, float targetInteractDistance)
    {
        if (coroutineRunning)
        {
            StopCoroutine(InteractWhenTargetReachedCoroutine);
            interactTarget.GetComponent<IInteractable>().SetInteractableNotActive();
        }
        moveTarget = interactable.transform.position;
        interactDistance = targetInteractDistance;
        interactTarget = interactable;

        pathSeeker.StartPath(moveTarget, interactable.transform.position, OnPathComplete);

        InteractWhenTargetReachedCoroutine = StartCoroutine(InteractWhenTargetReached());
    }

    public void OnPathComplete(Path p)
    {
       
    }

    IEnumerator InteractWhenTargetReached()
    {
        coroutineRunning = true;
        bool targetReached = false;
        float distanceToTarget;
        while (targetReached == false)
        {
            distanceToTarget = Vector3.Distance(transform.position, moveTarget);

            if (distanceToTarget <= interactDistance)
            {
                targetReached = true;
                interactTarget.GetComponent<IInteractable>().SetInteractableActive();
            }

            yield return null;
        }
        pathSeeker.StartPath(transform.position, transform.position, OnPathComplete);
        interactTarget.GetComponent<IInteractable>().OnInteraction();
        coroutineRunning = false;
    }

}
