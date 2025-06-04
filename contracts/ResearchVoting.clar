;; ResearchVoting: A decentralized platform for academic research proposal selection
;; Core Data Structures
(define-map researchers principal uint)       ;; Tracks researchers and their voted proposals
(define-map proposals uint uint)              ;; Tracks proposals and their vote counts
(define-data-var proposal-counter uint u0)    ;; Keeps count of total submitted proposals

;; Public function to submit a new research proposal
(define-public (submit-proposal)
  (let ((proposal-id (+ (var-get proposal-counter) u1)))
    (map-set proposals proposal-id u0)         ;; Initialize votes for the new proposal to 0
    (var-set proposal-counter proposal-id)     ;; Increment proposal-counter
    (ok proposal-id)
  )
)

;; Public function to vote for a proposal
(define-public (vote-proposal (proposal-id uint))
  (let ((researcher tx-sender))
    (if (is-some (map-get? researchers researcher))
        (err u2000)  ;; Error: Researcher has already voted for a proposal
        (if (is-none (map-get? proposals proposal-id))
            (err u2001)  ;; Error: Proposal does not exist
            (begin
              ;; Register the researcher's vote
              (map-set researchers researcher proposal-id)
              ;; Increment the proposal's vote count
              (map-set proposals proposal-id (+ (default-to u0 (map-get? proposals proposal-id)) u1))
              (ok proposal-id)
            )
        )
    )
  )
)

;; Read-only function to get total votes for a proposal
(define-read-only (get-vote-count (proposal-id uint))
  (default-to u0 (map-get? proposals proposal-id))
)

;; Read-only function to check if a researcher has voted for any proposal
(define-read-only (has-voted (researcher principal))
  (is-some (map-get? researchers researcher))
)

;; Read-only function to get the total number of proposals
(define-read-only (get-proposal-count)
  (var-get proposal-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-highest (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)