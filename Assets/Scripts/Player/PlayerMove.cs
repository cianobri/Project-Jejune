using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Pathfinding;
/**
Responsible for moving the player around the scene.
**/
[RequireComponent(typeof(CharacterController), typeof(Pathfinding.Seeker))]
public class PlayerMove : MonoBehaviour
{

    CharacterController charController;
    Pathfinding.Seeker pathSeeker;

    void Start()
    {
        charController = GetComponent<CharacterController>();
        pathSeeker = GetComponent<Pathfinding.Seeker>();
    }

    public void TryMoveTo(Vector3? targetPosition)
    {
        if (targetPosition.HasValue)
        {
            pathSeeker.StartPath(transform.position, targetPosition.Value, OnPathComplete);
        }
    }

    public void OnPathComplete( Path p)
    {
    }
}
