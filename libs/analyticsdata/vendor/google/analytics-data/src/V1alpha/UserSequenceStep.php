<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/analytics/data/v1alpha/data.proto

namespace Google\Analytics\Data\V1alpha;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * A condition that must occur in the specified step order for this user
 * to match the sequence.
 *
 * Generated from protobuf message <code>google.analytics.data.v1alpha.UserSequenceStep</code>
 */
class UserSequenceStep extends \Google\Protobuf\Internal\Message
{
    /**
     * If true, the event satisfying this step must be the very next event
     * after the event satifying the last step. If false, this step indirectly
     * follows the prior step; for example, there may be events between the
     * prior step and this step. `isDirectlyFollowedBy` must be false for
     * the first step.
     *
     * Generated from protobuf field <code>bool is_directly_followed_by = 1;</code>
     */
    private $is_directly_followed_by = false;
    /**
     * This sequence step must be satisfied in the scoping for the user to
     * match the sequence. For example if `sequenceScoping =
     * WITHIN_SAME_SESSION`, this sequence steps must complete within one
     * session for the user to match the sequence. `stepScoping =
     * ACROSS_ALL_SESSIONS` is only allowed if the `sequenceScoping =
     * ACROSS_ALL_SESSIONS`.
     * Optional. If unspecified, `stepScoping` uses the same
     * `UserCriteriaScoping` as the `sequenceScoping`.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.UserCriteriaScoping step_scoping = 2;</code>
     */
    private $step_scoping = 0;
    /**
     * A user matches this sequence step if their events match this
     * expression. Expressions express criteria on dimension, metrics,
     * and/or parameters.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.SegmentFilterExpression segment_filter_expression = 3;</code>
     */
    private $segment_filter_expression = null;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type bool $is_directly_followed_by
     *           If true, the event satisfying this step must be the very next event
     *           after the event satifying the last step. If false, this step indirectly
     *           follows the prior step; for example, there may be events between the
     *           prior step and this step. `isDirectlyFollowedBy` must be false for
     *           the first step.
     *     @type int $step_scoping
     *           This sequence step must be satisfied in the scoping for the user to
     *           match the sequence. For example if `sequenceScoping =
     *           WITHIN_SAME_SESSION`, this sequence steps must complete within one
     *           session for the user to match the sequence. `stepScoping =
     *           ACROSS_ALL_SESSIONS` is only allowed if the `sequenceScoping =
     *           ACROSS_ALL_SESSIONS`.
     *           Optional. If unspecified, `stepScoping` uses the same
     *           `UserCriteriaScoping` as the `sequenceScoping`.
     *     @type \Google\Analytics\Data\V1alpha\SegmentFilterExpression $segment_filter_expression
     *           A user matches this sequence step if their events match this
     *           expression. Expressions express criteria on dimension, metrics,
     *           and/or parameters.
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Analytics\Data\V1Alpha\Data::initOnce();
        parent::__construct($data);
    }

    /**
     * If true, the event satisfying this step must be the very next event
     * after the event satifying the last step. If false, this step indirectly
     * follows the prior step; for example, there may be events between the
     * prior step and this step. `isDirectlyFollowedBy` must be false for
     * the first step.
     *
     * Generated from protobuf field <code>bool is_directly_followed_by = 1;</code>
     * @return bool
     */
    public function getIsDirectlyFollowedBy()
    {
        return $this->is_directly_followed_by;
    }

    /**
     * If true, the event satisfying this step must be the very next event
     * after the event satifying the last step. If false, this step indirectly
     * follows the prior step; for example, there may be events between the
     * prior step and this step. `isDirectlyFollowedBy` must be false for
     * the first step.
     *
     * Generated from protobuf field <code>bool is_directly_followed_by = 1;</code>
     * @param bool $var
     * @return $this
     */
    public function setIsDirectlyFollowedBy($var)
    {
        GPBUtil::checkBool($var);
        $this->is_directly_followed_by = $var;

        return $this;
    }

    /**
     * This sequence step must be satisfied in the scoping for the user to
     * match the sequence. For example if `sequenceScoping =
     * WITHIN_SAME_SESSION`, this sequence steps must complete within one
     * session for the user to match the sequence. `stepScoping =
     * ACROSS_ALL_SESSIONS` is only allowed if the `sequenceScoping =
     * ACROSS_ALL_SESSIONS`.
     * Optional. If unspecified, `stepScoping` uses the same
     * `UserCriteriaScoping` as the `sequenceScoping`.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.UserCriteriaScoping step_scoping = 2;</code>
     * @return int
     */
    public function getStepScoping()
    {
        return $this->step_scoping;
    }

    /**
     * This sequence step must be satisfied in the scoping for the user to
     * match the sequence. For example if `sequenceScoping =
     * WITHIN_SAME_SESSION`, this sequence steps must complete within one
     * session for the user to match the sequence. `stepScoping =
     * ACROSS_ALL_SESSIONS` is only allowed if the `sequenceScoping =
     * ACROSS_ALL_SESSIONS`.
     * Optional. If unspecified, `stepScoping` uses the same
     * `UserCriteriaScoping` as the `sequenceScoping`.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.UserCriteriaScoping step_scoping = 2;</code>
     * @param int $var
     * @return $this
     */
    public function setStepScoping($var)
    {
        GPBUtil::checkEnum($var, \Google\Analytics\Data\V1alpha\UserCriteriaScoping::class);
        $this->step_scoping = $var;

        return $this;
    }

    /**
     * A user matches this sequence step if their events match this
     * expression. Expressions express criteria on dimension, metrics,
     * and/or parameters.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.SegmentFilterExpression segment_filter_expression = 3;</code>
     * @return \Google\Analytics\Data\V1alpha\SegmentFilterExpression|null
     */
    public function getSegmentFilterExpression()
    {
        return $this->segment_filter_expression;
    }

    public function hasSegmentFilterExpression()
    {
        return isset($this->segment_filter_expression);
    }

    public function clearSegmentFilterExpression()
    {
        unset($this->segment_filter_expression);
    }

    /**
     * A user matches this sequence step if their events match this
     * expression. Expressions express criteria on dimension, metrics,
     * and/or parameters.
     *
     * Generated from protobuf field <code>.google.analytics.data.v1alpha.SegmentFilterExpression segment_filter_expression = 3;</code>
     * @param \Google\Analytics\Data\V1alpha\SegmentFilterExpression $var
     * @return $this
     */
    public function setSegmentFilterExpression($var)
    {
        GPBUtil::checkMessage($var, \Google\Analytics\Data\V1alpha\SegmentFilterExpression::class);
        $this->segment_filter_expression = $var;

        return $this;
    }

}

