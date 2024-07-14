--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: adminapi; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adminapi;


ALTER SCHEMA adminapi OWNER TO postgres;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO postgres;

--
-- Name: eventstore; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA eventstore;


ALTER SCHEMA eventstore OWNER TO postgres;

--
-- Name: logstore; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA logstore;


ALTER SCHEMA logstore OWNER TO postgres;

--
-- Name: projections; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA projections;


ALTER SCHEMA projections OWNER TO postgres;

--
-- Name: system; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA system;


ALTER SCHEMA system OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: current_sequences; Type: TABLE; Schema: adminapi; Owner: postgres
--

CREATE TABLE adminapi.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);


ALTER TABLE adminapi.current_sequences OWNER TO postgres;

--
-- Name: failed_events; Type: TABLE; Schema: adminapi; Owner: postgres
--

CREATE TABLE adminapi.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


ALTER TABLE adminapi.failed_events OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: adminapi; Owner: postgres
--

CREATE TABLE adminapi.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE adminapi.locks OWNER TO postgres;

--
-- Name: styling; Type: TABLE; Schema: adminapi; Owner: postgres
--

CREATE TABLE adminapi.styling (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL
);


ALTER TABLE adminapi.styling OWNER TO postgres;

--
-- Name: styling2; Type: TABLE; Schema: adminapi; Owner: postgres
--

CREATE TABLE adminapi.styling2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


ALTER TABLE adminapi.styling2 OWNER TO postgres;

--
-- Name: auth_requests; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.auth_requests (
    id text NOT NULL,
    request jsonb,
    code text,
    request_type smallint,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    instance_id text NOT NULL
);


ALTER TABLE auth.auth_requests OWNER TO postgres;

--
-- Name: current_sequences; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);


ALTER TABLE auth.current_sequences OWNER TO postgres;

--
-- Name: failed_events; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


ALTER TABLE auth.failed_events OWNER TO postgres;

--
-- Name: idp_configs; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.idp_configs (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL
);


ALTER TABLE auth.idp_configs OWNER TO postgres;

--
-- Name: idp_configs2; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.idp_configs2 (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


ALTER TABLE auth.idp_configs2 OWNER TO postgres;

--
-- Name: idp_providers; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.idp_providers (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL
);


ALTER TABLE auth.idp_providers OWNER TO postgres;

--
-- Name: idp_providers2; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.idp_providers2 (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


ALTER TABLE auth.idp_providers2 OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE auth.locks OWNER TO postgres;

--
-- Name: org_project_mapping; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.org_project_mapping (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL
);


ALTER TABLE auth.org_project_mapping OWNER TO postgres;

--
-- Name: org_project_mapping2; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.org_project_mapping2 (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


ALTER TABLE auth.org_project_mapping2 OWNER TO postgres;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.refresh_tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    token text,
    client_id text NOT NULL,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    auth_time timestamp with time zone,
    idle_expiration timestamp with time zone,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    amr text[],
    instance_id text NOT NULL,
    actor jsonb
);


ALTER TABLE auth.refresh_tokens OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    application_id text,
    user_agent_id text,
    user_id text,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    preferred_language text,
    refresh_token_id text,
    is_pat boolean DEFAULT false NOT NULL,
    instance_id text NOT NULL,
    actor jsonb
);


ALTER TABLE auth.tokens OWNER TO postgres;

--
-- Name: user_external_idps; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.user_external_idps (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL
);


ALTER TABLE auth.user_external_idps OWNER TO postgres;

--
-- Name: user_external_idps2; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.user_external_idps2 (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);


ALTER TABLE auth.user_external_idps2 OWNER TO postgres;

--
-- Name: user_sessions; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.user_sessions (
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    state smallint,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    user_name text,
    password_verification timestamp with time zone,
    second_factor_verification timestamp with time zone,
    multi_factor_verification timestamp with time zone,
    sequence bigint,
    second_factor_verification_type smallint,
    multi_factor_verification_type smallint,
    user_display_name text,
    login_name text,
    external_login_verification timestamp with time zone,
    selected_idp_config_id text,
    passwordless_verification timestamp with time zone,
    avatar_key text,
    instance_id text NOT NULL
);


ALTER TABLE auth.user_sessions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL
);


ALTER TABLE auth.users OWNER TO postgres;

--
-- Name: users2; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users2 (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false,
    otp_sms_added boolean DEFAULT false,
    otp_email_added boolean DEFAULT false
);


ALTER TABLE auth.users2 OWNER TO postgres;

--
-- Name: users3; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users3 (
    instance_id text NOT NULL,
    id text NOT NULL,
    resource_owner text NOT NULL,
    change_date timestamp with time zone,
    password_set boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    init_required boolean,
    mfa_init_skipped timestamp with time zone,
    username_change_required boolean,
    passwordless_init_required boolean,
    password_init_required boolean
);


ALTER TABLE auth.users3 OWNER TO postgres;

--
-- Name: events2; Type: TABLE; Schema: eventstore; Owner: postgres
--

CREATE TABLE eventstore.events2 (
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_type text NOT NULL,
    sequence bigint NOT NULL,
    revision smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payload jsonb,
    creator text NOT NULL,
    owner text NOT NULL,
    "position" numeric NOT NULL,
    in_tx_order integer NOT NULL
);


ALTER TABLE eventstore.events2 OWNER TO postgres;

--
-- Name: system_seq; Type: SEQUENCE; Schema: eventstore; Owner: postgres
--

CREATE SEQUENCE eventstore.system_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventstore.system_seq OWNER TO postgres;

--
-- Name: unique_constraints; Type: TABLE; Schema: eventstore; Owner: postgres
--

CREATE TABLE eventstore.unique_constraints (
    instance_id text NOT NULL,
    unique_type text NOT NULL,
    unique_field text NOT NULL
);


ALTER TABLE eventstore.unique_constraints OWNER TO postgres;

--
-- Name: access; Type: TABLE; Schema: logstore; Owner: postgres
--

CREATE TABLE logstore.access (
    log_date timestamp with time zone NOT NULL,
    protocol integer NOT NULL,
    request_url text NOT NULL,
    response_status integer NOT NULL,
    request_headers jsonb,
    response_headers jsonb,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    requested_domain text,
    requested_host text
);


ALTER TABLE logstore.access OWNER TO postgres;

--
-- Name: execution; Type: TABLE; Schema: logstore; Owner: postgres
--

CREATE TABLE logstore.execution (
    log_date timestamp with time zone NOT NULL,
    took interval,
    message text NOT NULL,
    loglevel integer NOT NULL,
    instance_id text NOT NULL,
    action_id text NOT NULL,
    metadata jsonb
);


ALTER TABLE logstore.execution OWNER TO postgres;

--
-- Name: actions3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.actions3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    action_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    script text DEFAULT ''::text NOT NULL,
    timeout bigint DEFAULT 0 NOT NULL,
    allowed_to_fail boolean DEFAULT false NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.actions3 OWNER TO postgres;

--
-- Name: apps7; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.apps7 (
    id text NOT NULL,
    name text NOT NULL,
    project_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    sequence bigint NOT NULL
);


ALTER TABLE projections.apps7 OWNER TO postgres;

--
-- Name: apps7_api_configs; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.apps7_api_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret text,
    auth_method smallint NOT NULL
);


ALTER TABLE projections.apps7_api_configs OWNER TO postgres;

--
-- Name: apps7_oidc_configs; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.apps7_oidc_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    version smallint NOT NULL,
    client_id text NOT NULL,
    client_secret text,
    redirect_uris text[],
    response_types smallint[],
    grant_types smallint[],
    application_type smallint NOT NULL,
    auth_method_type smallint NOT NULL,
    post_logout_redirect_uris text[],
    is_dev_mode boolean NOT NULL,
    access_token_type smallint NOT NULL,
    access_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_userinfo_assertion boolean DEFAULT false NOT NULL,
    clock_skew bigint DEFAULT 0 NOT NULL,
    additional_origins text[],
    skip_native_app_success_page boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.apps7_oidc_configs OWNER TO postgres;

--
-- Name: apps7_saml_configs; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.apps7_saml_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    entity_id text NOT NULL,
    metadata bytea NOT NULL,
    metadata_url text NOT NULL
);


ALTER TABLE projections.apps7_saml_configs OWNER TO postgres;

--
-- Name: auth_requests; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.auth_requests (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    login_client text NOT NULL,
    client_id text NOT NULL,
    redirect_uri text NOT NULL,
    scope text[] NOT NULL,
    prompt smallint[],
    ui_locales text[],
    max_age bigint,
    login_hint text,
    hint_user_id text
);


ALTER TABLE projections.auth_requests OWNER TO postgres;

--
-- Name: authn_keys2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.authn_keys2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    aggregate_id text NOT NULL,
    sequence bigint NOT NULL,
    object_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    identifier text NOT NULL,
    public_key bytea NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    type smallint DEFAULT 0 NOT NULL
);


ALTER TABLE projections.authn_keys2 OWNER TO postgres;

--
-- Name: current_sequences; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.current_sequences (
    projection_name text NOT NULL,
    aggregate_type text NOT NULL,
    current_sequence bigint,
    instance_id text NOT NULL,
    "timestamp" timestamp with time zone
);


ALTER TABLE projections.current_sequences OWNER TO postgres;

--
-- Name: current_states; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.current_states (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    last_updated timestamp with time zone,
    aggregate_id text,
    aggregate_type text,
    sequence bigint,
    event_date timestamp with time zone,
    "position" numeric,
    filter_offset integer
);


ALTER TABLE projections.current_states OWNER TO postgres;

--
-- Name: custom_texts2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.custom_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean NOT NULL,
    template text NOT NULL,
    language text NOT NULL,
    key text NOT NULL,
    text text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.custom_texts2 OWNER TO postgres;

--
-- Name: device_auth_requests2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.device_auth_requests2 (
    client_id text NOT NULL,
    device_code text NOT NULL,
    user_code text NOT NULL,
    scopes text[],
    audience text[],
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE projections.device_auth_requests2 OWNER TO postgres;

--
-- Name: domain_policies2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.domain_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    user_login_must_be_domain boolean NOT NULL,
    validate_org_domains boolean NOT NULL,
    smtp_sender_address_matches_instance_domain boolean NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.domain_policies2 OWNER TO postgres;

--
-- Name: executions1; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.executions1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE projections.executions1 OWNER TO postgres;

--
-- Name: executions1_targets; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.executions1_targets (
    instance_id text NOT NULL,
    execution_id text NOT NULL,
    "position" bigint NOT NULL,
    include text,
    target_id text
);


ALTER TABLE projections.executions1_targets OWNER TO postgres;

--
-- Name: failed_events; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.failed_events (
    projection_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    error text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);


ALTER TABLE projections.failed_events OWNER TO postgres;

--
-- Name: failed_events2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.failed_events2 (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_creation_date timestamp with time zone NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint DEFAULT 0,
    error text,
    last_failed timestamp with time zone
);


ALTER TABLE projections.failed_events2 OWNER TO postgres;

--
-- Name: flow_triggers3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.flow_triggers3 (
    flow_type smallint NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    trigger_type smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    trigger_sequence bigint NOT NULL,
    action_id text NOT NULL
);


ALTER TABLE projections.flow_triggers3 OWNER TO postgres;

--
-- Name: idp_login_policy_links5; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_login_policy_links5 (
    idp_id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    provider_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.idp_login_policy_links5 OWNER TO postgres;

--
-- Name: idp_templates6; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text,
    owner_type smallint NOT NULL,
    type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL,
    is_creation_allowed boolean DEFAULT false NOT NULL,
    is_linking_allowed boolean DEFAULT false NOT NULL,
    is_auto_creation boolean DEFAULT false NOT NULL,
    is_auto_update boolean DEFAULT false NOT NULL,
    auto_linking smallint DEFAULT 0 NOT NULL
);


ALTER TABLE projections.idp_templates6 OWNER TO postgres;

--
-- Name: idp_templates6_apple; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_apple (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    team_id text NOT NULL,
    key_id text NOT NULL,
    private_key jsonb NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_apple OWNER TO postgres;

--
-- Name: idp_templates6_azure; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_azure (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text,
    tenant text,
    is_email_verified boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.idp_templates6_azure OWNER TO postgres;

--
-- Name: idp_templates6_github; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_github (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_github OWNER TO postgres;

--
-- Name: idp_templates6_github_enterprise; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_github_enterprise (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_github_enterprise OWNER TO postgres;

--
-- Name: idp_templates6_gitlab; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_gitlab (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_gitlab OWNER TO postgres;

--
-- Name: idp_templates6_gitlab_self_hosted; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_gitlab_self_hosted (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_gitlab_self_hosted OWNER TO postgres;

--
-- Name: idp_templates6_google; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_google (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);


ALTER TABLE projections.idp_templates6_google OWNER TO postgres;

--
-- Name: idp_templates6_jwt; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_jwt (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    jwt_endpoint text NOT NULL,
    keys_endpoint text NOT NULL,
    header_name text
);


ALTER TABLE projections.idp_templates6_jwt OWNER TO postgres;

--
-- Name: idp_templates6_ldap2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_ldap2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    servers text[] NOT NULL,
    start_tls boolean NOT NULL,
    base_dn text NOT NULL,
    bind_dn text NOT NULL,
    bind_password jsonb NOT NULL,
    user_base text NOT NULL,
    user_object_classes text[] NOT NULL,
    user_filters text[] NOT NULL,
    timeout bigint NOT NULL,
    id_attribute text,
    first_name_attribute text,
    last_name_attribute text,
    display_name_attribute text,
    nick_name_attribute text,
    preferred_username_attribute text,
    email_attribute text,
    email_verified text,
    phone_attribute text,
    phone_verified_attribute text,
    preferred_language_attribute text,
    avatar_url_attribute text,
    profile_attribute text
);


ALTER TABLE projections.idp_templates6_ldap2 OWNER TO postgres;

--
-- Name: idp_templates6_oauth2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_oauth2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[],
    id_attribute text NOT NULL
);


ALTER TABLE projections.idp_templates6_oauth2 OWNER TO postgres;

--
-- Name: idp_templates6_oidc; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_oidc (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[],
    id_token_mapping boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.idp_templates6_oidc OWNER TO postgres;

--
-- Name: idp_templates6_saml; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_templates6_saml (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    metadata bytea NOT NULL,
    key jsonb NOT NULL,
    certificate bytea NOT NULL,
    binding text,
    with_signed_request boolean,
    name_id_format smallint,
    transient_mapping_attribute_name text
);


ALTER TABLE projections.idp_templates6_saml OWNER TO postgres;

--
-- Name: idp_user_links3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idp_user_links3 (
    idp_id text NOT NULL,
    user_id text NOT NULL,
    external_user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.idp_user_links3 OWNER TO postgres;

--
-- Name: idps3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idps3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text NOT NULL,
    styling_type smallint NOT NULL,
    owner_type smallint NOT NULL,
    auto_register boolean DEFAULT false NOT NULL,
    type smallint,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.idps3 OWNER TO postgres;

--
-- Name: idps3_jwt_config; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idps3_jwt_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text,
    keys_endpoint text,
    header_name text,
    endpoint text
);


ALTER TABLE projections.idps3_jwt_config OWNER TO postgres;

--
-- Name: idps3_oidc_config; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.idps3_oidc_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text,
    client_secret jsonb,
    issuer text,
    scopes text[],
    display_name_mapping smallint,
    username_mapping smallint,
    authorization_endpoint text,
    token_endpoint text
);


ALTER TABLE projections.idps3_oidc_config OWNER TO postgres;

--
-- Name: instance_domains; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.instance_domains (
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_generated boolean NOT NULL,
    is_primary boolean NOT NULL
);


ALTER TABLE projections.instance_domains OWNER TO postgres;

--
-- Name: instance_features2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.instance_features2 (
    instance_id text NOT NULL,
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE projections.instance_features2 OWNER TO postgres;

--
-- Name: instance_members4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.instance_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    id text NOT NULL
);


ALTER TABLE projections.instance_members4 OWNER TO postgres;

--
-- Name: instances; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.instances (
    id text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    change_date timestamp with time zone NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    default_org_id text DEFAULT ''::text NOT NULL,
    iam_project_id text DEFAULT ''::text NOT NULL,
    console_client_id text DEFAULT ''::text NOT NULL,
    console_app_id text DEFAULT ''::text NOT NULL,
    sequence bigint NOT NULL,
    default_language text DEFAULT ''::text NOT NULL
);


ALTER TABLE projections.instances OWNER TO postgres;

--
-- Name: keys4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.keys4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    algorithm text DEFAULT ''::text NOT NULL,
    use smallint DEFAULT 0 NOT NULL
);


ALTER TABLE projections.keys4 OWNER TO postgres;

--
-- Name: keys4_certificate; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.keys4_certificate (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    certificate bytea NOT NULL
);


ALTER TABLE projections.keys4_certificate OWNER TO postgres;

--
-- Name: keys4_private; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.keys4_private (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key jsonb NOT NULL
);


ALTER TABLE projections.keys4_private OWNER TO postgres;

--
-- Name: keys4_public; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.keys4_public (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key bytea NOT NULL
);


ALTER TABLE projections.keys4_public OWNER TO postgres;

--
-- Name: label_policies3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.label_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    hide_login_name_suffix boolean DEFAULT false NOT NULL,
    watermark_disabled boolean DEFAULT false NOT NULL,
    should_error_popup boolean DEFAULT false NOT NULL,
    font_url text,
    light_primary_color text,
    light_warn_color text,
    light_background_color text,
    light_font_color text,
    light_logo_url text,
    light_icon_url text,
    dark_primary_color text,
    dark_warn_color text,
    dark_background_color text,
    dark_font_color text,
    dark_logo_url text,
    dark_icon_url text,
    owner_removed boolean DEFAULT false NOT NULL,
    theme_mode smallint DEFAULT 0 NOT NULL
);


ALTER TABLE projections.label_policies3 OWNER TO postgres;

--
-- Name: limits; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.limits (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    audit_log_retention interval,
    block boolean
);


ALTER TABLE projections.limits OWNER TO postgres;

--
-- Name: lockout_policies3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.lockout_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    max_password_attempts bigint NOT NULL,
    max_otp_attempts bigint DEFAULT 0 NOT NULL,
    show_failure boolean NOT NULL
);


ALTER TABLE projections.lockout_policies3 OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    projection_name text NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE projections.locks OWNER TO postgres;

--
-- Name: login_names3_domains; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.login_names3_domains (
    name text NOT NULL,
    is_primary boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name_lower text GENERATED ALWAYS AS (lower(name)) STORED
);


ALTER TABLE projections.login_names3_domains OWNER TO postgres;

--
-- Name: login_names3_policies; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.login_names3_policies (
    must_be_domain boolean NOT NULL,
    is_default boolean NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE projections.login_names3_policies OWNER TO postgres;

--
-- Name: login_names3_users; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.login_names3_users (
    id text NOT NULL,
    user_name text NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_name_lower text GENERATED ALWAYS AS (lower(user_name)) STORED
);


ALTER TABLE projections.login_names3_users OWNER TO postgres;

--
-- Name: login_names3; Type: VIEW; Schema: projections; Owner: postgres
--

CREATE VIEW projections.login_names3 AS
 SELECT login_names3.user_id,
        CASE
            WHEN login_names3.must_be_domain THEN concat(login_names3.user_name, '@', login_names3.domain)
            ELSE login_names3.user_name
        END AS login_name,
    COALESCE(login_names3.is_primary, true) AS is_primary,
    login_names3.instance_id
   FROM ( SELECT policy_users.user_id,
            policy_users.user_name,
            policy_users.resource_owner,
            policy_users.instance_id,
            policy_users.must_be_domain,
            domains.name AS domain,
            domains.is_primary
           FROM (( SELECT users.id AS user_id,
                    users.user_name,
                    users.instance_id,
                    users.resource_owner,
                    COALESCE(policy_custom.must_be_domain, policy_default.must_be_domain) AS must_be_domain
                   FROM ((projections.login_names3_users users
                     LEFT JOIN projections.login_names3_policies policy_custom ON (((policy_custom.resource_owner = users.resource_owner) AND (policy_custom.instance_id = users.instance_id))))
                     LEFT JOIN projections.login_names3_policies policy_default ON (((policy_default.is_default = true) AND (policy_default.instance_id = users.instance_id))))) policy_users
             LEFT JOIN projections.login_names3_domains domains ON ((policy_users.must_be_domain AND (policy_users.resource_owner = domains.resource_owner) AND (policy_users.instance_id = domains.instance_id))))) login_names3;


ALTER TABLE projections.login_names3 OWNER TO postgres;

--
-- Name: login_policies5; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.login_policies5 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    allow_register boolean NOT NULL,
    allow_username_password boolean NOT NULL,
    allow_external_idps boolean NOT NULL,
    force_mfa boolean NOT NULL,
    force_mfa_local_only boolean DEFAULT false NOT NULL,
    second_factors smallint[],
    multi_factors smallint[],
    passwordless_type smallint NOT NULL,
    hide_password_reset boolean NOT NULL,
    ignore_unknown_usernames boolean NOT NULL,
    allow_domain_discovery boolean NOT NULL,
    disable_login_with_email boolean NOT NULL,
    disable_login_with_phone boolean NOT NULL,
    default_redirect_uri text,
    password_check_lifetime bigint NOT NULL,
    external_login_check_lifetime bigint NOT NULL,
    mfa_init_skip_lifetime bigint NOT NULL,
    second_factor_check_lifetime bigint NOT NULL,
    multi_factor_check_lifetime bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.login_policies5 OWNER TO postgres;

--
-- Name: mail_templates2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.mail_templates2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    template bytea NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.mail_templates2 OWNER TO postgres;

--
-- Name: message_texts2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.message_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    type text NOT NULL,
    language text NOT NULL,
    title text,
    pre_header text,
    subject text,
    greeting text,
    text text,
    button_text text,
    footer_text text,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.message_texts2 OWNER TO postgres;

--
-- Name: milestones; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.milestones (
    instance_id text NOT NULL,
    type smallint NOT NULL,
    reached_date timestamp with time zone,
    last_pushed_date timestamp with time zone,
    primary_domain text,
    ignore_client_ids text[]
);


ALTER TABLE projections.milestones OWNER TO postgres;

--
-- Name: notification_policies; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.notification_policies (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean NOT NULL,
    password_change boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.notification_policies OWNER TO postgres;

--
-- Name: notification_providers; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.notification_providers (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    provider_type smallint NOT NULL,
    compact boolean NOT NULL
);


ALTER TABLE projections.notification_providers OWNER TO postgres;

--
-- Name: oidc_settings2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.oidc_settings2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    access_token_lifetime bigint NOT NULL,
    id_token_lifetime bigint NOT NULL,
    refresh_token_idle_expiration bigint NOT NULL,
    refresh_token_expiration bigint NOT NULL
);


ALTER TABLE projections.oidc_settings2 OWNER TO postgres;

--
-- Name: org_domains2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.org_domains2 (
    org_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_verified boolean NOT NULL,
    is_primary boolean NOT NULL,
    validation_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.org_domains2 OWNER TO postgres;

--
-- Name: org_members4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.org_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_id text NOT NULL
);


ALTER TABLE projections.org_members4 OWNER TO postgres;

--
-- Name: org_metadata2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.org_metadata2 (
    org_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.org_metadata2 OWNER TO postgres;

--
-- Name: orgs1; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.orgs1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    primary_domain text DEFAULT ''::text NOT NULL
);


ALTER TABLE projections.orgs1 OWNER TO postgres;

--
-- Name: password_age_policies2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.password_age_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    expire_warn_days bigint NOT NULL,
    max_age_days bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.password_age_policies2 OWNER TO postgres;

--
-- Name: password_complexity_policies2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.password_complexity_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    min_length bigint NOT NULL,
    has_lowercase boolean NOT NULL,
    has_uppercase boolean NOT NULL,
    has_symbol boolean NOT NULL,
    has_number boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.password_complexity_policies2 OWNER TO postgres;

--
-- Name: personal_access_tokens3; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.personal_access_tokens3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    scopes text[],
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.personal_access_tokens3 OWNER TO postgres;

--
-- Name: privacy_policies4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.privacy_policies4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    privacy_link text NOT NULL,
    tos_link text NOT NULL,
    help_link text NOT NULL,
    support_email text NOT NULL,
    docs_link text DEFAULT 'https://zitadel.com/docs'::text NOT NULL,
    custom_link text NOT NULL,
    custom_link_text text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.privacy_policies4 OWNER TO postgres;

--
-- Name: project_grant_members4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.project_grant_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL
);


ALTER TABLE projections.project_grant_members4 OWNER TO postgres;

--
-- Name: project_grants4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.project_grants4 (
    grant_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    granted_org_id text NOT NULL,
    granted_role_keys text[]
);


ALTER TABLE projections.project_grants4 OWNER TO postgres;

--
-- Name: project_members4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.project_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL
);


ALTER TABLE projections.project_members4 OWNER TO postgres;

--
-- Name: project_roles4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.project_roles4 (
    project_id text NOT NULL,
    role_key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    group_name text NOT NULL
);


ALTER TABLE projections.project_roles4 OWNER TO postgres;

--
-- Name: projects4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.projects4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    project_role_assertion boolean NOT NULL,
    project_role_check boolean NOT NULL,
    has_project_check boolean NOT NULL,
    private_labeling_setting smallint NOT NULL
);


ALTER TABLE projections.projects4 OWNER TO postgres;

--
-- Name: quotas; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.quotas (
    id text NOT NULL,
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    amount bigint,
    from_anchor timestamp with time zone,
    "interval" interval,
    limit_usage boolean
);


ALTER TABLE projections.quotas OWNER TO postgres;

--
-- Name: quotas_notifications; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.quotas_notifications (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    id text NOT NULL,
    call_url text NOT NULL,
    percent bigint NOT NULL,
    repeat boolean NOT NULL,
    latest_due_period_start timestamp with time zone,
    next_due_threshold bigint
);


ALTER TABLE projections.quotas_notifications OWNER TO postgres;

--
-- Name: quotas_periods; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.quotas_periods (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    start timestamp with time zone NOT NULL,
    usage bigint NOT NULL
);


ALTER TABLE projections.quotas_periods OWNER TO postgres;

--
-- Name: restrictions2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.restrictions2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    disallow_public_org_registration boolean,
    allowed_languages text[]
);


ALTER TABLE projections.restrictions2 OWNER TO postgres;

--
-- Name: secret_generators2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.secret_generators2 (
    generator_type smallint NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    length bigint NOT NULL,
    expiry bigint NOT NULL,
    include_lower_letters boolean NOT NULL,
    include_upper_letters boolean NOT NULL,
    include_digits boolean NOT NULL,
    include_symbols boolean NOT NULL
);


ALTER TABLE projections.secret_generators2 OWNER TO postgres;

--
-- Name: security_policies2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.security_policies2 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    enable_iframe_embedding boolean DEFAULT false NOT NULL,
    origins text[],
    enable_impersonation boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.security_policies2 OWNER TO postgres;

--
-- Name: sessions8; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.sessions8 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    creator text NOT NULL,
    user_id text,
    user_resource_owner text,
    user_checked_at timestamp with time zone,
    password_checked_at timestamp with time zone,
    intent_checked_at timestamp with time zone,
    webauthn_checked_at timestamp with time zone,
    webauthn_user_verified boolean,
    totp_checked_at timestamp with time zone,
    otp_sms_checked_at timestamp with time zone,
    otp_email_checked_at timestamp with time zone,
    metadata jsonb,
    token_id text,
    user_agent_fingerprint_id text,
    user_agent_ip text,
    user_agent_description text,
    user_agent_header jsonb,
    expiration timestamp with time zone
);


ALTER TABLE projections.sessions8 OWNER TO postgres;

--
-- Name: sms_configs2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.sms_configs2 (
    id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL
);


ALTER TABLE projections.sms_configs2 OWNER TO postgres;

--
-- Name: sms_configs2_twilio; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.sms_configs2_twilio (
    sms_id text NOT NULL,
    instance_id text NOT NULL,
    sid text NOT NULL,
    sender_number text NOT NULL,
    token jsonb NOT NULL
);


ALTER TABLE projections.sms_configs2_twilio OWNER TO postgres;

--
-- Name: smtp_configs2; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.smtp_configs2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    tls boolean NOT NULL,
    sender_address text NOT NULL,
    sender_name text NOT NULL,
    reply_to_address text NOT NULL,
    host text NOT NULL,
    username text NOT NULL,
    password jsonb,
    state smallint NOT NULL,
    description text NOT NULL
);


ALTER TABLE projections.smtp_configs2 OWNER TO postgres;

--
-- Name: system_features; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.system_features (
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE projections.system_features OWNER TO postgres;

--
-- Name: targets1; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.targets1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    target_type smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    endpoint text NOT NULL,
    timeout bigint NOT NULL,
    interrupt_on_error boolean NOT NULL
);


ALTER TABLE projections.targets1 OWNER TO postgres;

--
-- Name: user_auth_methods4; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.user_auth_methods4 (
    user_id text NOT NULL,
    method_type smallint NOT NULL,
    token_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);


ALTER TABLE projections.user_auth_methods4 OWNER TO postgres;

--
-- Name: user_grants5; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.user_grants5 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    resource_owner_user text NOT NULL,
    project_id text NOT NULL,
    resource_owner_project text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL,
    roles text[]
);


ALTER TABLE projections.user_grants5 OWNER TO postgres;

--
-- Name: user_metadata5; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.user_metadata5 (
    user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea
);


ALTER TABLE projections.user_metadata5 OWNER TO postgres;

--
-- Name: user_schemas; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.user_schemas (
    id text NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    instance_id text NOT NULL,
    type text NOT NULL,
    revision bigint NOT NULL,
    schema jsonb,
    possible_authenticators smallint[]
);


ALTER TABLE projections.user_schemas OWNER TO postgres;

--
-- Name: users13; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.users13 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    username text NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE projections.users13 OWNER TO postgres;

--
-- Name: users13_humans; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.users13_humans (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    avatar_key text,
    email text NOT NULL,
    is_email_verified boolean DEFAULT false NOT NULL,
    phone text,
    is_phone_verified boolean,
    password_change_required boolean NOT NULL,
    password_changed timestamp with time zone
);


ALTER TABLE projections.users13_humans OWNER TO postgres;

--
-- Name: users13_machines; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.users13_machines (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    description text,
    secret text,
    access_token_type smallint DEFAULT 0 NOT NULL
);


ALTER TABLE projections.users13_machines OWNER TO postgres;

--
-- Name: users13_notifications; Type: TABLE; Schema: projections; Owner: postgres
--

CREATE TABLE projections.users13_notifications (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    last_email text,
    verified_email text,
    last_phone text,
    verified_phone text,
    password_set boolean DEFAULT false NOT NULL,
    verified_email_lower text GENERATED ALWAYS AS (lower(verified_email)) STORED
);


ALTER TABLE projections.users13_notifications OWNER TO postgres;

--
-- Name: assets; Type: TABLE; Schema: system; Owner: postgres
--

CREATE TABLE system.assets (
    instance_id text NOT NULL,
    asset_type text,
    resource_owner text NOT NULL,
    name text NOT NULL,
    content_type text,
    hash text GENERATED ALWAYS AS (md5(data)) STORED,
    data bytea,
    updated_at timestamp with time zone
);


ALTER TABLE system.assets OWNER TO postgres;

--
-- Name: encryption_keys; Type: TABLE; Schema: system; Owner: postgres
--

CREATE TABLE system.encryption_keys (
    id text NOT NULL,
    key text NOT NULL
);


ALTER TABLE system.encryption_keys OWNER TO postgres;

--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: adminapi; Owner: postgres
--

COPY adminapi.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: adminapi; Owner: postgres
--

COPY adminapi.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: adminapi; Owner: postgres
--

COPY adminapi.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
\.


--
-- Data for Name: styling; Type: TABLE DATA; Schema: adminapi; Owner: postgres
--

COPY adminapi.styling (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id) FROM stdin;
\.


--
-- Data for Name: styling2; Type: TABLE DATA; Schema: adminapi; Owner: postgres
--

COPY adminapi.styling2 (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	3	22	#5469d4	#fafafa	#cd3d56	#000000	#2073c4	#111827	#ff3b5b	#ffffff						f	f	f	275845547489756116	f
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	1	23	#5469d4	#fafafa	#cd3d56	#000000	#2073c4	#111827	#ff3b5b	#ffffff						f	f	f	275845547489756116	f
\.


--
-- Data for Name: auth_requests; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.auth_requests (id, request, code, request_type, creation_date, change_date, instance_id) FROM stdin;
\.


--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: idp_configs; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.idp_configs (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id) FROM stdin;
\.


--
-- Data for Name: idp_configs2; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.idp_configs2 (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: idp_providers; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.idp_providers (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id) FROM stdin;
\.


--
-- Data for Name: idp_providers2; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.idp_providers2 (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
\.


--
-- Data for Name: org_project_mapping; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.org_project_mapping (org_id, project_id, project_grant_id, instance_id) FROM stdin;
\.


--
-- Data for Name: org_project_mapping2; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.org_project_mapping2 (org_id, project_id, project_grant_id, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.refresh_tokens (id, creation_date, change_date, resource_owner, token, client_id, user_agent_id, user_id, auth_time, idle_expiration, expiration, sequence, scopes, audience, amr, instance_id, actor) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.tokens (id, creation_date, change_date, resource_owner, application_id, user_agent_id, user_id, expiration, sequence, scopes, audience, preferred_language, refresh_token_id, is_pat, instance_id, actor) FROM stdin;
\.


--
-- Data for Name: user_external_idps; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.user_external_idps (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id) FROM stdin;
\.


--
-- Data for Name: user_external_idps2; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.user_external_idps2 (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id, owner_removed) FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.user_sessions (creation_date, change_date, resource_owner, state, user_agent_id, user_id, user_name, password_verification, second_factor_verification, multi_factor_verification, sequence, second_factor_verification_type, multi_factor_verification_type, user_display_name, login_name, external_login_verification, selected_idp_config_id, passwordless_verification, avatar_key, instance_id) FROM stdin;
2024-07-13 19:20:18.737475-04	2024-07-13 19:20:46.293416-04	275845547489821652	0	275845588107396052	275845547490345940	\N	2024-07-13 19:20:46.293416-04	\N	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	275845547489756116
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.users (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id) FROM stdin;
\.


--
-- Data for Name: users2; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.users2 (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id, owner_removed, otp_sms_added, otp_email_added) FROM stdin;
\.


--
-- Data for Name: users3; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.users3 (instance_id, id, resource_owner, change_date, password_set, password_change, last_login, init_required, mfa_init_skipped, username_change_required, passwordless_init_required, password_init_required) FROM stdin;
275845547489756116	275845547490345940	275845547489821652	2024-07-13 19:20:46.293416-04	t	2024-07-13 19:20:46.293416-04	\N	\N	2024-07-13 19:20:28.151086-04	\N	\N	f
\.


--
-- Data for Name: events2; Type: TABLE DATA; Schema: eventstore; Owner: postgres
--

COPY eventstore.events2 (instance_id, aggregate_type, aggregate_id, event_type, sequence, revision, created_at, payload, creator, owner, "position", in_tx_order) FROM stdin;
	system	SYSTEM	system.migration.started	1	1	2024-07-13 19:19:18.193346-04	{"name": "14_events_push"}	system	SYSTEM	1720912758.193358	0
	system	SYSTEM	system.migration.done	2	1	2024-07-13 19:19:18.483377-04	{"name": "14_events_push"}	system	SYSTEM	1720912758.483422	0
	system	SYSTEM	system.migration.started	3	1	2024-07-13 19:19:18.524566-04	{"name": "01_tables"}	system	SYSTEM	1720912758.524582	0
	system	SYSTEM	system.migration.done	4	1	2024-07-13 19:19:18.593718-04	{"name": "01_tables"}	system	SYSTEM	1720912758.593733	0
	system	SYSTEM	system.migration.started	5	1	2024-07-13 19:19:18.608114-04	{"name": "02_assets"}	system	SYSTEM	1720912758.608133	0
	system	SYSTEM	system.migration.done	6	1	2024-07-13 19:19:18.635946-04	{"name": "02_assets"}	system	SYSTEM	1720912758.635959	0
	system	SYSTEM	system.migration.started	7	1	2024-07-13 19:19:18.651584-04	{"name": "03_default_instance"}	system	SYSTEM	1720912758.651598	0
275845547489756116	instance	275845547489756116	instance.added	1	1	2024-07-13 19:19:19.788267-04	{"name": "ZITADEL"}		275845547489756116	1720912759.788286	0
275845547489756116	instance	275845547489756116	instance.default.language.set	2	1	2024-07-13 19:19:19.788267-04	{"language": "en"}		275845547489756116	1720912759.788348	1
275845547489756116	instance	275845547489756116	instance.secret.generator.added	3	1	2024-07-13 19:19:19.788267-04	{"length": 64, "generatorType": 7, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		275845547489756116	1720912759.788357	2
275845547489756116	instance	275845547489756116	instance.secret.generator.added	4	1	2024-07-13 19:19:19.788267-04	{"expiry": 259200000000000, "length": 6, "generatorType": 1, "includeDigits": true, "includeUpperLetters": true}		275845547489756116	1720912759.788363	3
275845547489756116	instance	275845547489756116	instance.secret.generator.added	5	1	2024-07-13 19:19:19.788267-04	{"expiry": 3600000000000, "length": 6, "generatorType": 2, "includeDigits": true, "includeUpperLetters": true}		275845547489756116	1720912759.788371	4
275845547489756116	instance	275845547489756116	instance.secret.generator.added	6	1	2024-07-13 19:19:19.788267-04	{"expiry": 3600000000000, "length": 6, "generatorType": 3, "includeDigits": true, "includeUpperLetters": true}		275845547489756116	1720912759.788377	5
275845547489756116	instance	275845547489756116	instance.secret.generator.added	7	1	2024-07-13 19:19:19.788267-04	{"expiry": 3600000000000, "length": 6, "generatorType": 5, "includeDigits": true, "includeUpperLetters": true}		275845547489756116	1720912759.788383	6
275845547489756116	instance	275845547489756116	instance.secret.generator.added	8	1	2024-07-13 19:19:19.788267-04	{"expiry": 3600000000000, "length": 12, "generatorType": 6, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		275845547489756116	1720912759.788388	7
275845547489756116	instance	275845547489756116	instance.secret.generator.added	9	1	2024-07-13 19:19:19.788267-04	{"length": 32, "generatorType": 4, "includeDigits": true, "includeLowerLetters": true, "includeUpperLetters": true}		275845547489756116	1720912759.788394	8
275845547489756116	instance	275845547489756116	instance.secret.generator.added	10	1	2024-07-13 19:19:19.788267-04	{"expiry": 300000000000, "length": 8, "generatorType": 8, "includeDigits": true}		275845547489756116	1720912759.788402	9
275845547489756116	instance	275845547489756116	instance.secret.generator.added	11	1	2024-07-13 19:19:19.788267-04	{"expiry": 300000000000, "length": 8, "generatorType": 9, "includeDigits": true}		275845547489756116	1720912759.788408	10
275845547489756116	instance	275845547489756116	instance.policy.password.complexity.added	12	1	2024-07-13 19:19:19.788267-04	{"hasNumber": true, "hasSymbol": true, "minLength": 8, "hasLowercase": true, "hasUppercase": true}		275845547489756116	1720912759.788414	11
275845547489756116	instance	275845547489756116	instance.policy.password.age.added	13	1	2024-07-13 19:19:19.788267-04	{}		275845547489756116	1720912759.788421	12
275845547489756116	instance	275845547489756116	instance.policy.domain.added	14	1	2024-07-13 19:19:19.788267-04	{}		275845547489756116	1720912759.788432	13
275845547489756116	instance	275845547489756116	instance.policy.login.added	15	1	2024-07-13 19:19:19.788267-04	{"allowRegister": true, "allowExternalIdp": true, "passwordlessType": 1, "mfaInitSkipLifetime": 2592000000000000, "allowDomainDiscovery": true, "allowUsernamePassword": true, "passwordCheckLifetime": 864000000000000, "multiFactorCheckLifetime": 43200000000000, "secondFactorCheckLifetime": 64800000000000, "externalLoginCheckLifetime": 864000000000000}		275845547489756116	1720912759.788440	14
275845547489756116	instance	275845547489756116	instance.policy.login.secondfactor.added	16	1	2024-07-13 19:19:19.788267-04	{"mfaType": 1}		275845547489756116	1720912759.788449	15
275845547489756116	instance	275845547489756116	instance.policy.login.secondfactor.added	17	1	2024-07-13 19:19:19.788267-04	{"mfaType": 2}		275845547489756116	1720912759.788457	16
275845547489756116	instance	275845547489756116	instance.policy.login.multifactor.added	18	1	2024-07-13 19:19:19.788267-04	{"mfaType": 1}		275845547489756116	1720912759.788465	17
275845547489756116	instance	275845547489756116	instance.policy.privacy.added	19	1	2024-07-13 19:19:19.788267-04	{"tosLink": "https://zitadel.com/docs/legal/terms-of-service", "docsLink": "https://zitadel.com/docs", "privacyLink": "https://zitadel.com/docs/legal/privacy-policy"}		275845547489756116	1720912759.788474	18
275845547489756116	instance	275845547489756116	instance.policy.notification.added	20	1	2024-07-13 19:19:19.788267-04	{"passwordChange": true}		275845547489756116	1720912759.788482	19
275845547489756116	instance	275845547489756116	instance.policy.lockout.added	21	1	2024-07-13 19:19:19.788267-04	{"showLockOutFailures": true}		275845547489756116	1720912759.788492	20
275845547489756116	instance	275845547489756116	instance.policy.label.added	22	1	2024-07-13 19:19:19.788267-04	{"fontColor": "#000000", "warnColor": "#cd3d56", "primaryColor": "#5469d4", "fontColorDark": "#ffffff", "warnColorDark": "#ff3b5b", "backgroundColor": "#fafafa", "primaryColorDark": "#2073c4", "backgroundColorDark": "#111827"}		275845547489756116	1720912759.788500	21
275845547489756116	instance	275845547489756116	instance.policy.label.activated	23	1	2024-07-13 19:19:19.788267-04	{}		275845547489756116	1720912759.788509	22
275845547489756116	instance	275845547489756116	instance.mail.template.added	24	1	2024-07-13 19:19:19.788267-04	{"template": "CjwhZG9jdHlwZSBodG1sPgo8aHRtbCB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVybjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSI+CjxoZWFkPgogIDx0aXRsZT4KCiAgPC90aXRsZT4KICA8IS0tW2lmICFtc29dPjwhLS0+CiAgPG1ldGEgaHR0cC1lcXVpdj0iWC1VQS1Db21wYXRpYmxlIiBjb250ZW50PSJJRT1lZGdlIj4KICA8IS0tPCFbZW5kaWZdLS0+CiAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogIDxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MSI+CiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4KICAgICNvdXRsb29rIGEgeyBwYWRkaW5nOjA7IH0KICAgIGJvZHkgeyBtYXJnaW46MDtwYWRkaW5nOjA7LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OjEwMCU7LW1zLXRleHQtc2l6ZS1hZGp1c3Q6MTAwJTsgfQogICAgdGFibGUsIHRkIHsgYm9yZGVyLWNvbGxhcHNlOmNvbGxhcHNlO21zby10YWJsZS1sc3BhY2U6MHB0O21zby10YWJsZS1yc3BhY2U6MHB0OyB9CiAgICBpbWcgeyBib3JkZXI6MDtoZWlnaHQ6YXV0bztsaW5lLWhlaWdodDoxMDAlOyBvdXRsaW5lOm5vbmU7dGV4dC1kZWNvcmF0aW9uOm5vbmU7LW1zLWludGVycG9sYXRpb24tbW9kZTpiaWN1YmljOyB9CiAgICBwIHsgZGlzcGxheTpibG9jazttYXJnaW46MTNweCAwOyB9CiAgPC9zdHlsZT4KICA8IS0tW2lmIG1zb10+CiAgPHhtbD4KICAgIDxvOk9mZmljZURvY3VtZW50U2V0dGluZ3M+CiAgICAgIDxvOkFsbG93UE5HLz4KICAgICAgPG86UGl4ZWxzUGVySW5jaD45NjwvbzpQaXhlbHNQZXJJbmNoPgogICAgPC9vOk9mZmljZURvY3VtZW50U2V0dGluZ3M+CiAgPC94bWw+CiAgPCFbZW5kaWZdLS0+CiAgPCEtLVtpZiBsdGUgbXNvIDExXT4KICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgogICAgLm1qLW91dGxvb2stZ3JvdXAtZml4IHsgd2lkdGg6MTAwJSAhaW1wb3J0YW50OyB9CiAgPC9zdHlsZT4KICA8IVtlbmRpZl0tLT4KCgogIDxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CiAgICBAbWVkaWEgb25seSBzY3JlZW4gYW5kIChtaW4td2lkdGg6NDgwcHgpIHsKICAgICAgLm1qLWNvbHVtbi1wZXItMTAwIHsgd2lkdGg6MTAwJSAhaW1wb3J0YW50OyBtYXgtd2lkdGg6IDEwMCU7IH0KICAgICAgLm1qLWNvbHVtbi1wZXItNjAgeyB3aWR0aDo2MCUgIWltcG9ydGFudDsgbWF4LXdpZHRoOiA2MCU7IH0KICAgIH0KICA8L3N0eWxlPgoKCiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4KCgoKICAgIEBtZWRpYSBvbmx5IHNjcmVlbiBhbmQgKG1heC13aWR0aDo0ODBweCkgewogICAgICB0YWJsZS5tai1mdWxsLXdpZHRoLW1vYmlsZSB7IHdpZHRoOiAxMDAlICFpbXBvcnRhbnQ7IH0KICAgICAgdGQubWotZnVsbC13aWR0aC1tb2JpbGUgeyB3aWR0aDogYXV0byAhaW1wb3J0YW50OyB9CiAgICB9CgogIDwvc3R5bGU+CiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4uc2hhZG93IGEgewogICAgYm94LXNoYWRvdzogMHB4IDNweCAxcHggLTJweCByZ2JhKDAsIDAsIDAsIDAuMiksIDBweCAycHggMnB4IDBweCByZ2JhKDAsIDAsIDAsIDAuMTQpLCAwcHggMXB4IDVweCAwcHggcmdiYSgwLCAwLCAwLCAwLjEyKTsKICB9PC9zdHlsZT4KCiAge3tpZiAuRm9udFVSTH19CiAgPHN0eWxlPgogICAgQGZvbnQtZmFjZSB7CiAgICAgIGZvbnQtZmFtaWx5OiAne3suRm9udEZhY2VGYW1pbHl9fSc7CiAgICAgIGZvbnQtc3R5bGU6IG5vcm1hbDsKICAgICAgZm9udC1kaXNwbGF5OiBzd2FwOwogICAgICBzcmM6IHVybCh7ey5Gb250VVJMfX0pOwogICAgfQogIDwvc3R5bGU+CiAge3tlbmR9fQoKPC9oZWFkPgo8Ym9keSBzdHlsZT0id29yZC1zcGFjaW5nOm5vcm1hbDsiPgoKCjxkaXYKICAgICAgICBzdHlsZT0iIgo+CgogIDx0YWJsZQogICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9ImJhY2tncm91bmQ6e3suQmFja2dyb3VuZENvbG9yfX07YmFja2dyb3VuZC1jb2xvcjp7ey5CYWNrZ3JvdW5kQ29sb3J9fTt3aWR0aDoxMDAlO2JvcmRlci1yYWRpdXM6MTZweDsiCiAgPgogICAgPHRib2R5PgogICAgPHRyPgogICAgICA8dGQ+CgoKICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIGNsYXNzPSIiIHN0eWxlPSJ3aWR0aDo4MDBweDsiIHdpZHRoPSI4MDAiID48dHI+PHRkIHN0eWxlPSJsaW5lLWhlaWdodDowcHg7Zm9udC1zaXplOjBweDttc28tbGluZS1oZWlnaHQtcnVsZTpleGFjdGx5OyI+PCFbZW5kaWZdLS0+CgoKICAgICAgICA8ZGl2ICBzdHlsZT0ibWFyZ2luOjBweCBhdXRvO2JvcmRlci1yYWRpdXM6MTZweDttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7Ym9yZGVyLXJhZGl1czoxNnB4OyIKICAgICAgICAgID4KICAgICAgICAgICAgPHRib2R5PgogICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICBzdHlsZT0iZGlyZWN0aW9uOmx0cjtmb250LXNpemU6MHB4O3BhZGRpbmc6MjBweCAwO3BhZGRpbmctbGVmdDowO3RleHQtYWxpZ246Y2VudGVyOyIKICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiB3aWR0aD0iODAwcHgiID48IVtlbmRpZl0tLT4KCiAgICAgICAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICA8dGQ+CgoKICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBhbGlnbj0iY2VudGVyIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgY2xhc3M9IiIgc3R5bGU9IndpZHRoOjgwMHB4OyIgd2lkdGg9IjgwMCIgPjx0cj48dGQgc3R5bGU9ImxpbmUtaGVpZ2h0OjBweDtmb250LXNpemU6MHB4O21zby1saW5lLWhlaWdodC1ydWxlOmV4YWN0bHk7Ij48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgICAgPGRpdiAgc3R5bGU9Im1hcmdpbjowcHggYXV0bzttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHN0eWxlPSJ3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImRpcmVjdGlvbjpsdHI7Zm9udC1zaXplOjBweDtwYWRkaW5nOjA7dGV4dC1hbGlnbjpjZW50ZXI7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiBzdHlsZT0id2lkdGg6ODAwcHg7IiA+PCFbZW5kaWZdLS0+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xhc3M9Im1qLWNvbHVtbi1wZXItMTAwIG1qLW91dGxvb2stZ3JvdXAtZml4IiBzdHlsZT0iZm9udC1zaXplOjA7bGluZS1oZWlnaHQ6MDt0ZXh0LWFsaWduOmxlZnQ7ZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6MTAwJTtkaXJlY3Rpb246bHRyOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiA+PHRyPjx0ZCBzdHlsZT0idmVydGljYWwtYWxpZ246dG9wO3dpZHRoOjgwMHB4OyIgPjwhW2VuZGlmXS0tPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGFzcz0ibWotY29sdW1uLXBlci0xMDAgbWotb3V0bG9vay1ncm91cC1maXgiIHN0eWxlPSJmb250LXNpemU6MHB4O3RleHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO2Rpc3BsYXk6aW5saW5lLWJsb2NrO3ZlcnRpY2FsLWFsaWduOnRvcDt3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHdpZHRoPSIxMDAlIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjp0b3A7cGFkZGluZzowOyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7e2lmIC5Mb2dvVVJMfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRib2R5PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzo1MHB4IDAgMzBweCAwO3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOmNvbGxhcHNlO2JvcmRlci1zcGFjaW5nOjBweDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9IndpZHRoOjE4MHB4OyI+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGltZwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZWlnaHQ9ImF1dG8iIHNyYz0ie3suTG9nb1VSTH19IiBzdHlsZT0iYm9yZGVyOjA7Ym9yZGVyLXJhZGl1czo4cHg7ZGlzcGxheTpibG9jaztvdXRsaW5lOm5vbmU7dGV4dC1kZWNvcmF0aW9uOm5vbmU7aGVpZ2h0OmF1dG87d2lkdGg6MTAwJTtmb250LXNpemU6MTNweDsiIHdpZHRoPSIxODAiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAge3tlbmR9fQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC90Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4KCgogICAgICAgICAgICAgICAgICAgICAgPCEtLVtpZiBtc28gfCBJRV0+PC90ZD48L3RyPjwvdGFibGU+PCFbZW5kaWZdLS0+CgoKICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PHRyPjx0ZCBjbGFzcz0iIiB3aWR0aD0iODAwcHgiID48IVtlbmRpZl0tLT4KCiAgICAgICAgICAgICAgICA8dGFibGUKICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9IndpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICA8dGQ+CgoKICAgICAgICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjx0YWJsZSBhbGlnbj0iY2VudGVyIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgY2xhc3M9IiIgc3R5bGU9IndpZHRoOjgwMHB4OyIgd2lkdGg9IjgwMCIgPjx0cj48dGQgc3R5bGU9ImxpbmUtaGVpZ2h0OjBweDtmb250LXNpemU6MHB4O21zby1saW5lLWhlaWdodC1ydWxlOmV4YWN0bHk7Ij48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgICAgPGRpdiAgc3R5bGU9Im1hcmdpbjowcHggYXV0bzttYXgtd2lkdGg6ODAwcHg7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIGJvcmRlcj0iMCIgY2VsbHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIiByb2xlPSJwcmVzZW50YXRpb24iIHN0eWxlPSJ3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgIDx0Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImRpcmVjdGlvbjpsdHI7Zm9udC1zaXplOjBweDtwYWRkaW5nOjA7dGV4dC1hbGlnbjpjZW50ZXI7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgcm9sZT0icHJlc2VudGF0aW9uIiBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCBjbGFzcz0iIiBzdHlsZT0idmVydGljYWwtYWxpZ246dG9wO3dpZHRoOjQ4MHB4OyIgPjwhW2VuZGlmXS0tPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsYXNzPSJtai1jb2x1bW4tcGVyLTYwIG1qLW91dGxvb2stZ3JvdXAtZml4IiBzdHlsZT0iZm9udC1zaXplOjBweDt0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjtkaXNwbGF5OmlubGluZS1ibG9jazt2ZXJ0aWNhbC1hbGlnbjp0b3A7d2lkdGg6MTAwJTsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9InZlcnRpY2FsLWFsaWduOnRvcDtwYWRkaW5nOjA7Ij4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iIiB3aWR0aD0iMTAwJSIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbGlnbj0iY2VudGVyIiBzdHlsZT0iZm9udC1zaXplOjBweDtwYWRkaW5nOjEwcHggMjVweDt3b3JkLWJyZWFrOmJyZWFrLXdvcmQ7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0eWxlPSJmb250LWZhbWlseTp7ey5Gb250RmFtaWx5fX07Zm9udC1zaXplOjI0cHg7Zm9udC13ZWlnaHQ6NTAwO2xpbmUtaGVpZ2h0OjE7dGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6e3suRm9udENvbG9yfX07IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID57ey5HcmVldGluZ319PC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIHN0eWxlPSJmb250LXNpemU6MHB4O3BhZGRpbmc6MTBweCAyNXB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImZvbnQtZmFtaWx5Ont7LkZvbnRGYW1pbHl9fTtmb250LXNpemU6MTZweDtmb250LXdlaWdodDpsaWdodDtsaW5lLWhlaWdodDoxLjU7dGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6e3suRm9udENvbG9yfX07IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID57ey5UZXh0fX08L2Rpdj4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWduPSJjZW50ZXIiIHZlcnRpY2FsLWFsaWduPSJtaWRkbGUiIGNsYXNzPSJzaGFkb3ciIHN0eWxlPSJmb250LXNpemU6MHB4O3BhZGRpbmc6MTBweCAyNXB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCIgcm9sZT0icHJlc2VudGF0aW9uIiBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOnNlcGFyYXRlO2xpbmUtaGVpZ2h0OjEwMCU7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgYmdjb2xvcj0ie3suUHJpbWFyeUNvbG9yfX0iIHJvbGU9InByZXNlbnRhdGlvbiIgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1yYWRpdXM6NnB4O2N1cnNvcjphdXRvO21zby1wYWRkaW5nLWFsdDoxMHB4IDI1cHg7YmFja2dyb3VuZDp7ey5QcmltYXJ5Q29sb3J9fTsiIHZhbGlnbj0ibWlkZGxlIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhyZWY9Int7LlVSTH19IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIgbm90cmFjayIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO2JhY2tncm91bmQ6e3suUHJpbWFyeUNvbG9yfX07Y29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTp7ey5Gb250RmFtaWx5fX07Zm9udC1zaXplOjE0cHg7Zm9udC13ZWlnaHQ6NTAwO2xpbmUtaGVpZ2h0OjEyMCU7bWFyZ2luOjA7dGV4dC1kZWNvcmF0aW9uOm5vbmU7dGV4dC10cmFuc2Zvcm06bm9uZTtwYWRkaW5nOjEwcHggMjVweDttc28tcGFkZGluZy1hbHQ6MHB4O2JvcmRlci1yYWRpdXM6NnB4OyIgdGFyZ2V0PSJfYmxhbmsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAge3suQnV0dG9uVGV4dH19CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9hPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7e2lmIC5JbmNsdWRlRm9vdGVyfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzoxMHB4IDI1cHg7cGFkZGluZy10b3A6MjBweDtwYWRkaW5nLXJpZ2h0OjIwcHg7cGFkZGluZy1ib3R0b206MjBweDtwYWRkaW5nLWxlZnQ6MjBweDt3b3JkLWJyZWFrOmJyZWFrLXdvcmQ7IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHlsZT0iYm9yZGVyLXRvcDpzb2xpZCAycHggI2RiZGJkYjtmb250LXNpemU6MXB4O21hcmdpbjowcHggYXV0bzt3aWR0aDoxMDAlOyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48dGFibGUgYWxpZ249ImNlbnRlciIgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiIHN0eWxlPSJib3JkZXItdG9wOnNvbGlkIDJweCAjZGJkYmRiO2ZvbnQtc2l6ZToxcHg7bWFyZ2luOjBweCBhdXRvO3dpZHRoOjQ0MHB4OyIgcm9sZT0icHJlc2VudGF0aW9uIiB3aWR0aD0iNDQwcHgiID48dHI+PHRkIHN0eWxlPSJoZWlnaHQ6MDtsaW5lLWhlaWdodDowOyI+ICZuYnNwOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ249ImNlbnRlciIgc3R5bGU9ImZvbnQtc2l6ZTowcHg7cGFkZGluZzoxNnB4O3dvcmQtYnJlYWs6YnJlYWstd29yZDsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9ImZvbnQtZmFtaWx5Ont7LkZvbnRGYW1pbHl9fTtmb250LXNpemU6MTNweDtsaW5lLWhlaWdodDoxO3RleHQtYWxpZ246Y2VudGVyO2NvbG9yOnt7LkZvbnRDb2xvcn19OyIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+e3suRm9vdGVyVGV4dH19PC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHt7ZW5kfX0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90Ym9keT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PC90YWJsZT48IVtlbmRpZl0tLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgoKCiAgICAgICAgICAgICAgICAgICAgICA8IS0tW2lmIG1zbyB8IElFXT48L3RkPjwvdHI+PC90YWJsZT48IVtlbmRpZl0tLT4KCgogICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICAgICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgogICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICA8L3RhYmxlPgoKICAgICAgICA8L2Rpdj4KCgogICAgICAgIDwhLS1baWYgbXNvIHwgSUVdPjwvdGQ+PC90cj48L3RhYmxlPjwhW2VuZGlmXS0tPgoKCiAgICAgIDwvdGQ+CiAgICA8L3RyPgogICAgPC90Ym9keT4KICA8L3RhYmxlPgoKPC9kaXY+Cgo8L2JvZHk+CjwvaHRtbD4K"}		275845547489756116	1720912759.788518	23
275845547489756116	org	275845547489821652	org.added	1	1	2024-07-13 19:19:19.788267-04	{"name": "ZITADEL"}		275845547489821652	1720912759.789111	24
275845547489756116	org	275845547489821652	org.domain.added	2	1	2024-07-13 19:19:19.788267-04	{"domain": "zitadel.localhost"}		275845547489821652	1720912759.789120	25
275845547489756116	org	275845547489821652	org.domain.verified	3	1	2024-07-13 19:19:19.788267-04	{"domain": "zitadel.localhost"}		275845547489821652	1720912759.789127	26
275845547489756116	org	275845547489821652	org.domain.primary.set	4	1	2024-07-13 19:19:19.788267-04	{"domain": "zitadel.localhost"}		275845547489821652	1720912759.789136	27
275845547489756116	instance	275845547489756116	instance.default.org.set	25	1	2024-07-13 19:19:19.788267-04	{"orgId": "275845547489821652"}		275845547489756116	1720912759.789275	28
275845547489756116	user	275845547490345940	user.human.added	1	2	2024-07-13 19:19:19.788267-04	{"email": "zitadel-admin@zitadel.localhost", "lastName": "Admin", "userName": "zitadel-admin@zitadel.localhost", "firstName": "ZITADEL", "displayName": "ZITADEL Admin", "encodedHash": "$2a$14$gTgHoBxkW1QBLY8o987.lu1/T2qwIW1bU/sj5mnT0Q5luc0LsFbO6", "changeRequired": true, "preferredLanguage": "en"}		275845547489821652	1720912759.789285	29
275845547489756116	user	275845547490345940	user.human.email.verified	2	2	2024-07-13 19:19:19.788267-04	\N		275845547489821652	1720912759.789292	30
275845547489756116	org	275845547489821652	org.member.added	5	1	2024-07-13 19:19:19.788267-04	{"roles": ["ORG_OWNER"], "userId": "275845547490345940"}		275845547489821652	1720912759.789299	31
275845547489756116	instance	275845547489756116	instance.member.added	26	1	2024-07-13 19:19:19.788267-04	{"roles": ["IAM_OWNER"], "userId": "275845547490345940"}		275845547489756116	1720912759.789307	32
275845547489756116	project	275845547489887188	project.added	1	1	2024-07-13 19:19:19.788267-04	{"name": "ZITADEL"}		275845547489821652	1720912759.789316	33
275845547489756116	project	275845547489887188	project.member.added	2	1	2024-07-13 19:19:19.788267-04	{"roles": ["PROJECT_OWNER"], "userId": "275845547490345940"}		275845547489821652	1720912759.789323	34
275845547489756116	instance	275845547489756116	instance.iam.project.set	27	1	2024-07-13 19:19:19.788267-04	{"iamProjectId": "275845547489887188"}		275845547489756116	1720912759.789330	35
275845547489756116	project	275845547489887188	project.application.added	3	1	2024-07-13 19:19:19.788267-04	{"name": "Management-API", "appId": "275845547489952724"}		275845547489821652	1720912759.789338	36
275845547489756116	project	275845547489887188	project.application.config.api.added	4	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547489952724", "clientId": "275845549117146068@zitadel", "authMethodType": 1}		275845547489821652	1720912759.789345	37
275845547489756116	project	275845547489887188	project.application.added	5	1	2024-07-13 19:19:19.788267-04	{"name": "Admin-API", "appId": "275845547490018260"}		275845547489821652	1720912759.789354	38
275845547489756116	project	275845547489887188	project.application.config.api.added	6	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490018260", "clientId": "275845549133923284@zitadel", "authMethodType": 1}		275845547489821652	1720912759.789362	39
275845547489756116	project	275845547489887188	project.application.added	7	1	2024-07-13 19:19:19.788267-04	{"name": "Auth-API", "appId": "275845547490083796"}		275845547489821652	1720912759.789370	40
275845547489756116	project	275845547489887188	project.application.config.api.added	8	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490083796", "clientId": "275845549133988820@zitadel", "authMethodType": 1}		275845547489821652	1720912759.789378	41
275845547489756116	project	275845547489887188	project.application.added	9	1	2024-07-13 19:19:19.788267-04	{"name": "Console", "appId": "275845547490149332"}		275845547489821652	1720912759.789385	42
275845547489756116	project	275845547489887188	project.application.config.oidc.added	10	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490149332", "devMode": true, "clientId": "275845549150700500@zitadel", "grantTypes": [0], "responseTypes": [0], "authMethodType": 2, "applicationType": 1}		275845547489821652	1720912759.789393	43
275845547489756116	instance	275845547489756116	instance.iam.console.set	28	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490149332", "clientId": "275845549150700500@zitadel"}		275845547489756116	1720912759.789403	44
275845547489756116	instance	275845547489756116	instance.domain.added	29	1	2024-07-13 19:19:19.788267-04	{"domain": "zitadel-180ieg.localhost", "generated": true}		275845547489756116	1720912759.789411	45
275845547489756116	project	275845547489887188	project.application.config.oidc.changed	11	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490149332", "redirectUris": ["http://zitadel-180ieg.localhost:8080/ui/console/auth/callback"], "postLogoutRedirectUris": ["http://zitadel-180ieg.localhost:8080/ui/console/signedout"]}		275845547489821652	1720912759.789420	46
275845547489756116	instance	275845547489756116	instance.domain.primary.set	30	1	2024-07-13 19:19:19.788267-04	{"domain": "zitadel-180ieg.localhost"}		275845547489756116	1720912759.789428	47
275845547489756116	instance	275845547489756116	instance.domain.added	31	1	2024-07-13 19:19:19.788267-04	{"domain": "localhost"}		275845547489756116	1720912759.789437	48
275845547489756116	project	275845547489887188	project.application.config.oidc.changed	12	1	2024-07-13 19:19:19.788267-04	{"appId": "275845547490149332", "redirectUris": ["http://zitadel-180ieg.localhost:8080/ui/console/auth/callback", "http://localhost:8080/ui/console/auth/callback"], "postLogoutRedirectUris": ["http://zitadel-180ieg.localhost:8080/ui/console/signedout", "http://localhost:8080/ui/console/signedout"]}		275845547489821652	1720912759.789446	49
275845547489756116	instance	275845547489756116	instance.domain.primary.set	32	1	2024-07-13 19:19:19.788267-04	{"domain": "localhost"}		275845547489756116	1720912759.789456	50
275845547489756116	instance	275845547489756116	instance.customtext.set	33	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789464	51
275845547489756116	instance	275845547489756116	instance.customtext.set	34	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "User initialisieren", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789472	52
275845547489756116	instance	275845547489756116	instance.customtext.set	35	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - User initialisieren", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789481	53
275845547489756116	instance	275845547489756116	instance.customtext.set	36	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "User initialisieren", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789490	54
275845547489756116	instance	275845547489756116	instance.customtext.set	37	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen &lt;br&gt;&lt;strong&gt;{{.PreferredLoginName}}&lt;/strong&gt;&lt;br&gt; kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789498	55
	system	SYSTEM	system.migration.done	78	1	2024-07-13 19:19:24.284262-04	{"name": "projections.org_domains2"}	system	SYSTEM	1720912764.284351	0
275845547489756116	instance	275845547489756116	instance.customtext.set	38	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Initialisierung abschliessen", "language": "de", "template": "InitCode"}		275845547489756116	1720912759.789506	56
275845547489756116	instance	275845547489756116	instance.customtext.set	39	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789524	57
275845547489756116	instance	275845547489756116	instance.customtext.set	40	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789533	58
275845547489756116	instance	275845547489756116	instance.customtext.set	41	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789542	59
275845547489756116	instance	275845547489756116	instance.customtext.set	42	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789550	60
275845547489756116	instance	275845547489756116	instance.customtext.set	43	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789558	61
275845547489756116	instance	275845547489756116	instance.customtext.set	44	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Passwort zurücksetzen", "language": "de", "template": "PasswordReset"}		275845547489756116	1720912759.789566	62
275845547489756116	instance	275845547489756116	instance.customtext.set	45	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789574	63
275845547489756116	instance	275845547489756116	instance.customtext.set	46	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789583	64
275845547489756116	instance	275845547489756116	instance.customtext.set	47	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Email verifizieren", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789591	65
275845547489756116	instance	275845547489756116	instance.customtext.set	48	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789599	66
275845547489756116	instance	275845547489756116	instance.customtext.set	49	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789607	67
275845547489756116	instance	275845547489756116	instance.customtext.set	50	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Email verifizieren", "language": "de", "template": "VerifyEmail"}		275845547489756116	1720912759.789615	68
275845547489756116	instance	275845547489756116	instance.customtext.set	51	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789642	69
275845547489756116	instance	275845547489756116	instance.customtext.set	52	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789651	70
275845547489756116	instance	275845547489756116	instance.customtext.set	53	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789659	71
275845547489756116	instance	275845547489756116	instance.customtext.set	54	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Telefonnummer verifizieren", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789667	72
275845547489756116	instance	275845547489756116	instance.customtext.set	55	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789675	73
275845547489756116	instance	275845547489756116	instance.customtext.set	56	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Telefon verifizieren", "language": "de", "template": "VerifyPhone"}		275845547489756116	1720912759.789683	74
275845547489756116	instance	275845547489756116	instance.customtext.set	57	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789693	75
275845547489756116	instance	275845547489756116	instance.customtext.set	58	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Domain wurde beansprucht", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789701	76
275845547489756116	instance	275845547489756116	instance.customtext.set	59	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Domain wurde beansprucht", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789709	77
275845547489756116	instance	275845547489756116	instance.customtext.set	60	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Email / Username ändern", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789717	78
275845547489756116	instance	275845547489756116	instance.customtext.set	61	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789726	79
275845547489756116	instance	275845547489756116	instance.customtext.set	62	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Login", "language": "de", "template": "DomainClaimed"}		275845547489756116	1720912759.789735	80
275845547489756116	instance	275845547489756116	instance.customtext.set	63	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hallo {{.DisplayName}},", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789743	81
275845547489756116	instance	275845547489756116	instance.customtext.set	64	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Passwort von Benutzer wurde geändert", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789751	82
275845547489756116	instance	275845547489756116	instance.customtext.set	65	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "ZITADEL - Passwort von Benutzer wurde geändert", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789759	83
275845547489756116	instance	275845547489756116	instance.customtext.set	66	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Passwort Änderung", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789780	84
275845547489756116	instance	275845547489756116	instance.customtext.set	67	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789790	85
275845547489756116	instance	275845547489756116	instance.customtext.set	68	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Login", "language": "de", "template": "PasswordChange"}		275845547489756116	1720912759.789798	86
275845547489756116	instance	275845547489756116	instance.customtext.set	69	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789806	87
275845547489756116	instance	275845547489756116	instance.customtext.set	70	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Initialize User", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789814	88
275845547489756116	instance	275845547489756116	instance.customtext.set	71	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Initialize User", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789823	89
275845547489756116	instance	275845547489756116	instance.customtext.set	72	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Initialize User", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789848	90
275845547489756116	instance	275845547489756116	instance.customtext.set	73	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789856	91
275845547489756116	instance	275845547489756116	instance.customtext.set	74	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Finish initialization", "language": "en", "template": "InitCode"}		275845547489756116	1720912759.789907	92
275845547489756116	instance	275845547489756116	instance.customtext.set	75	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789918	93
275845547489756116	instance	275845547489756116	instance.customtext.set	76	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Reset password", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789929	94
275845547489756116	instance	275845547489756116	instance.customtext.set	77	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Reset password", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789938	95
275845547489756116	instance	275845547489756116	instance.customtext.set	78	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Reset password", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789946	96
275845547489756116	instance	275845547489756116	instance.customtext.set	79	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789954	97
275845547489756116	instance	275845547489756116	instance.customtext.set	80	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Reset password", "language": "en", "template": "PasswordReset"}		275845547489756116	1720912759.789963	98
275845547489756116	instance	275845547489756116	instance.customtext.set	81	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.789972	99
275845547489756116	instance	275845547489756116	instance.customtext.set	82	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.789981	100
275845547489756116	instance	275845547489756116	instance.customtext.set	83	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Verify email", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.789989	101
275845547489756116	instance	275845547489756116	instance.customtext.set	84	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.789998	102
275845547489756116	instance	275845547489756116	instance.customtext.set	85	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you din't add a new email, please ignore this email.", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.790006	103
275845547489756116	instance	275845547489756116	instance.customtext.set	86	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Verify email", "language": "en", "template": "VerifyEmail"}		275845547489756116	1720912759.790016	104
275845547489756116	instance	275845547489756116	instance.customtext.set	87	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790024	105
275845547489756116	instance	275845547489756116	instance.customtext.set	88	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790057	106
275845547489756116	instance	275845547489756116	instance.customtext.set	89	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Verify phone", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790067	107
275845547489756116	instance	275845547489756116	instance.customtext.set	90	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790075	108
275845547489756116	instance	275845547489756116	instance.customtext.set	91	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "A new phone number has been added. Please use the following code to verify it {{.Code}}.", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790084	109
275845547489756116	instance	275845547489756116	instance.customtext.set	92	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Verify phone", "language": "en", "template": "VerifyPhone"}		275845547489756116	1720912759.790094	110
275845547489756116	instance	275845547489756116	instance.customtext.set	93	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790102	111
275845547489756116	instance	275845547489756116	instance.customtext.set	94	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Domain has been claimed", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790121	112
275845547489756116	instance	275845547489756116	instance.customtext.set	95	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "Zitadel - Domain has been claimed", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790130	113
275845547489756116	instance	275845547489756116	instance.customtext.set	96	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Change email/username", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790139	114
275845547489756116	instance	275845547489756116	instance.customtext.set	97	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790148	115
275845547489756116	instance	275845547489756116	instance.customtext.set	98	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Login", "language": "en", "template": "DomainClaimed"}		275845547489756116	1720912759.790157	116
275845547489756116	instance	275845547489756116	instance.customtext.set	99	1	2024-07-13 19:19:19.788267-04	{"key": "Greeting", "text": "Hello {{.DisplayName}},", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790201	117
275845547489756116	instance	275845547489756116	instance.customtext.set	100	1	2024-07-13 19:19:19.788267-04	{"key": "Subject", "text": "Password of user has changed", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790211	118
275845547489756116	instance	275845547489756116	instance.customtext.set	101	1	2024-07-13 19:19:19.788267-04	{"key": "Title", "text": "ZITADEL - Password of user has changed", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790221	119
275845547489756116	instance	275845547489756116	instance.customtext.set	102	1	2024-07-13 19:19:19.788267-04	{"key": "PreHeader", "text": "Change password", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790230	120
275845547489756116	instance	275845547489756116	instance.customtext.set	103	1	2024-07-13 19:19:19.788267-04	{"key": "Text", "text": "The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790238	121
275845547489756116	instance	275845547489756116	instance.customtext.set	104	1	2024-07-13 19:19:19.788267-04	{"key": "ButtonText", "text": "Login", "language": "en", "template": "PasswordChange"}		275845547489756116	1720912759.790247	122
275845547489756116	instance	275845547489756116	instance.oidc.settings.added	105	1	2024-07-13 19:19:19.788267-04	{"idTokenLifetime": 43200000000000, "accessTokenLifetime": 43200000000000, "refreshTokenExpiration": 7776000000000000, "refreshTokenIdleExpiration": 2592000000000000}		275845547489756116	1720912759.790255	123
275845547489756116	feature	275845547489756116	feature.instance.login_default_org.set	1	2	2024-07-13 19:19:19.788267-04	{"Value": true}		275845547489756116	1720912759.790266	124
	system	SYSTEM	system.migration.done	8	1	2024-07-13 19:19:19.822037-04	{"name": "03_default_instance"}	system	SYSTEM	1720912759.822054	0
	system	SYSTEM	system.migration.started	9	1	2024-07-13 19:19:19.841972-04	{"name": "05_last_failed"}	system	SYSTEM	1720912759.841995	0
	system	SYSTEM	system.migration.done	10	1	2024-07-13 19:19:19.863922-04	{"name": "05_last_failed"}	system	SYSTEM	1720912759.863948	0
	system	SYSTEM	system.migration.started	11	1	2024-07-13 19:19:19.878052-04	{"name": "06_resource_owner_columns"}	system	SYSTEM	1720912759.878068	0
	system	SYSTEM	system.migration.done	12	1	2024-07-13 19:19:19.918512-04	{"name": "06_resource_owner_columns"}	system	SYSTEM	1720912759.918528	0
	system	SYSTEM	system.migration.started	13	1	2024-07-13 19:19:19.935372-04	{"name": "07_logstore"}	system	SYSTEM	1720912759.935388	0
	system	SYSTEM	system.migration.done	14	1	2024-07-13 19:19:19.968756-04	{"name": "07_logstore"}	system	SYSTEM	1720912759.968776	0
	system	SYSTEM	system.migration.started	15	1	2024-07-13 19:19:19.985591-04	{"name": "08_auth_token_indexes"}	system	SYSTEM	1720912759.985609	0
	system	SYSTEM	system.migration.done	16	1	2024-07-13 19:19:20.010578-04	{"name": "08_auth_token_indexes"}	system	SYSTEM	1720912760.010595	0
	system	SYSTEM	system.migration.started	17	1	2024-07-13 19:19:20.031273-04	{"name": "12_auth_users_otp_columns"}	system	SYSTEM	1720912760.031289	0
	system	SYSTEM	system.migration.done	18	1	2024-07-13 19:19:20.04885-04	{"name": "12_auth_users_otp_columns"}	system	SYSTEM	1720912760.048869	0
	system	SYSTEM	system.migration.started	19	1	2024-07-13 19:19:20.065533-04	{"name": "13_fix_quota_constraints"}	system	SYSTEM	1720912760.065554	0
	system	SYSTEM	system.migration.done	20	1	2024-07-13 19:19:20.082337-04	{"name": "13_fix_quota_constraints"}	system	SYSTEM	1720912760.082390	0
	system	SYSTEM	system.migration.started	21	1	2024-07-13 19:19:20.098645-04	{"name": "15_current_projection_state"}	system	SYSTEM	1720912760.098661	0
	system	SYSTEM	system.migration.done	22	1	2024-07-13 19:19:20.188825-04	{"name": "15_current_projection_state"}	system	SYSTEM	1720912760.188843	0
	system	SYSTEM	system.migration.started	23	1	2024-07-13 19:19:20.205501-04	{"name": "16_unique_constraint_lower"}	system	SYSTEM	1720912760.205546	0
	system	SYSTEM	system.migration.done	24	1	2024-07-13 19:19:20.226681-04	{"name": "16_unique_constraint_lower"}	system	SYSTEM	1720912760.226714	0
	system	SYSTEM	system.migration.started	25	1	2024-07-13 19:19:20.243432-04	{"name": "17_add_offset_col_to_current_states"}	system	SYSTEM	1720912760.243450	0
	system	SYSTEM	system.migration.done	26	1	2024-07-13 19:19:20.261136-04	{"name": "17_add_offset_col_to_current_states"}	system	SYSTEM	1720912760.261201	0
	system	SYSTEM	system.migration.started	27	1	2024-07-13 19:19:20.277434-04	{"name": "19_add_current_sequences_index"}	system	SYSTEM	1720912760.277451	0
	system	SYSTEM	system.migration.done	28	1	2024-07-13 19:19:20.302594-04	{"name": "19_add_current_sequences_index"}	system	SYSTEM	1720912760.302610	0
	system	SYSTEM	system.migration.started	29	1	2024-07-13 19:19:20.3182-04	{"name": "20_add_by_user_index_on_session"}	system	SYSTEM	1720912760.318221	0
	system	SYSTEM	system.migration.done	30	1	2024-07-13 19:19:20.343274-04	{"name": "20_add_by_user_index_on_session"}	system	SYSTEM	1720912760.343299	0
	system	SYSTEM	system.migration.started	31	1	2024-07-13 19:19:20.358895-04	{"name": "22_active_instance_events_index"}	system	SYSTEM	1720912760.358910	0
	system	SYSTEM	system.migration.done	32	1	2024-07-13 19:19:20.383848-04	{"name": "22_active_instance_events_index"}	system	SYSTEM	1720912760.383864	0
	system	SYSTEM	system.migration.started	33	1	2024-07-13 19:19:20.411919-04	{"name": "23_correct_global_unique_constraints"}	system	SYSTEM	1720912760.411935	0
	system	SYSTEM	system.migration.done	34	1	2024-07-13 19:19:20.431024-04	{"name": "23_correct_global_unique_constraints"}	system	SYSTEM	1720912760.431039	0
	system	SYSTEM	system.migration.started	35	1	2024-07-13 19:19:20.448669-04	{"name": "24_add_actor_col_to_auth_tokens"}	system	SYSTEM	1720912760.448686	0
	system	SYSTEM	system.migration.done	36	1	2024-07-13 19:19:20.465421-04	{"name": "24_add_actor_col_to_auth_tokens"}	system	SYSTEM	1720912760.465449	0
	system	SYSTEM	system.migration.started	37	1	2024-07-13 19:19:20.482019-04	{"name": "26_auth_users3"}	system	SYSTEM	1720912760.482038	0
	system	SYSTEM	system.migration.done	38	1	2024-07-13 19:19:20.501234-04	{"name": "26_auth_users3"}	system	SYSTEM	1720912760.501253	0
	system	SYSTEM	system.migration.started	39	1	2024-07-13 19:19:20.517339-04	{"name": "config_change"}	system	SYSTEM	1720912760.517356	0
	system	SYSTEM	system.migration.repeatable.done	40	1	2024-07-13 19:19:20.529308-04	{"name": "config_change", "lastRun": {"externalPort": 8080, "externalDomain": "localhost", "externalSecure": false}}	system	SYSTEM	1720912760.529323	0
	system	SYSTEM	system.migration.started	41	1	2024-07-13 19:19:20.545569-04	{"name": "projection_tables"}	system	SYSTEM	1720912760.545589	0
	system	SYSTEM	system.migration.repeatable.done	42	1	2024-07-13 19:19:21.251665-04	{"name": "projection_tables", "lastRun": {"version": "v2.55.0"}}	system	SYSTEM	1720912761.251678	0
	system	SYSTEM	system.migration.started	43	1	2024-07-13 19:19:21.262879-04	{"name": "18_add_lower_fields_to_login_names"}	system	SYSTEM	1720912761.262897	0
	system	SYSTEM	system.migration.done	44	1	2024-07-13 19:19:21.291044-04	{"name": "18_add_lower_fields_to_login_names"}	system	SYSTEM	1720912761.291059	0
	system	SYSTEM	system.migration.started	45	1	2024-07-13 19:19:21.30839-04	{"name": "21_add_block_field_to_limits"}	system	SYSTEM	1720912761.308406	0
	system	SYSTEM	system.migration.done	46	1	2024-07-13 19:19:21.324905-04	{"name": "21_add_block_field_to_limits"}	system	SYSTEM	1720912761.324920	0
	system	SYSTEM	system.migration.started	47	1	2024-07-13 19:19:21.341317-04	{"name": "25_user13_add_lower_fields_to_verified_email"}	system	SYSTEM	1720912761.341342	0
	system	SYSTEM	system.migration.done	48	1	2024-07-13 19:19:21.365511-04	{"name": "25_user13_add_lower_fields_to_verified_email"}	system	SYSTEM	1720912761.365527	0
	system	SYSTEM	system.migration.started	49	1	2024-07-13 19:19:21.381009-04	{"name": "26_idp_templates6_add_saml_name_id_format"}	system	SYSTEM	1720912761.381141	0
	system	SYSTEM	system.migration.done	50	1	2024-07-13 19:19:21.39741-04	{"name": "26_idp_templates6_add_saml_name_id_format"}	system	SYSTEM	1720912761.397426	0
	system	SYSTEM	system.migration.started	51	1	2024-07-13 19:19:21.535705-04	{"name": "projections.orgs1"}	system	SYSTEM	1720912761.535720	0
	system	SYSTEM	system.migration.done	52	1	2024-07-13 19:19:21.687238-04	{"name": "projections.orgs1"}	system	SYSTEM	1720912761.687283	0
	system	SYSTEM	system.migration.started	53	1	2024-07-13 19:19:21.731552-04	{"name": "projections.org_metadata2"}	system	SYSTEM	1720912761.731602	0
	system	SYSTEM	system.migration.done	54	1	2024-07-13 19:19:21.910131-04	{"name": "projections.org_metadata2"}	system	SYSTEM	1720912761.910193	0
	system	SYSTEM	system.migration.started	55	1	2024-07-13 19:19:21.966941-04	{"name": "projections.actions3"}	system	SYSTEM	1720912761.967023	0
	system	SYSTEM	system.migration.done	56	1	2024-07-13 19:19:22.118571-04	{"name": "projections.actions3"}	system	SYSTEM	1720912762.118631	0
	system	SYSTEM	system.migration.started	57	1	2024-07-13 19:19:22.16166-04	{"name": "projections.flow_triggers3"}	system	SYSTEM	1720912762.161676	0
	system	SYSTEM	system.migration.done	58	1	2024-07-13 19:19:22.312813-04	{"name": "projections.flow_triggers3"}	system	SYSTEM	1720912762.312882	0
	system	SYSTEM	system.migration.started	59	1	2024-07-13 19:19:22.351467-04	{"name": "projections.projects4"}	system	SYSTEM	1720912762.351484	0
	system	SYSTEM	system.migration.done	60	1	2024-07-13 19:19:22.502691-04	{"name": "projections.projects4"}	system	SYSTEM	1720912762.502768	0
	system	SYSTEM	system.migration.started	61	1	2024-07-13 19:19:22.555253-04	{"name": "projections.password_complexity_policies2"}	system	SYSTEM	1720912762.555274	0
	system	SYSTEM	system.migration.done	62	1	2024-07-13 19:19:22.695016-04	{"name": "projections.password_complexity_policies2"}	system	SYSTEM	1720912762.695031	0
	system	SYSTEM	system.migration.started	63	1	2024-07-13 19:19:22.71903-04	{"name": "projections.password_age_policies2"}	system	SYSTEM	1720912762.719047	0
	system	SYSTEM	system.migration.done	64	1	2024-07-13 19:19:22.87022-04	{"name": "projections.password_age_policies2"}	system	SYSTEM	1720912762.870253	0
	system	SYSTEM	system.migration.started	65	1	2024-07-13 19:19:22.91798-04	{"name": "projections.lockout_policies3"}	system	SYSTEM	1720912762.918009	0
	system	SYSTEM	system.migration.done	66	1	2024-07-13 19:19:23.061929-04	{"name": "projections.lockout_policies3"}	system	SYSTEM	1720912763.061952	0
	system	SYSTEM	system.migration.started	67	1	2024-07-13 19:19:23.08808-04	{"name": "projections.privacy_policies4"}	system	SYSTEM	1720912763.088096	0
	system	SYSTEM	system.migration.done	68	1	2024-07-13 19:19:23.244393-04	{"name": "projections.privacy_policies4"}	system	SYSTEM	1720912763.244477	0
	system	SYSTEM	system.migration.started	69	1	2024-07-13 19:19:23.299969-04	{"name": "projections.domain_policies2"}	system	SYSTEM	1720912763.300005	0
	system	SYSTEM	system.migration.done	70	1	2024-07-13 19:19:23.454641-04	{"name": "projections.domain_policies2"}	system	SYSTEM	1720912763.454681	0
	system	SYSTEM	system.migration.started	71	1	2024-07-13 19:19:23.485242-04	{"name": "projections.label_policies3"}	system	SYSTEM	1720912763.485262	0
	system	SYSTEM	system.migration.done	72	1	2024-07-13 19:19:23.63866-04	{"name": "projections.label_policies3"}	system	SYSTEM	1720912763.638722	0
	system	SYSTEM	system.migration.started	73	1	2024-07-13 19:19:23.697858-04	{"name": "projections.project_grants4"}	system	SYSTEM	1720912763.697886	0
	system	SYSTEM	system.migration.done	74	1	2024-07-13 19:19:23.851259-04	{"name": "projections.project_grants4"}	system	SYSTEM	1720912763.851322	0
	system	SYSTEM	system.migration.started	75	1	2024-07-13 19:19:23.899789-04	{"name": "projections.project_roles4"}	system	SYSTEM	1720912763.899871	0
	system	SYSTEM	system.migration.done	76	1	2024-07-13 19:19:24.060052-04	{"name": "projections.project_roles4"}	system	SYSTEM	1720912764.060144	0
	system	SYSTEM	system.migration.started	77	1	2024-07-13 19:19:24.114062-04	{"name": "projections.org_domains2"}	system	SYSTEM	1720912764.114119	0
	system	SYSTEM	system.migration.started	79	1	2024-07-13 19:19:24.328758-04	{"name": "projections.login_policies5"}	system	SYSTEM	1720912764.328776	0
	system	SYSTEM	system.migration.done	80	1	2024-07-13 19:19:24.494617-04	{"name": "projections.login_policies5"}	system	SYSTEM	1720912764.494687	0
	system	SYSTEM	system.migration.started	81	1	2024-07-13 19:19:24.538234-04	{"name": "projections.idps3"}	system	SYSTEM	1720912764.538251	0
	system	SYSTEM	system.migration.done	82	1	2024-07-13 19:19:24.698348-04	{"name": "projections.idps3"}	system	SYSTEM	1720912764.698425	0
	system	SYSTEM	system.migration.started	83	1	2024-07-13 19:19:24.735757-04	{"name": "projections.idp_templates6"}	system	SYSTEM	1720912764.735772	0
	system	SYSTEM	system.migration.done	84	1	2024-07-13 19:19:24.87442-04	{"name": "projections.idp_templates6"}	system	SYSTEM	1720912764.874436	0
	system	SYSTEM	system.migration.started	85	1	2024-07-13 19:19:24.902748-04	{"name": "projections.apps7"}	system	SYSTEM	1720912764.902770	0
	system	SYSTEM	system.migration.done	86	1	2024-07-13 19:19:25.065167-04	{"name": "projections.apps7"}	system	SYSTEM	1720912765.065278	0
	system	SYSTEM	system.migration.started	87	1	2024-07-13 19:19:25.121831-04	{"name": "projections.idp_user_links3"}	system	SYSTEM	1720912765.121861	0
	system	SYSTEM	system.migration.done	88	1	2024-07-13 19:19:25.277009-04	{"name": "projections.idp_user_links3"}	system	SYSTEM	1720912765.277064	0
	system	SYSTEM	system.migration.started	89	1	2024-07-13 19:19:25.331789-04	{"name": "projections.idp_login_policy_links5"}	system	SYSTEM	1720912765.331805	0
	system	SYSTEM	system.migration.done	90	1	2024-07-13 19:19:25.48264-04	{"name": "projections.idp_login_policy_links5"}	system	SYSTEM	1720912765.482722	0
	system	SYSTEM	system.migration.started	91	1	2024-07-13 19:19:25.534534-04	{"name": "projections.mail_templates2"}	system	SYSTEM	1720912765.534566	0
	system	SYSTEM	system.migration.done	92	1	2024-07-13 19:19:25.697774-04	{"name": "projections.mail_templates2"}	system	SYSTEM	1720912765.697846	0
	system	SYSTEM	system.migration.started	93	1	2024-07-13 19:19:25.739797-04	{"name": "projections.message_texts2"}	system	SYSTEM	1720912765.739833	0
	system	SYSTEM	system.migration.done	94	1	2024-07-13 19:19:25.912295-04	{"name": "projections.message_texts2"}	system	SYSTEM	1720912765.912362	0
	system	SYSTEM	system.migration.started	95	1	2024-07-13 19:19:25.958168-04	{"name": "projections.custom_texts2"}	system	SYSTEM	1720912765.958188	0
	system	SYSTEM	system.migration.done	96	1	2024-07-13 19:19:26.136388-04	{"name": "projections.custom_texts2"}	system	SYSTEM	1720912766.136452	0
	system	SYSTEM	system.migration.started	97	1	2024-07-13 19:19:26.189113-04	{"name": "projections.users13"}	system	SYSTEM	1720912766.189158	0
	system	SYSTEM	system.migration.done	98	1	2024-07-13 19:19:26.359688-04	{"name": "projections.users13"}	system	SYSTEM	1720912766.359746	0
	system	SYSTEM	system.migration.started	99	1	2024-07-13 19:19:26.399767-04	{"name": "projections.login_names3"}	system	SYSTEM	1720912766.399785	0
	system	SYSTEM	system.migration.done	100	1	2024-07-13 19:19:26.578069-04	{"name": "projections.login_names3"}	system	SYSTEM	1720912766.578135	0
	system	SYSTEM	system.migration.started	101	1	2024-07-13 19:19:26.628219-04	{"name": "projections.org_members4"}	system	SYSTEM	1720912766.628237	0
	system	SYSTEM	system.migration.done	102	1	2024-07-13 19:19:26.782943-04	{"name": "projections.org_members4"}	system	SYSTEM	1720912766.782966	0
	system	SYSTEM	system.migration.started	103	1	2024-07-13 19:19:26.823377-04	{"name": "projections.instance_domains"}	system	SYSTEM	1720912766.823402	0
	system	SYSTEM	system.migration.done	104	1	2024-07-13 19:19:26.969223-04	{"name": "projections.instance_domains"}	system	SYSTEM	1720912766.969279	0
	system	SYSTEM	system.migration.started	105	1	2024-07-13 19:19:27.003603-04	{"name": "projections.instance_members4"}	system	SYSTEM	1720912767.003628	0
	system	SYSTEM	system.migration.done	106	1	2024-07-13 19:19:27.151542-04	{"name": "projections.instance_members4"}	system	SYSTEM	1720912767.151575	0
	system	SYSTEM	system.migration.started	107	1	2024-07-13 19:19:27.18754-04	{"name": "projections.project_members4"}	system	SYSTEM	1720912767.187581	0
	system	SYSTEM	system.migration.done	108	1	2024-07-13 19:19:27.353058-04	{"name": "projections.project_members4"}	system	SYSTEM	1720912767.353157	0
	system	SYSTEM	system.migration.started	109	1	2024-07-13 19:19:27.394378-04	{"name": "projections.project_grant_members4"}	system	SYSTEM	1720912767.394394	0
	system	SYSTEM	system.migration.done	110	1	2024-07-13 19:19:27.547809-04	{"name": "projections.project_grant_members4"}	system	SYSTEM	1720912767.547849	0
	system	SYSTEM	system.migration.started	111	1	2024-07-13 19:19:27.576376-04	{"name": "projections.authn_keys2"}	system	SYSTEM	1720912767.576391	0
	system	SYSTEM	system.migration.done	112	1	2024-07-13 19:19:27.722225-04	{"name": "projections.authn_keys2"}	system	SYSTEM	1720912767.722264	0
	system	SYSTEM	system.migration.started	113	1	2024-07-13 19:19:27.752503-04	{"name": "projections.personal_access_tokens3"}	system	SYSTEM	1720912767.752517	0
	system	SYSTEM	system.migration.done	114	1	2024-07-13 19:19:27.889957-04	{"name": "projections.personal_access_tokens3"}	system	SYSTEM	1720912767.889981	0
	system	SYSTEM	system.migration.started	115	1	2024-07-13 19:19:27.916302-04	{"name": "projections.user_grants5"}	system	SYSTEM	1720912767.916317	0
	system	SYSTEM	system.migration.done	116	1	2024-07-13 19:19:28.070954-04	{"name": "projections.user_grants5"}	system	SYSTEM	1720912768.071001	0
	system	SYSTEM	system.migration.started	117	1	2024-07-13 19:19:28.099663-04	{"name": "projections.user_metadata5"}	system	SYSTEM	1720912768.099680	0
	system	SYSTEM	system.migration.done	118	1	2024-07-13 19:19:28.250016-04	{"name": "projections.user_metadata5"}	system	SYSTEM	1720912768.250055	0
	system	SYSTEM	system.migration.started	119	1	2024-07-13 19:19:28.295394-04	{"name": "projections.user_auth_methods4"}	system	SYSTEM	1720912768.295413	0
	system	SYSTEM	system.migration.done	120	1	2024-07-13 19:19:28.453189-04	{"name": "projections.user_auth_methods4"}	system	SYSTEM	1720912768.453292	0
	system	SYSTEM	system.migration.started	121	1	2024-07-13 19:19:28.496661-04	{"name": "projections.instances"}	system	SYSTEM	1720912768.496679	0
	system	SYSTEM	system.migration.done	122	1	2024-07-13 19:19:28.655463-04	{"name": "projections.instances"}	system	SYSTEM	1720912768.655557	0
	system	SYSTEM	system.migration.started	123	1	2024-07-13 19:19:28.696622-04	{"name": "projections.secret_generators2"}	system	SYSTEM	1720912768.696637	0
	system	SYSTEM	system.migration.done	124	1	2024-07-13 19:19:28.855395-04	{"name": "projections.secret_generators2"}	system	SYSTEM	1720912768.855483	0
	system	SYSTEM	system.migration.started	125	1	2024-07-13 19:19:28.896242-04	{"name": "projections.smtp_configs2"}	system	SYSTEM	1720912768.896258	0
	system	SYSTEM	system.migration.done	126	1	2024-07-13 19:19:29.055682-04	{"name": "projections.smtp_configs2"}	system	SYSTEM	1720912769.055766	0
	system	SYSTEM	system.migration.started	127	1	2024-07-13 19:19:29.111533-04	{"name": "projections.sms_configs2"}	system	SYSTEM	1720912769.111551	0
	system	SYSTEM	system.migration.done	128	1	2024-07-13 19:19:29.26629-04	{"name": "projections.sms_configs2"}	system	SYSTEM	1720912769.266367	0
	system	SYSTEM	system.migration.started	129	1	2024-07-13 19:19:29.315802-04	{"name": "projections.oidc_settings2"}	system	SYSTEM	1720912769.315818	0
	system	SYSTEM	system.migration.done	130	1	2024-07-13 19:19:29.481832-04	{"name": "projections.oidc_settings2"}	system	SYSTEM	1720912769.481900	0
	system	SYSTEM	system.migration.started	131	1	2024-07-13 19:19:29.53265-04	{"name": "projections.notification_providers"}	system	SYSTEM	1720912769.532666	0
	system	SYSTEM	system.migration.done	132	1	2024-07-13 19:19:29.692105-04	{"name": "projections.notification_providers"}	system	SYSTEM	1720912769.692173	0
	system	SYSTEM	system.migration.started	133	1	2024-07-13 19:19:29.763572-04	{"name": "projections.keys4"}	system	SYSTEM	1720912769.763636	0
	system	SYSTEM	system.migration.done	134	1	2024-07-13 19:19:29.93853-04	{"name": "projections.keys4"}	system	SYSTEM	1720912769.938598	0
	system	SYSTEM	system.migration.started	135	1	2024-07-13 19:19:30.002942-04	{"name": "projections.security_policies2"}	system	SYSTEM	1720912770.002987	0
	system	SYSTEM	system.migration.done	136	1	2024-07-13 19:19:30.161075-04	{"name": "projections.security_policies2"}	system	SYSTEM	1720912770.161201	0
	system	SYSTEM	system.migration.started	137	1	2024-07-13 19:19:30.246908-04	{"name": "projections.notification_policies"}	system	SYSTEM	1720912770.246964	0
	system	SYSTEM	system.migration.done	138	1	2024-07-13 19:19:30.437409-04	{"name": "projections.notification_policies"}	system	SYSTEM	1720912770.437478	0
	system	SYSTEM	system.migration.started	139	1	2024-07-13 19:19:30.508715-04	{"name": "projections.device_auth_requests2"}	system	SYSTEM	1720912770.508784	0
	system	SYSTEM	system.migration.done	140	1	2024-07-13 19:19:30.676624-04	{"name": "projections.device_auth_requests2"}	system	SYSTEM	1720912770.676690	0
	system	SYSTEM	system.migration.started	141	1	2024-07-13 19:19:30.718568-04	{"name": "projections.sessions8"}	system	SYSTEM	1720912770.718583	0
	system	SYSTEM	system.migration.done	142	1	2024-07-13 19:19:30.862629-04	{"name": "projections.sessions8"}	system	SYSTEM	1720912770.862649	0
	system	SYSTEM	system.migration.started	143	1	2024-07-13 19:19:30.886653-04	{"name": "projections.auth_requests"}	system	SYSTEM	1720912770.886669	0
	system	SYSTEM	system.migration.done	144	1	2024-07-13 19:19:31.026782-04	{"name": "projections.auth_requests"}	system	SYSTEM	1720912771.026803	0
	system	SYSTEM	system.migration.started	145	1	2024-07-13 19:19:31.056447-04	{"name": "projections.milestones"}	system	SYSTEM	1720912771.056462	0
	system	SYSTEM	system.migration.done	146	1	2024-07-13 19:19:31.203656-04	{"name": "projections.milestones"}	system	SYSTEM	1720912771.203684	0
	system	SYSTEM	system.migration.started	147	1	2024-07-13 19:19:31.260523-04	{"name": "projections.quotas"}	system	SYSTEM	1720912771.260559	0
	system	SYSTEM	system.migration.done	148	1	2024-07-13 19:19:31.417523-04	{"name": "projections.quotas"}	system	SYSTEM	1720912771.417584	0
	system	SYSTEM	system.migration.started	149	1	2024-07-13 19:19:31.491173-04	{"name": "projections.limits"}	system	SYSTEM	1720912771.491235	0
	system	SYSTEM	system.migration.done	150	1	2024-07-13 19:19:31.655134-04	{"name": "projections.limits"}	system	SYSTEM	1720912771.655193	0
	system	SYSTEM	system.migration.started	151	1	2024-07-13 19:19:31.710877-04	{"name": "projections.restrictions2"}	system	SYSTEM	1720912771.710893	0
	system	SYSTEM	system.migration.done	152	1	2024-07-13 19:19:31.86697-04	{"name": "projections.restrictions2"}	system	SYSTEM	1720912771.867038	0
	system	SYSTEM	system.migration.started	153	1	2024-07-13 19:19:31.930117-04	{"name": "projections.system_features"}	system	SYSTEM	1720912771.930178	0
	system	SYSTEM	system.migration.done	154	1	2024-07-13 19:19:32.088899-04	{"name": "projections.system_features"}	system	SYSTEM	1720912772.088995	0
	system	SYSTEM	system.migration.started	155	1	2024-07-13 19:19:32.161831-04	{"name": "projections.instance_features2"}	system	SYSTEM	1720912772.161875	0
	system	SYSTEM	system.migration.done	156	1	2024-07-13 19:19:32.324015-04	{"name": "projections.instance_features2"}	system	SYSTEM	1720912772.324102	0
	system	SYSTEM	system.migration.started	157	1	2024-07-13 19:19:32.38691-04	{"name": "projections.targets1"}	system	SYSTEM	1720912772.386927	0
	system	SYSTEM	system.migration.done	158	1	2024-07-13 19:19:32.541219-04	{"name": "projections.targets1"}	system	SYSTEM	1720912772.541339	0
	system	SYSTEM	system.migration.started	159	1	2024-07-13 19:19:32.605368-04	{"name": "projections.executions1"}	system	SYSTEM	1720912772.605385	0
	system	SYSTEM	system.migration.done	160	1	2024-07-13 19:19:32.759507-04	{"name": "projections.executions1"}	system	SYSTEM	1720912772.759568	0
	system	SYSTEM	system.migration.started	161	1	2024-07-13 19:19:32.829689-04	{"name": "projections.user_schemas"}	system	SYSTEM	1720912772.829722	0
	system	SYSTEM	system.migration.done	162	1	2024-07-13 19:19:32.999302-04	{"name": "projections.user_schemas"}	system	SYSTEM	1720912772.999359	0
	system	SYSTEM	system.migration.started	163	1	2024-07-13 19:19:33.055201-04	{"name": "adminapi.styling2"}	system	SYSTEM	1720912773.055216	0
	system	SYSTEM	system.migration.done	164	1	2024-07-13 19:19:33.145958-04	{"name": "adminapi.styling2"}	system	SYSTEM	1720912773.145972	0
	system	SYSTEM	system.migration.started	165	1	2024-07-13 19:19:33.168366-04	{"name": "auth.users3"}	system	SYSTEM	1720912773.168380	0
	system	SYSTEM	system.migration.done	166	1	2024-07-13 19:19:33.199609-04	{"name": "auth.users3"}	system	SYSTEM	1720912773.199624	0
	system	SYSTEM	system.migration.started	167	1	2024-07-13 19:19:33.216861-04	{"name": "auth.user_sessions"}	system	SYSTEM	1720912773.216875	0
	system	SYSTEM	system.migration.done	168	1	2024-07-13 19:19:33.263348-04	{"name": "auth.user_sessions"}	system	SYSTEM	1720912773.263365	0
	system	SYSTEM	system.migration.started	169	1	2024-07-13 19:19:33.278777-04	{"name": "auth.tokens"}	system	SYSTEM	1720912773.278790	0
	system	SYSTEM	system.migration.done	170	1	2024-07-13 19:19:33.314883-04	{"name": "auth.tokens"}	system	SYSTEM	1720912773.314896	0
	system	SYSTEM	system.migration.started	171	1	2024-07-13 19:19:33.332462-04	{"name": "auth.refresh_tokens"}	system	SYSTEM	1720912773.332476	0
	system	SYSTEM	system.migration.done	172	1	2024-07-13 19:19:33.36551-04	{"name": "auth.refresh_tokens"}	system	SYSTEM	1720912773.365525	0
	system	SYSTEM	system.migration.started	173	1	2024-07-13 19:19:33.386351-04	{"name": "projections.notifications"}	system	SYSTEM	1720912773.386369	0
	system	SYSTEM	system.migration.done	174	1	2024-07-13 19:19:34.419488-04	{"name": "projections.notifications"}	system	SYSTEM	1720912774.419511	0
	system	SYSTEM	system.migration.started	175	1	2024-07-13 19:19:34.726247-04	{"name": "projections.notifications_quota"}	system	SYSTEM	1720912774.726265	0
	system	SYSTEM	system.migration.done	176	1	2024-07-13 19:19:35.76836-04	{"name": "projections.notifications_quota"}	system	SYSTEM	1720912775.768382	0
275845547489756116	user	275845547490345940	user.human.password.check.failed	3	2	2024-07-13 19:20:18.737475-04	{"id": "275845639110132692", "remoteIP": "127.0.0.1", "userAgent": "Mozilla/5.0 (X11; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0", "userAgentID": "275845588107396052", "acceptLanguage": "es-CL,es;q=0.8,en-US;q=0.5,en;q=0.3"}	LOGIN	275845547489821652	1720912818.737487	0
275845547489756116	user	275845547490345940	user.human.password.check.succeeded	4	2	2024-07-13 19:20:26.305881-04	{"id": "275845639110132692", "remoteIP": "127.0.0.1", "userAgent": "Mozilla/5.0 (X11; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0", "userAgentID": "275845588107396052", "acceptLanguage": "es-CL,es;q=0.8,en-US;q=0.5,en;q=0.3"}	LOGIN	275845547489821652	1720912826.305894	0
275845547489756116	user	275845547490345940	user.human.mfa.init.skipped	5	2	2024-07-13 19:20:28.151086-04	{}	LOGIN	275845547489821652	1720912828.151102	0
275845547489756116	user	275845547490345940	user.human.password.changed	6	2	2024-07-13 19:20:46.293416-04	{"encodedHash": "$2a$14$37Pzx5ikAIbyB87ahWON7OwzD2FH4GNkFRo0eK.5pFe4aXadPBy2O", "userAgentID": "275845588107396052", "triggerOrigin": "http://localhost:8080", "changeRequired": false}	LOGIN	275845547489821652	1720912846.293430	0
275845547489756116	oidc_session	V2_275845699256452052	oidc_session.added	1	1	2024-07-13 19:20:49.184203-04	{"nonce": "ZWZJaHBvUjRkQVJsYXNSeHdVYnhVQnpxdGs0aDVNXzA5WGNfZWcyRnRRYVdj", "scope": ["openid", "profile", "email"], "userID": "275845547490345940", "audience": ["275845549117146068@zitadel", "275845549133923284@zitadel", "275845549133988820@zitadel", "275845549150700500@zitadel", "275845547489887188"], "authTime": "2024-07-13T19:20:46.293416-04:00", "clientID": "275845549150700500@zitadel", "sessionID": "", "userAgent": {"description": "", "fingerprint_id": ""}, "authMethods": [4], "preferredLanguage": "en", "userResourceOwner": "275845547489821652"}		275845547489821652	1720912849.184218	0
275845547489756116	oidc_session	V2_275845699256452052	oidc_session.access_token.added	2	1	2024-07-13 19:20:49.184203-04	{"id": "at_275845699256517588", "scope": ["openid", "profile", "email"], "reason": "auth_request", "lifetime": 43200000000000}		275845547489821652	1720912849.184296	1
275845547489756116	user	275845547490345940	user.token.v2.added	7	2	2024-07-13 19:20:49.184203-04	{"tokenId": "at_275845699256517588"}		275845547489821652	1720912849.184312	2
275845547489756116	key_pair	275845699558441940	key_pair.added	1	1	2024-07-13 19:20:49.360333-04	{"usage": 0, "algorithm": "RS256", "publicKey": {"key": {"KeyID": "oidcKey", "Crypted": "jorNDd8GJxKHjnozW7Jw3N8cHxXpdiNym2PpZM4h2AkEAdMLOIZ/hf4K8qH524/Sqtu9bRjtPfO0BiUPSOn5oCF0tQj0t6o4MxAFVTDDOrLCYvasdNQxAoTioK8b9ZRhiEWUvQumGszaIkjSbddcsDqtKaWrDYgj2bwTb+JRgN3xq9JgWZ1lB3uaslg+zKOnUbCexZNGnjxbOlLY1HBHK3205xvOo9YCgtDhyHOgzlEektHVBEAXrIOYb2Hlx/Ua3yLVHBU+A6HQGySE/tb/lf45iJfrFTFRhEkVduvmrULULzcYyUoELjSlIccZuAKoOg7rlX3FX+CxO1Rdul6XO8QlD86NZ7TWsbcl3srr5qymOGq87FoLU9810xcMWJ0LrY7ksFA+yoAoxzKb2qmjaK3eNKpjte5T35Mi2HPN+tFwIigyVimApSc6Oit8qeBxCOu1c8kAelP9MA/AzT8eTJyCau3GCBo/WAT74BX6ABwW77qGxXbTbr87f6okzede2HLt/6PlrgM+7QMbrcldxFDgtwsre3CWDnp9cZ7I2H77+8X7RVsSoPD40RvaqVw+c1Lzyu34zQq7USPFiAqmqWT3Fm4dlpV60tRKNK47MIbwG0XWJMU6giE2qA==", "Algorithm": "aes", "CryptoType": 0}, "expiry": "2024-07-15T05:20:49.354023335Z"}, "privateKey": {"key": {"KeyID": "oidcKey", "Crypted": "PwqyYTnZH7t2HdjEDYiwns1GsS68Rqym6Zw2frofCoQqeMZEhkP8XpmFFF6d7YdV4TQCPGPMMGnVO7qlFwJsbfCRsF0GhkOgIx0jN1mflIOprt7zgZABZwaSf2WnmT0LWfXilV1zCW77+b35TmDZ4NA11SooTV7iGntAX0ZPhooh5C21VuCfYvLObnUtOFzC5XZ16DyOkNakSqUmpdxgWLptbEWegN8ouTbW7eGAmYtWgxnDmImhNY7FtTirTciUEweco12agxadVP5GvHWw2I1FVgX6exTjKmWDFrCI14bVClCL2v6R8TR3z4i/lci5HG6FZe91vMW9J2zjGwzTI2YZM/XxXOSYbfnnRQ0NkuzTMEX9PEpa43fJR0jy0of6gYVWHlISMane7stDgjEgH9IYksT9MuQv7a60m6mb6GyJKKi7rW0piz04RH8NtYBgUYH5kv3+BdMdwFTg6MN9zv4WT/UHlDnNi38qt9yRb8v8s5vfapMhyQmXDNGh/uf++Ra0wpXDv0oawDP7okOXKTu2OKh4oqy/fr7N2jL12OsZLiUSTpJeAttIiG51oqX6f0aKgnd0Ku6vRJwODWtmzSgl7rfs4PBDuX1rRanxN8DFKSsILXjMMhNexx6lGI5pznc/jKTcnPrAbzNhhr0lm89ouHFLXSfTlZ59QAwYUduGGE60oCzDX0S5hnm+0/qqRt52b6QfsGRF36DqbSQ9Aas8EdYinj3ISuxDlxHRDqhHqZiBSAoMpMLu4/E2D8lteD6ssm2bPboSMqwnvnvFAGyGLwqgDybwwG2U4Zgfy4LKR4nE5p0C6N8soY/kOmPbZs22AmOWOvBm67h9eX58ahLNxrRflv6iTHRJKgCCQLfAAAg40/b7OgnaKh81rb76iekg9Y5q4ZqoIrL2xUcOLQh5mLYO1jqahV5bSbWiXkT+GYnuzftnKeUFhPxZOH928AnoJoRMjNd853udXU0LBXJ1BDjvE8FaG+3Hrjn5mxIF9sThedqnIpZy3quJ8Wt02FjUTjxz8ugAqR10AWXjfhfeF3L7HFETvD6wejZ2ZCY2k7y8xMAkgWWnDGgfAmxmfcdbD9YsDyXobo1CvJrDT0KhFbwgnX+4JfK+bA81XxF37t6a5I+tzjR8ecPW+ANZ37f4MzIkQAWkp5EL+bGdqkPydimoSqxDL4Y4ZAdzprhSlaQDMOU8LWbHxcPGfMQOWOTgwsXq7e9OoUZpOtMb3PRLdQehvZkIEp1d2cFbWr3zk2N79lB1zaHUh+ZdksU4yo70NFVQX2ts/K2d0hld9qwzKpLIO/zzgphIIcHsAzQxl3kqi9w1vNjJrZL2xhfVhuIF88ZjQQ61msude9d13HsBSaC7et5pRerCi075mec6g/dWhDg61E/stdm/zmvExTiYfDVrTW4Qbbffug4mJdwC691INr5C2jjm0p6QR/P3+YCxBxMOl8RCwpSu9JbklHTm+gZjpd+oAaJvy2uJUVqrMmmlCzoRhJVJkzJly9sJCHYyg2JAY/RwT3XessXkuOvH//Dpj8HpU4IOiZa+UxUyZPv+5XevBGIhGIKxeoMm7LsfcS/dXoiQPUIWC1GmvhQZXJtxsJovlEen/rtGFUfkcXnnqNcFnCHnPE0gLwg/HPUISOYXFJtn4YovDVg186AtCdEZpBhtbWwZAC0EKhEGESKgqR+qdu1wKdzG2eljJGSnYK6lBJauDbFXH4z3a+CNeJX8usQvjlr8FcA5LWknGeezH8hw6SjATMTE5VKtEfLVKQwHuzUtVBRYDs5TNIWU7DqmnbGwAVwTTASlp5PWNXLa259GeuFz03WOkIO+rJh2MNgAldTcxUN5Si2Japew2XZ8vp8t3FyY8sXu3hdaeY/8iGp5ktycPIQt1sUwjwClCz2qVWte6TTA3ZUr92ijCntGdJW/opb5SghBd9C0QcsXdAP4d8hnCnQ2icF3WVU0VxxzJemcc6sm1nsv5C+eER6GensYmzOzL28Iv7Mu2TEjf2fCdwl74gXjyidSvac4/ewZKGdYg0IuGBvDThPrrDW0yuG0qandMbMbcIQgWMbB2FyYAkke+0V9JKeTYLeJgc6uAEmGBNMghGPt5GRWn4sxIOwxb+x6gPHGlGomofc/FbgLgXLFryup2PqpGm5fhMJ+AMTElc5bfIpGCt1op7u/DYS/QElNuKns0FAtqAFYXzVhpeMPagZ15uf2AIb4xgysMOylGJEDzChKtl7IfNgZrGUVXrE=", "Algorithm": "aes", "CryptoType": 0}, "expiry": "2024-07-14T05:20:49.354023089Z"}}	OIDC	275845547489756116	1720912849.360347	0
275845547489756116	org	275845761030161364	org.added	1	1	2024-07-13 19:21:26.039644-04	{"name": "dinobank"}	275845547490345940	275845761030161364	1720912886.039662	0
275845547489756116	org	275845761030161364	org.domain.added	2	1	2024-07-13 19:21:26.039644-04	{"domain": "dinobank.localhost"}	275845547490345940	275845761030161364	1720912886.039765	1
275845547489756116	org	275845761030161364	org.domain.verified	3	1	2024-07-13 19:21:26.039644-04	{"domain": "dinobank.localhost"}	275845547490345940	275845761030161364	1720912886.039783	2
275845547489756116	org	275845761030161364	org.domain.primary.set	4	1	2024-07-13 19:21:26.039644-04	{"domain": "dinobank.localhost"}	275845547490345940	275845761030161364	1720912886.039796	3
275845547489756116	org	275845761030161364	org.member.added	5	1	2024-07-13 19:21:26.039644-04	{"roles": ["ORG_OWNER"], "userId": "275845547490345940"}	275845547490345940	275845761030161364	1720912886.039810	4
275845547489756116	project	275845834531144660	project.added	1	1	2024-07-13 19:22:09.813563-04	{"name": "zstarter"}	275845547490345940	275845761030161364	1720912929.813592	0
275845547489756116	project	275845834531144660	project.member.added	2	1	2024-07-13 19:22:09.813563-04	{"roles": ["PROJECT_OWNER"], "userId": "275845547490345940"}	275845547490345940	275845761030161364	1720912929.813727	1
275845547489756116	project	275845834531144660	project.application.added	3	1	2024-07-13 19:22:51.658348-04	{"name": "zstarter web", "appId": "275845904743793620"}	275845547490345940	275845761030161364	1720912971.658366	0
275845547489756116	project	275845834531144660	project.application.config.oidc.added	4	1	2024-07-13 19:22:51.658348-04	{"appId": "275845904743793620", "clientId": "275845904743859156@zstarter", "grantTypes": [0], "redirectUris": ["http://dinobank.localhost:4200"], "responseTypes": [0], "authMethodType": 2, "postLogoutRedirectUris": ["http://dinobank.localhost:4200"]}	275845547490345940	275845761030161364	1720912971.658456	1
275845547489756116	project	275845834531144660	project.application.added	5	1	2024-07-13 19:23:35.638225-04	{"name": "zstarter api", "appId": "275845978462880724"}	275845547490345940	275845761030161364	1720913015.638416	0
275845547489756116	project	275845834531144660	project.application.config.api.added	6	1	2024-07-13 19:23:35.638225-04	{"appId": "275845978462880724", "clientId": "275845978462946260@zstarter", "hashedSecret": "$2a$04$HJfeJBIGhjyX1Y12mVSgwOzWRowLO1iU108b8qjY4ptJkMBdg6J6O"}	275845547490345940	275845761030161364	1720913015.638714	1
275845547489756116	project	275846135296295892	project.added	1	1	2024-07-13 19:25:09.078396-04	{"name": "zstarter"}	275845547490345940	275845547489821652	1720913109.078412	0
275845547489756116	project	275846135296295892	project.member.added	2	1	2024-07-13 19:25:09.078396-04	{"roles": ["PROJECT_OWNER"], "userId": "275845547490345940"}	275845547490345940	275845547489821652	1720913109.084104	1
275845547489756116	project	275846135296295892	project.application.added	3	1	2024-07-13 19:25:31.809028-04	{"name": "zstarter web", "appId": "275846173430907860"}	275845547490345940	275845547489821652	1720913131.809044	0
275845547489756116	project	275846135296295892	project.application.config.oidc.added	4	1	2024-07-13 19:25:31.809028-04	{"appId": "275846173430907860", "clientId": "275846173430973396@zstarter", "grantTypes": [0], "redirectUris": ["http://localhost:4200"], "responseTypes": [0], "authMethodType": 2, "postLogoutRedirectUris": ["http://localhost:4200"]}	275845547490345940	275845547489821652	1720913131.809127	1
275845547489756116	project	275846135296295892	project.application.added	5	1	2024-07-13 19:25:59.332903-04	{"name": "zstarter api", "appId": "275846219585029076"}	275845547490345940	275845547489821652	1720913159.332924	0
275845547489756116	project	275846135296295892	project.application.config.api.added	6	1	2024-07-13 19:25:59.332903-04	{"appId": "275846219585029076", "clientId": "275846219585094612@zstarter", "hashedSecret": "$2a$04$SoRBWdwIOgXWxnwQ0wuhnO/XZbzSlZZOemj55MRc2xDbN.gKaVxaa"}	275845547490345940	275845547489821652	1720913159.333067	1
275845547489756116	org	275846310987301844	org.added	1	1	2024-07-13 19:26:53.821454-04	{"name": "dogsinc"}	275845547490345940	275846310987301844	1720913213.821471	0
275845547489756116	org	275846310987301844	org.domain.added	2	1	2024-07-13 19:26:53.821454-04	{"domain": "dogsinc.localhost"}	275845547490345940	275846310987301844	1720913213.821651	1
275845547489756116	org	275846310987301844	org.domain.verified	3	1	2024-07-13 19:26:53.821454-04	{"domain": "dogsinc.localhost"}	275845547490345940	275846310987301844	1720913213.821670	2
275845547489756116	org	275846310987301844	org.domain.primary.set	4	1	2024-07-13 19:26:53.821454-04	{"domain": "dogsinc.localhost"}	275845547490345940	275846310987301844	1720913213.821684	3
275845547489756116	org	275846310987301844	org.member.added	5	1	2024-07-13 19:26:53.821454-04	{"roles": ["ORG_OWNER"], "userId": "275845547490345940"}	275845547490345940	275846310987301844	1720913213.821699	4
275845547489756116	project	275846327613522900	project.added	1	1	2024-07-13 19:27:03.715993-04	{"name": "zstarter"}	275845547490345940	275846310987301844	1720913223.716010	0
275845547489756116	project	275846327613522900	project.member.added	2	1	2024-07-13 19:27:03.715993-04	{"roles": ["PROJECT_OWNER"], "userId": "275845547490345940"}	275845547490345940	275846310987301844	1720913223.716114	1
275845547489756116	project	275846327613522900	project.application.added	3	1	2024-07-13 19:27:33.335053-04	{"name": "zstarter web", "appId": "275846377307636692"}	275845547490345940	275846310987301844	1720913253.335070	0
275845547489756116	project	275846327613522900	project.application.config.oidc.added	4	1	2024-07-13 19:27:33.335053-04	{"appId": "275846377307636692", "clientId": "275846377307702228@zstarter", "grantTypes": [0], "redirectUris": ["http://dogsinc.localhost:4200"], "responseTypes": [0], "authMethodType": 2, "postLogoutRedirectUris": ["http://dogsinc.localhost:4200"]}	275845547490345940	275846310987301844	1720913253.335153	1
275845547489756116	project	275846327613522900	project.application.added	5	1	2024-07-13 19:28:06.203132-04	{"name": "zstarter api", "appId": "275846432437568468"}	275845547490345940	275846310987301844	1720913286.203153	0
275845547489756116	project	275846327613522900	project.application.config.api.added	6	1	2024-07-13 19:28:06.203132-04	{"appId": "275846432437568468", "clientId": "275846432437634004@zstarter", "hashedSecret": "$2a$04$JoPXv/PykO1vvwv.AeOwkuei8eO9JVLvVruIqum0NCOqHLqztKRxW"}	275845547490345940	275846310987301844	1720913286.203242	1
\.


--
-- Data for Name: unique_constraints; Type: TABLE DATA; Schema: eventstore; Owner: postgres
--

COPY eventstore.unique_constraints (instance_id, unique_type, unique_field) FROM stdin;
	migration_started	14_events_push
	migration_done	14_events_push
	migration_started	01_tables
	migration_done	01_tables
	migration_started	02_assets
	migration_done	02_assets
	migration_started	03_default_instance
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	
275845547489756116	secret_generator	\b
275845547489756116	secret_generator	\t
275845547489756116	org_name	zitadel
275845547489756116	org_domain	zitadel.localhost
275845547489756116	usernames	zitadel-admin@zitadel.localhost
275845547489756116	member	275845547489821652:275845547490345940
275845547489756116	member	275845547489756116:275845547490345940
275845547489756116	project_names	zitadel275845547489821652
275845547489756116	member	275845547489887188:275845547490345940
275845547489756116	appname	management-api:275845547489887188
275845547489756116	appname	admin-api:275845547489887188
275845547489756116	appname	auth-api:275845547489887188
275845547489756116	appname	console:275845547489887188
	migration_done	03_default_instance
	migration_started	05_last_failed
	migration_done	05_last_failed
	migration_started	06_resource_owner_columns
	migration_done	06_resource_owner_columns
	migration_started	07_logstore
	migration_done	07_logstore
	migration_started	08_auth_token_indexes
	migration_done	08_auth_token_indexes
	migration_started	12_auth_users_otp_columns
	migration_done	12_auth_users_otp_columns
	migration_started	13_fix_quota_constraints
	migration_done	13_fix_quota_constraints
	migration_started	15_current_projection_state
	migration_done	15_current_projection_state
	migration_started	16_unique_constraint_lower
	migration_done	16_unique_constraint_lower
	migration_started	17_add_offset_col_to_current_states
	migration_done	17_add_offset_col_to_current_states
	migration_started	19_add_current_sequences_index
	migration_done	19_add_current_sequences_index
	migration_started	20_add_by_user_index_on_session
	migration_done	20_add_by_user_index_on_session
	migration_started	22_active_instance_events_index
	migration_done	22_active_instance_events_index
	migration_started	23_correct_global_unique_constraints
	instance_domain	zitadel-180ieg.localhost
	instance_domain	localhost
	migration_done	23_correct_global_unique_constraints
	migration_started	24_add_actor_col_to_auth_tokens
	migration_done	24_add_actor_col_to_auth_tokens
	migration_started	26_auth_users3
	migration_done	26_auth_users3
	migration_started	18_add_lower_fields_to_login_names
	migration_done	18_add_lower_fields_to_login_names
	migration_started	21_add_block_field_to_limits
	migration_done	21_add_block_field_to_limits
	migration_started	25_user13_add_lower_fields_to_verified_email
	migration_done	25_user13_add_lower_fields_to_verified_email
	migration_started	26_idp_templates6_add_saml_name_id_format
	migration_done	26_idp_templates6_add_saml_name_id_format
	migration_started	projections.orgs1
	migration_done	projections.orgs1
	migration_started	projections.org_metadata2
	migration_done	projections.org_metadata2
	migration_started	projections.actions3
	migration_done	projections.actions3
	migration_started	projections.flow_triggers3
	migration_done	projections.flow_triggers3
	migration_started	projections.projects4
	migration_done	projections.projects4
	migration_started	projections.password_complexity_policies2
	migration_done	projections.password_complexity_policies2
	migration_started	projections.password_age_policies2
	migration_done	projections.password_age_policies2
	migration_started	projections.lockout_policies3
	migration_done	projections.lockout_policies3
	migration_started	projections.privacy_policies4
	migration_done	projections.privacy_policies4
	migration_started	projections.domain_policies2
	migration_done	projections.domain_policies2
	migration_started	projections.label_policies3
	migration_done	projections.label_policies3
	migration_started	projections.project_grants4
	migration_done	projections.project_grants4
	migration_started	projections.project_roles4
	migration_done	projections.project_roles4
	migration_started	projections.org_domains2
	migration_done	projections.org_domains2
	migration_started	projections.login_policies5
	migration_done	projections.login_policies5
	migration_started	projections.idps3
	migration_done	projections.idps3
	migration_started	projections.idp_templates6
	migration_done	projections.idp_templates6
	migration_started	projections.apps7
	migration_done	projections.apps7
	migration_started	projections.idp_user_links3
	migration_done	projections.idp_user_links3
	migration_started	projections.idp_login_policy_links5
	migration_done	projections.idp_login_policy_links5
	migration_started	projections.mail_templates2
	migration_done	projections.mail_templates2
	migration_started	projections.message_texts2
	migration_done	projections.message_texts2
	migration_started	projections.custom_texts2
	migration_done	projections.custom_texts2
	migration_started	projections.users13
	migration_done	projections.users13
	migration_started	projections.login_names3
	migration_done	projections.login_names3
	migration_started	projections.org_members4
	migration_done	projections.org_members4
	migration_started	projections.instance_domains
	migration_done	projections.instance_domains
	migration_started	projections.instance_members4
	migration_done	projections.instance_members4
	migration_started	projections.project_members4
	migration_done	projections.project_members4
	migration_started	projections.project_grant_members4
	migration_done	projections.project_grant_members4
	migration_started	projections.authn_keys2
	migration_done	projections.authn_keys2
	migration_started	projections.personal_access_tokens3
	migration_done	projections.personal_access_tokens3
	migration_started	projections.user_grants5
	migration_done	projections.user_grants5
	migration_started	projections.user_metadata5
	migration_done	projections.user_metadata5
	migration_started	projections.user_auth_methods4
	migration_done	projections.user_auth_methods4
	migration_started	projections.instances
	migration_done	projections.instances
	migration_started	projections.secret_generators2
	migration_done	projections.secret_generators2
	migration_started	projections.smtp_configs2
	migration_done	projections.smtp_configs2
	migration_started	projections.sms_configs2
	migration_done	projections.sms_configs2
	migration_started	projections.oidc_settings2
	migration_done	projections.oidc_settings2
	migration_started	projections.notification_providers
	migration_done	projections.notification_providers
	migration_started	projections.keys4
	migration_done	projections.keys4
	migration_started	projections.security_policies2
	migration_done	projections.security_policies2
	migration_started	projections.notification_policies
	migration_done	projections.notification_policies
	migration_started	projections.device_auth_requests2
	migration_done	projections.device_auth_requests2
	migration_started	projections.sessions8
	migration_done	projections.sessions8
	migration_started	projections.auth_requests
	migration_done	projections.auth_requests
	migration_started	projections.milestones
	migration_done	projections.milestones
	migration_started	projections.quotas
	migration_done	projections.quotas
	migration_started	projections.limits
	migration_done	projections.limits
	migration_started	projections.restrictions2
	migration_done	projections.restrictions2
	migration_started	projections.system_features
	migration_done	projections.system_features
	migration_started	projections.instance_features2
	migration_done	projections.instance_features2
	migration_started	projections.targets1
	migration_done	projections.targets1
	migration_started	projections.executions1
	migration_done	projections.executions1
	migration_started	projections.user_schemas
	migration_done	projections.user_schemas
	migration_started	adminapi.styling2
	migration_done	adminapi.styling2
	migration_started	auth.users3
	migration_done	auth.users3
	migration_started	auth.user_sessions
	migration_done	auth.user_sessions
	migration_started	auth.tokens
	migration_done	auth.tokens
	migration_started	auth.refresh_tokens
	migration_done	auth.refresh_tokens
	migration_started	projections.notifications
	migration_done	projections.notifications
	migration_started	projections.notifications_quota
	migration_done	projections.notifications_quota
275845547489756116	org_name	dinobank
275845547489756116	org_domain	dinobank.localhost
275845547489756116	member	275845761030161364:275845547490345940
275845547489756116	project_names	zstarter275845761030161364
275845547489756116	member	275845834531144660:275845547490345940
275845547489756116	appname	zstarter web:275845834531144660
275845547489756116	appname	zstarter api:275845834531144660
275845547489756116	project_names	zstarter275845547489821652
275845547489756116	member	275846135296295892:275845547490345940
275845547489756116	appname	zstarter web:275846135296295892
275845547489756116	appname	zstarter api:275846135296295892
275845547489756116	org_name	dogsinc
275845547489756116	org_domain	dogsinc.localhost
275845547489756116	member	275846310987301844:275845547490345940
275845547489756116	project_names	zstarter275846310987301844
275845547489756116	member	275846327613522900:275845547490345940
275845547489756116	appname	zstarter web:275846327613522900
275845547489756116	appname	zstarter api:275846327613522900
\.


--
-- Data for Name: access; Type: TABLE DATA; Schema: logstore; Owner: postgres
--

COPY logstore.access (log_date, protocol, request_url, response_status, request_headers, response_headers, instance_id, project_id, requested_domain, requested_host) FROM stdin;
\.


--
-- Data for Name: execution; Type: TABLE DATA; Schema: logstore; Owner: postgres
--

COPY logstore.execution (log_date, took, message, loglevel, instance_id, action_id, metadata) FROM stdin;
\.


--
-- Data for Name: actions3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.actions3 (id, creation_date, change_date, resource_owner, instance_id, action_state, sequence, name, script, timeout, allowed_to_fail, owner_removed) FROM stdin;
\.


--
-- Data for Name: apps7; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.apps7 (id, name, project_id, creation_date, change_date, resource_owner, instance_id, state, sequence) FROM stdin;
275845547489952724	Management-API	275845547489887188	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489756116	1	4
275845547490018260	Admin-API	275845547489887188	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489756116	1	6
275845547490083796	Auth-API	275845547489887188	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489756116	1	8
275845547490149332	Console	275845547489887188	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489756116	1	12
275845904743793620	zstarter web	275845834531144660	2024-07-13 19:22:51.658348-04	2024-07-13 19:22:51.658348-04	275845761030161364	275845547489756116	1	4
275845978462880724	zstarter api	275845834531144660	2024-07-13 19:23:35.638225-04	2024-07-13 19:23:35.638225-04	275845761030161364	275845547489756116	1	6
275846173430907860	zstarter web	275846135296295892	2024-07-13 19:25:31.809028-04	2024-07-13 19:25:31.809028-04	275845547489821652	275845547489756116	1	4
275846219585029076	zstarter api	275846135296295892	2024-07-13 19:25:59.332903-04	2024-07-13 19:25:59.332903-04	275845547489821652	275845547489756116	1	6
275846377307636692	zstarter web	275846327613522900	2024-07-13 19:27:33.335053-04	2024-07-13 19:27:33.335053-04	275846310987301844	275845547489756116	1	4
275846432437568468	zstarter api	275846327613522900	2024-07-13 19:28:06.203132-04	2024-07-13 19:28:06.203132-04	275846310987301844	275845547489756116	1	6
\.


--
-- Data for Name: apps7_api_configs; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.apps7_api_configs (app_id, instance_id, client_id, client_secret, auth_method) FROM stdin;
275845547489952724	275845547489756116	275845549117146068@zitadel		1
275845547490018260	275845547489756116	275845549133923284@zitadel		1
275845547490083796	275845547489756116	275845549133988820@zitadel		1
275845978462880724	275845547489756116	275845978462946260@zstarter	$2a$04$HJfeJBIGhjyX1Y12mVSgwOzWRowLO1iU108b8qjY4ptJkMBdg6J6O	0
275846219585029076	275845547489756116	275846219585094612@zstarter	$2a$04$SoRBWdwIOgXWxnwQ0wuhnO/XZbzSlZZOemj55MRc2xDbN.gKaVxaa	0
275846432437568468	275845547489756116	275846432437634004@zstarter	$2a$04$JoPXv/PykO1vvwv.AeOwkuei8eO9JVLvVruIqum0NCOqHLqztKRxW	0
\.


--
-- Data for Name: apps7_oidc_configs; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.apps7_oidc_configs (app_id, instance_id, version, client_id, client_secret, redirect_uris, response_types, grant_types, application_type, auth_method_type, post_logout_redirect_uris, is_dev_mode, access_token_type, access_token_role_assertion, id_token_role_assertion, id_token_userinfo_assertion, clock_skew, additional_origins, skip_native_app_success_page) FROM stdin;
275845547490149332	275845547489756116	0	275845549150700500@zitadel		{http://zitadel-180ieg.localhost:8080/ui/console/auth/callback,http://localhost:8080/ui/console/auth/callback}	{0}	{0}	1	2	{http://zitadel-180ieg.localhost:8080/ui/console/signedout,http://localhost:8080/ui/console/signedout}	t	0	f	f	f	0	\N	f
275845904743793620	275845547489756116	0	275845904743859156@zstarter		{http://dinobank.localhost:4200}	{0}	{0}	0	2	{http://dinobank.localhost:4200}	f	0	f	f	f	0	\N	f
275846173430907860	275845547489756116	0	275846173430973396@zstarter		{http://localhost:4200}	{0}	{0}	0	2	{http://localhost:4200}	f	0	f	f	f	0	\N	f
275846377307636692	275845547489756116	0	275846377307702228@zstarter		{http://dogsinc.localhost:4200}	{0}	{0}	0	2	{http://dogsinc.localhost:4200}	f	0	f	f	f	0	\N	f
\.


--
-- Data for Name: apps7_saml_configs; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.apps7_saml_configs (app_id, instance_id, entity_id, metadata, metadata_url) FROM stdin;
\.


--
-- Data for Name: auth_requests; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.auth_requests (id, creation_date, change_date, sequence, resource_owner, instance_id, login_client, client_id, redirect_uri, scope, prompt, ui_locales, max_age, login_hint, hint_user_id) FROM stdin;
\.


--
-- Data for Name: authn_keys2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.authn_keys2 (id, creation_date, change_date, resource_owner, instance_id, aggregate_id, sequence, object_id, expiration, identifier, public_key, enabled, type) FROM stdin;
\.


--
-- Data for Name: current_sequences; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.current_sequences (projection_name, aggregate_type, current_sequence, instance_id, "timestamp") FROM stdin;
\.


--
-- Data for Name: current_states; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.current_states (projection_name, instance_id, last_updated, aggregate_id, aggregate_type, sequence, event_date, "position", filter_offset) FROM stdin;
projections.user_schemas	275845547489756116	2024-07-13 19:28:12.308775-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.system_features	275845547489756116	2024-07-13 19:28:34.721222-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.quotas	275845547489756116	2024-07-13 19:28:51.320945-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.privacy_policies4	275845547489756116	2024-07-13 19:28:43.376558-04	275845547489756116	instance	19	2024-07-13 19:19:19.788267-04	1720912759.788474	1
projections.user_auth_methods4	275845547489756116	2024-07-13 19:28:34.985493-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.idp_templates6	275845547489756116	2024-07-13 19:28:19.288446-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.oidc_settings2	275845547489756116	2024-07-13 19:28:15.369076-04	275845547489756116	instance	105	2024-07-13 19:19:19.788267-04	1720912759.790255	1
projections.idp_login_policy_links5	275845547489756116	2024-07-13 19:28:53.52814-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.user_grants5	275845547489756116	2024-07-13 19:28:14.698723-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.org_metadata2	275845547489756116	2024-07-13 19:28:03.874329-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.targets1	275845547489756116	2024-07-13 19:28:13.341817-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.personal_access_tokens3	275845547489756116	2024-07-13 19:28:56.825815-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.instances	275845547489756116	2024-07-13 19:28:31.755743-04	275845547489756116	instance	28	2024-07-13 19:19:19.788267-04	1720912759.789403	1
projections.authn_keys2	275845547489756116	2024-07-13 19:28:49.245187-04	275845547489887188	project	12	2024-07-13 19:19:19.788267-04	1720912759.789446	1
projections.custom_texts2	275845547489756116	2024-07-13 19:28:50.180039-04	275845547489756116	instance	104	2024-07-13 19:19:19.788267-04	1720912759.790247	1
projections.executions1	275845547489756116	2024-07-13 19:28:38.795922-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.secret_generators2	275845547489756116	2024-07-13 19:28:28.286106-04	275845547489756116	instance	11	2024-07-13 19:19:19.788267-04	1720912759.788408	1
projections.user_metadata5	275845547489756116	2024-07-13 19:28:51.559815-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.notification_providers	275845547489756116	2024-07-13 19:28:11.439036-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.instance_domains	275845547489756116	2024-07-13 19:28:13.023381-04	275845547489756116	instance	32	2024-07-13 19:19:19.788267-04	1720912759.789456	1
projections.login_policies5	275845547489756116	2024-07-13 19:28:42.824792-04	275845547489756116	instance	18	2024-07-13 19:19:19.788267-04	1720912759.788465	1
projections.org_domains2	275845547489756116	2024-07-13 19:28:20.672003-04	275846310987301844	org	4	2024-07-13 19:26:53.821454-04	1720913213.821684	1
projections.milestones	275845547489756116	2024-07-13 19:28:17.628906-04	275846327613522900	project	6	2024-07-13 19:28:06.203132-04	1720913286.203242	1
projections.restrictions2	275845547489756116	2024-07-13 19:28:42.933773-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.message_texts2	275845547489756116	2024-07-13 19:28:58.211831-04	275845547489756116	instance	104	2024-07-13 19:19:19.788267-04	1720912759.790247	1
projections.smtp_configs2	275845547489756116	2024-07-13 19:28:45.666448-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.password_complexity_policies2	275845547489756116	2024-07-13 19:28:01.968552-04	275845547489756116	instance	12	2024-07-13 19:19:19.788267-04	1720912759.788414	1
projections.label_policies3	275845547489756116	2024-07-13 19:28:10.793504-04	275845547489756116	instance	23	2024-07-13 19:19:19.788267-04	1720912759.788509	1
projections.password_age_policies2	275845547489756116	2024-07-13 19:28:10.051375-04	275845547489756116	instance	13	2024-07-13 19:19:19.788267-04	1720912759.788421	1
projections.sms_configs2	275845547489756116	2024-07-13 19:28:34.36058-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.domain_policies2	275845547489756116	2024-07-13 19:28:28.493772-04	275845547489756116	instance	14	2024-07-13 19:19:19.788267-04	1720912759.788432	1
projections.instance_members4	275845547489756116	2024-07-13 19:28:42.644598-04	275845547489756116	instance	26	2024-07-13 19:19:19.788267-04	1720912759.789307	1
projections.sessions8	275845547489756116	2024-07-13 19:28:25.464532-04	275845547490345940	user	6	2024-07-13 19:20:46.293416-04	1720912846.29343	1
projections.org_members4	275845547489756116	2024-07-13 19:28:46.678801-04	275846310987301844	org	5	2024-07-13 19:26:53.821454-04	1720913213.821699	1
adminapi.styling2	275845547489756116	2024-07-13 19:28:18.828187-04	275845547489756116	instance	23	2024-07-13 19:19:19.788267-04	1720912759.788509	1
projections.mail_templates2	275845547489756116	2024-07-13 19:28:57.08884-04	275845547489756116	instance	24	2024-07-13 19:19:19.788267-04	1720912759.788518	1
projections.project_grant_members4	275845547489756116	2024-07-13 19:28:47.468957-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.project_roles4	275845547489756116	2024-07-13 19:28:23.269497-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.limits	275845547489756116	2024-07-13 19:28:09.788963-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.apps7	275845547489756116	2024-07-13 19:28:27.664527-04	275846327613522900	project	6	2024-07-13 19:28:06.203132-04	1720913286.203242	1
projections.projects4	275845547489756116	2024-07-13 19:28:46.920852-04	275846327613522900	project	1	2024-07-13 19:27:03.715993-04	1720913223.71601	1
projections.security_policies2	275845547489756116	2024-07-13 19:28:41.331152-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.project_grants4	275845547489756116	2024-07-13 19:28:42.946211-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.device_auth_requests2	275845547489756116	2024-07-13 19:28:43.643438-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.idp_user_links3	275845547489756116	2024-07-13 19:28:30.413752-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.instance_features2	275845547489756116	2024-07-13 19:28:17.348519-04	275845547489756116	feature	1	2024-07-13 19:19:19.788267-04	1720912759.790266	1
projections.orgs1	275845547489756116	2024-07-13 19:28:35.447527-04	275846310987301844	org	4	2024-07-13 19:26:53.821454-04	1720913213.821684	1
projections.lockout_policies3	275845547489756116	2024-07-13 19:28:20.940872-04	275845547489756116	instance	21	2024-07-13 19:19:19.788267-04	1720912759.788492	1
projections.keys4	275845547489756116	2024-07-13 19:28:41.06728-04	275845699558441940	key_pair	1	2024-07-13 19:20:49.360333-04	1720912849.360347	1
projections.actions3	275845547489756116	2024-07-13 19:28:24.68773-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.auth_requests	275845547489756116	2024-07-13 19:28:22.818592-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.idps3	275845547489756116	2024-07-13 19:28:33.942071-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.notification_policies	275845547489756116	2024-07-13 19:28:18.531817-04	275845547489756116	instance	20	2024-07-13 19:19:19.788267-04	1720912759.788482	1
projections.flow_triggers3	275845547489756116	2024-07-13 19:28:31.756858-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.project_members4	275845547489756116	2024-07-13 19:28:11.439692-04	275846327613522900	project	2	2024-07-13 19:27:03.715993-04	1720913223.716114	1
projections.users13	275845547489756116	2024-07-13 19:28:19.288001-04	275845547490345940	user	6	2024-07-13 19:20:46.293416-04	1720912846.29343	1
projections.login_names3	275845547489756116	2024-07-13 19:28:35.143639-04	275846310987301844	org	4	2024-07-13 19:26:53.821454-04	1720913213.821684	1
auth.user_sessions	275845547489756116	2024-07-13 19:28:42.47477-04	275845547490345940	user	6	2024-07-13 19:20:46.293416-04	1720912846.29343	1
projections.notifications	275845547489756116	2024-07-13 19:28:46.305648-04	275845547490345940	user	6	2024-07-13 19:20:46.293416-04	1720912846.29343	1
auth.tokens	275845547489756116	2024-07-13 19:28:48.469066-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
projections.notifications_quota	275845547489756116	2024-07-13 19:25:54.23517-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
auth.users3	275845547489756116	2024-07-13 19:26:16.5754-04	275845547490345940	user	6	2024-07-13 19:20:46.293416-04	1720912846.29343	1
auth.refresh_tokens	275845547489756116	2024-07-13 19:27:15.13196-04			0	0001-12-31 19:17:15-04:42:45 BC	0	0
\.


--
-- Data for Name: custom_texts2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.custom_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, template, language, key, text, owner_removed) FROM stdin;
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	33	t	InitCode	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	34	t	InitCode	de	Subject	User initialisieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	35	t	InitCode	de	Title	Zitadel - User initialisieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	36	t	InitCode	de	PreHeader	User initialisieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	37	t	InitCode	de	Text	Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen &lt;br&gt;&lt;strong&gt;{{.PreferredLoginName}}&lt;/strong&gt;&lt;br&gt; kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	38	t	InitCode	de	ButtonText	Initialisierung abschliessen	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	39	t	PasswordReset	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	40	t	PasswordReset	de	Subject	Passwort zurücksetzen	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	41	t	PasswordReset	de	Title	Zitadel - Passwort zurücksetzen	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	42	t	PasswordReset	de	PreHeader	Passwort zurücksetzen	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	43	t	PasswordReset	de	Text	Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	44	t	PasswordReset	de	ButtonText	Passwort zurücksetzen	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	45	t	VerifyEmail	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	46	t	VerifyEmail	de	Subject	Email verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	47	t	VerifyEmail	de	Title	Zitadel - Email verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	48	t	VerifyEmail	de	PreHeader	Email verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	49	t	VerifyEmail	de	Text	Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	50	t	VerifyEmail	de	ButtonText	Email verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	51	t	VerifyPhone	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	52	t	VerifyPhone	de	Subject	Telefonnummer verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	53	t	VerifyPhone	de	Title	Zitadel - Telefonnummer verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	54	t	VerifyPhone	de	PreHeader	Telefonnummer verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	55	t	VerifyPhone	de	Text	Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	56	t	VerifyPhone	de	ButtonText	Telefon verifizieren	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	57	t	DomainClaimed	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	58	t	DomainClaimed	de	Subject	Domain wurde beansprucht	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	59	t	DomainClaimed	de	Title	Zitadel - Domain wurde beansprucht	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	60	t	DomainClaimed	de	PreHeader	Email / Username ändern	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	61	t	DomainClaimed	de	Text	Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	62	t	DomainClaimed	de	ButtonText	Login	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	63	t	PasswordChange	de	Greeting	Hallo {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	64	t	PasswordChange	de	Subject	Passwort von Benutzer wurde geändert	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	65	t	PasswordChange	de	Title	ZITADEL - Passwort von Benutzer wurde geändert	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	66	t	PasswordChange	de	PreHeader	Passwort Änderung	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	67	t	PasswordChange	de	Text	Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	68	t	PasswordChange	de	ButtonText	Login	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	69	t	InitCode	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	70	t	InitCode	en	Subject	Initialize User	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	71	t	InitCode	en	Title	Zitadel - Initialize User	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	72	t	InitCode	en	PreHeader	Initialize User	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	73	t	InitCode	en	Text	This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	74	t	InitCode	en	ButtonText	Finish initialization	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	75	t	PasswordReset	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	76	t	PasswordReset	en	Subject	Reset password	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	77	t	PasswordReset	en	Title	Zitadel - Reset password	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	78	t	PasswordReset	en	PreHeader	Reset password	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	79	t	PasswordReset	en	Text	We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	80	t	PasswordReset	en	ButtonText	Reset password	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	81	t	VerifyEmail	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	82	t	VerifyEmail	en	Subject	Verify email	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	83	t	VerifyEmail	en	Title	Zitadel - Verify email	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	84	t	VerifyEmail	en	PreHeader	Verify email	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	85	t	VerifyEmail	en	Text	A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you din't add a new email, please ignore this email.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	86	t	VerifyEmail	en	ButtonText	Verify email	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	87	t	VerifyPhone	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	88	t	VerifyPhone	en	Subject	Verify phone	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	89	t	VerifyPhone	en	Title	Zitadel - Verify phone	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	90	t	VerifyPhone	en	PreHeader	Verify phone	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	91	t	VerifyPhone	en	Text	A new phone number has been added. Please use the following code to verify it {{.Code}}.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	92	t	VerifyPhone	en	ButtonText	Verify phone	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	93	t	DomainClaimed	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	94	t	DomainClaimed	en	Subject	Domain has been claimed	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	95	t	DomainClaimed	en	Title	Zitadel - Domain has been claimed	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	96	t	DomainClaimed	en	PreHeader	Change email/username	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	97	t	DomainClaimed	en	Text	The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	98	t	DomainClaimed	en	ButtonText	Login	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	99	t	PasswordChange	en	Greeting	Hello {{.DisplayName}},	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	100	t	PasswordChange	en	Subject	Password of user has changed	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	101	t	PasswordChange	en	Title	ZITADEL - Password of user has changed	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	102	t	PasswordChange	en	PreHeader	Change password	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	103	t	PasswordChange	en	Text	The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	104	t	PasswordChange	en	ButtonText	Login	f
\.


--
-- Data for Name: device_auth_requests2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.device_auth_requests2 (client_id, device_code, user_code, scopes, audience, creation_date, change_date, sequence, instance_id) FROM stdin;
\.


--
-- Data for Name: domain_policies2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.domain_policies2 (id, creation_date, change_date, sequence, state, user_login_must_be_domain, validate_org_domains, smtp_sender_address_matches_instance_domain, is_default, resource_owner, instance_id, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	14	1	f	f	f	t	275845547489756116	275845547489756116	f
\.


--
-- Data for Name: executions1; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.executions1 (id, creation_date, change_date, sequence, instance_id) FROM stdin;
\.


--
-- Data for Name: executions1_targets; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.executions1_targets (instance_id, execution_id, "position", include, target_id) FROM stdin;
\.


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.failed_events (projection_name, failed_sequence, failure_count, error, instance_id, last_failed) FROM stdin;
\.


--
-- Data for Name: failed_events2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.failed_events2 (projection_name, instance_id, aggregate_type, aggregate_id, event_creation_date, failed_sequence, failure_count, error, last_failed) FROM stdin;
projections.notifications	275845547489756116	user	275845547490345940	2024-07-13 19:20:46.293416-04	6	10	ID=QUERY-fwofw Message=Errors.SMTPConfig.NotFound Parent=(sql: no rows in result set)	2024-07-13 19:21:36.052423-04
\.


--
-- Data for Name: flow_triggers3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.flow_triggers3 (flow_type, change_date, sequence, trigger_type, resource_owner, instance_id, trigger_sequence, action_id) FROM stdin;
\.


--
-- Data for Name: idp_login_policy_links5; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_login_policy_links5 (idp_id, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, provider_type, owner_removed) FROM stdin;
\.


--
-- Data for Name: idp_templates6; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, owner_type, type, owner_removed, is_creation_allowed, is_linking_allowed, is_auto_creation, is_auto_update, auto_linking) FROM stdin;
\.


--
-- Data for Name: idp_templates6_apple; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_apple (idp_id, instance_id, client_id, team_id, key_id, private_key, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_azure; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_azure (idp_id, instance_id, client_id, client_secret, scopes, tenant, is_email_verified) FROM stdin;
\.


--
-- Data for Name: idp_templates6_github; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_github (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_github_enterprise; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_github_enterprise (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_gitlab; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_gitlab (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_gitlab_self_hosted; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_gitlab_self_hosted (idp_id, instance_id, issuer, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_google; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_google (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
\.


--
-- Data for Name: idp_templates6_jwt; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_jwt (idp_id, instance_id, issuer, jwt_endpoint, keys_endpoint, header_name) FROM stdin;
\.


--
-- Data for Name: idp_templates6_ldap2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_ldap2 (idp_id, instance_id, servers, start_tls, base_dn, bind_dn, bind_password, user_base, user_object_classes, user_filters, timeout, id_attribute, first_name_attribute, last_name_attribute, display_name_attribute, nick_name_attribute, preferred_username_attribute, email_attribute, email_verified, phone_attribute, phone_verified_attribute, preferred_language_attribute, avatar_url_attribute, profile_attribute) FROM stdin;
\.


--
-- Data for Name: idp_templates6_oauth2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_oauth2 (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes, id_attribute) FROM stdin;
\.


--
-- Data for Name: idp_templates6_oidc; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_oidc (idp_id, instance_id, issuer, client_id, client_secret, scopes, id_token_mapping) FROM stdin;
\.


--
-- Data for Name: idp_templates6_saml; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_templates6_saml (idp_id, instance_id, metadata, key, certificate, binding, with_signed_request, name_id_format, transient_mapping_attribute_name) FROM stdin;
\.


--
-- Data for Name: idp_user_links3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idp_user_links3 (idp_id, user_id, external_user_id, creation_date, change_date, sequence, resource_owner, instance_id, display_name, owner_removed) FROM stdin;
\.


--
-- Data for Name: idps3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idps3 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, styling_type, owner_type, auto_register, type, owner_removed) FROM stdin;
\.


--
-- Data for Name: idps3_jwt_config; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idps3_jwt_config (idp_id, instance_id, issuer, keys_endpoint, header_name, endpoint) FROM stdin;
\.


--
-- Data for Name: idps3_oidc_config; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.idps3_oidc_config (idp_id, instance_id, client_id, client_secret, issuer, scopes, display_name_mapping, username_mapping, authorization_endpoint, token_endpoint) FROM stdin;
\.


--
-- Data for Name: instance_domains; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.instance_domains (instance_id, creation_date, change_date, sequence, domain, is_generated, is_primary) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	32	zitadel-180ieg.localhost	t	f
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	32	localhost	f	t
\.


--
-- Data for Name: instance_features2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.instance_features2 (instance_id, key, creation_date, change_date, sequence, value) FROM stdin;
275845547489756116	login_default_org	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	1	true
\.


--
-- Data for Name: instance_members4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.instance_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, id) FROM stdin;
2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547490345940	275845547489821652	{IAM_OWNER}	26	275845547489756116	275845547489756116	275845547489756116
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.instances (id, name, change_date, creation_date, default_org_id, iam_project_id, console_client_id, console_app_id, sequence, default_language) FROM stdin;
275845547489756116	ZITADEL	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489887188	275845549150700500@zitadel	275845547490149332	28	en
\.


--
-- Data for Name: keys4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.keys4 (id, creation_date, change_date, resource_owner, instance_id, sequence, algorithm, use) FROM stdin;
275845699558441940	2024-07-13 19:20:49.360333-04	2024-07-13 19:20:49.360333-04	275845547489756116	275845547489756116	1	RS256	0
\.


--
-- Data for Name: keys4_certificate; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.keys4_certificate (id, instance_id, expiry, certificate) FROM stdin;
\.


--
-- Data for Name: keys4_private; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.keys4_private (id, instance_id, expiry, key) FROM stdin;
275845699558441940	275845547489756116	2024-07-14 01:20:49.354023-04	{"KeyID": "oidcKey", "Crypted": "PwqyYTnZH7t2HdjEDYiwns1GsS68Rqym6Zw2frofCoQqeMZEhkP8XpmFFF6d7YdV4TQCPGPMMGnVO7qlFwJsbfCRsF0GhkOgIx0jN1mflIOprt7zgZABZwaSf2WnmT0LWfXilV1zCW77+b35TmDZ4NA11SooTV7iGntAX0ZPhooh5C21VuCfYvLObnUtOFzC5XZ16DyOkNakSqUmpdxgWLptbEWegN8ouTbW7eGAmYtWgxnDmImhNY7FtTirTciUEweco12agxadVP5GvHWw2I1FVgX6exTjKmWDFrCI14bVClCL2v6R8TR3z4i/lci5HG6FZe91vMW9J2zjGwzTI2YZM/XxXOSYbfnnRQ0NkuzTMEX9PEpa43fJR0jy0of6gYVWHlISMane7stDgjEgH9IYksT9MuQv7a60m6mb6GyJKKi7rW0piz04RH8NtYBgUYH5kv3+BdMdwFTg6MN9zv4WT/UHlDnNi38qt9yRb8v8s5vfapMhyQmXDNGh/uf++Ra0wpXDv0oawDP7okOXKTu2OKh4oqy/fr7N2jL12OsZLiUSTpJeAttIiG51oqX6f0aKgnd0Ku6vRJwODWtmzSgl7rfs4PBDuX1rRanxN8DFKSsILXjMMhNexx6lGI5pznc/jKTcnPrAbzNhhr0lm89ouHFLXSfTlZ59QAwYUduGGE60oCzDX0S5hnm+0/qqRt52b6QfsGRF36DqbSQ9Aas8EdYinj3ISuxDlxHRDqhHqZiBSAoMpMLu4/E2D8lteD6ssm2bPboSMqwnvnvFAGyGLwqgDybwwG2U4Zgfy4LKR4nE5p0C6N8soY/kOmPbZs22AmOWOvBm67h9eX58ahLNxrRflv6iTHRJKgCCQLfAAAg40/b7OgnaKh81rb76iekg9Y5q4ZqoIrL2xUcOLQh5mLYO1jqahV5bSbWiXkT+GYnuzftnKeUFhPxZOH928AnoJoRMjNd853udXU0LBXJ1BDjvE8FaG+3Hrjn5mxIF9sThedqnIpZy3quJ8Wt02FjUTjxz8ugAqR10AWXjfhfeF3L7HFETvD6wejZ2ZCY2k7y8xMAkgWWnDGgfAmxmfcdbD9YsDyXobo1CvJrDT0KhFbwgnX+4JfK+bA81XxF37t6a5I+tzjR8ecPW+ANZ37f4MzIkQAWkp5EL+bGdqkPydimoSqxDL4Y4ZAdzprhSlaQDMOU8LWbHxcPGfMQOWOTgwsXq7e9OoUZpOtMb3PRLdQehvZkIEp1d2cFbWr3zk2N79lB1zaHUh+ZdksU4yo70NFVQX2ts/K2d0hld9qwzKpLIO/zzgphIIcHsAzQxl3kqi9w1vNjJrZL2xhfVhuIF88ZjQQ61msude9d13HsBSaC7et5pRerCi075mec6g/dWhDg61E/stdm/zmvExTiYfDVrTW4Qbbffug4mJdwC691INr5C2jjm0p6QR/P3+YCxBxMOl8RCwpSu9JbklHTm+gZjpd+oAaJvy2uJUVqrMmmlCzoRhJVJkzJly9sJCHYyg2JAY/RwT3XessXkuOvH//Dpj8HpU4IOiZa+UxUyZPv+5XevBGIhGIKxeoMm7LsfcS/dXoiQPUIWC1GmvhQZXJtxsJovlEen/rtGFUfkcXnnqNcFnCHnPE0gLwg/HPUISOYXFJtn4YovDVg186AtCdEZpBhtbWwZAC0EKhEGESKgqR+qdu1wKdzG2eljJGSnYK6lBJauDbFXH4z3a+CNeJX8usQvjlr8FcA5LWknGeezH8hw6SjATMTE5VKtEfLVKQwHuzUtVBRYDs5TNIWU7DqmnbGwAVwTTASlp5PWNXLa259GeuFz03WOkIO+rJh2MNgAldTcxUN5Si2Japew2XZ8vp8t3FyY8sXu3hdaeY/8iGp5ktycPIQt1sUwjwClCz2qVWte6TTA3ZUr92ijCntGdJW/opb5SghBd9C0QcsXdAP4d8hnCnQ2icF3WVU0VxxzJemcc6sm1nsv5C+eER6GensYmzOzL28Iv7Mu2TEjf2fCdwl74gXjyidSvac4/ewZKGdYg0IuGBvDThPrrDW0yuG0qandMbMbcIQgWMbB2FyYAkke+0V9JKeTYLeJgc6uAEmGBNMghGPt5GRWn4sxIOwxb+x6gPHGlGomofc/FbgLgXLFryup2PqpGm5fhMJ+AMTElc5bfIpGCt1op7u/DYS/QElNuKns0FAtqAFYXzVhpeMPagZ15uf2AIb4xgysMOylGJEDzChKtl7IfNgZrGUVXrE=", "Algorithm": "aes", "CryptoType": 0}
\.


--
-- Data for Name: keys4_public; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.keys4_public (id, instance_id, expiry, key) FROM stdin;
275845699558441940	275845547489756116	2024-07-15 01:20:49.354023-04	\\x2d2d2d2d2d424547494e20525341205055424c4943204b45592d2d2d2d2d0a4d494942496a414e42676b71686b6947397730424151454641414f43415138414d49494243674b4341514541786273476c596f5a684d314c74414456584f52330a2f34702f534f2f57534e2b2b79372b514e784e653749735a4f6b4251536731785a79327a72687678645245735432366f5a656d6f4136596d477a744b4b5357500a67536236334552727167362b72436f2f6f386c4b324e766371416270686f562b79324b2f5966496c386b796c4b787455674d386b5451326774382b687063694b0a487263554f6f5a685a53494e6b54564e6642616d6353563443492f38786d4773345349506b63482f654c49564a6865424761506d6e4536425963306576452f340a48633165465a506f7a356d75354230674956547538763333542b37496a464c32334175582b3651525558415a6567427565594132435571353055516f642b5a430a534d6531596241446c6c766d672b4a7431633277742f655a462b624d79754573656e6b7a3555454b4f4d444d4e4b6d6a65334d436939396135556f64556f634b0a78514944415141420a2d2d2d2d2d454e4420525341205055424c4943204b45592d2d2d2d2d0a
\.


--
-- Data for Name: label_policies3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.label_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, hide_login_name_suffix, watermark_disabled, should_error_popup, font_url, light_primary_color, light_warn_color, light_background_color, light_font_color, light_logo_url, light_icon_url, dark_primary_color, dark_warn_color, dark_background_color, dark_font_color, dark_logo_url, dark_icon_url, owner_removed, theme_mode) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	22	3	t	275845547489756116	275845547489756116	f	f	f	\N	#5469d4	#cd3d56	#fafafa	#000000	\N	\N	#2073c4	#ff3b5b	#111827	#ffffff	\N	\N	f	0
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	23	1	t	275845547489756116	275845547489756116	f	f	f	\N	#5469d4	#cd3d56	#fafafa	#000000	\N	\N	#2073c4	#ff3b5b	#111827	#ffffff	\N	\N	f	0
\.


--
-- Data for Name: limits; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.limits (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, audit_log_retention, block) FROM stdin;
\.


--
-- Data for Name: lockout_policies3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.lockout_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, max_password_attempts, max_otp_attempts, show_failure) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	21	1	t	275845547489756116	275845547489756116	0	0	t
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.locks (locker_id, locked_until, projection_name, instance_id) FROM stdin;
275845576698889172	2024-07-13 19:20:56.76-04	signing_key	275845547489756116
\.


--
-- Data for Name: login_names3_domains; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.login_names3_domains (name, is_primary, resource_owner, instance_id) FROM stdin;
zitadel.localhost	t	275845547489821652	275845547489756116
dinobank.localhost	t	275845761030161364	275845547489756116
dogsinc.localhost	t	275846310987301844	275845547489756116
\.


--
-- Data for Name: login_names3_policies; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.login_names3_policies (must_be_domain, is_default, resource_owner, instance_id) FROM stdin;
f	t	275845547489756116	275845547489756116
\.


--
-- Data for Name: login_names3_users; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.login_names3_users (id, user_name, resource_owner, instance_id) FROM stdin;
275845547490345940	zitadel-admin@zitadel.localhost	275845547489821652	275845547489756116
\.


--
-- Data for Name: login_policies5; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.login_policies5 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, allow_register, allow_username_password, allow_external_idps, force_mfa, force_mfa_local_only, second_factors, multi_factors, passwordless_type, hide_password_reset, ignore_unknown_usernames, allow_domain_discovery, disable_login_with_email, disable_login_with_phone, default_redirect_uri, password_check_lifetime, external_login_check_lifetime, mfa_init_skip_lifetime, second_factor_check_lifetime, multi_factor_check_lifetime, owner_removed) FROM stdin;
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	18	t	t	t	t	f	f	{1,2}	{1}	1	f	f	t	f	f		864000000000000	864000000000000	2592000000000000	64800000000000	43200000000000	f
\.


--
-- Data for Name: mail_templates2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.mail_templates2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, is_default, template, owner_removed) FROM stdin;
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	24	1	t	\\x0a3c21646f63747970652068746d6c3e0a3c68746d6c20786d6c6e733d22687474703a2f2f7777772e77332e6f72672f313939392f7868746d6c2220786d6c6e733a763d2275726e3a736368656d61732d6d6963726f736f66742d636f6d3a766d6c2220786d6c6e733a6f3d2275726e3a736368656d61732d6d6963726f736f66742d636f6d3a6f66666963653a6f6666696365223e0a3c686561643e0a20203c7469746c653e0a0a20203c2f7469746c653e0a20203c212d2d5b696620216d736f5d3e3c212d2d3e0a20203c6d65746120687474702d65717569763d22582d55412d436f6d70617469626c652220636f6e74656e743d2249453d65646765223e0a20203c212d2d3c215b656e6469665d2d2d3e0a20203c6d65746120687474702d65717569763d22436f6e74656e742d547970652220636f6e74656e743d22746578742f68746d6c3b20636861727365743d5554462d38223e0a20203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d31223e0a20203c7374796c6520747970653d22746578742f637373223e0a20202020236f75746c6f6f6b2061207b2070616464696e673a303b207d0a20202020626f6479207b206d617267696e3a303b70616464696e673a303b2d7765626b69742d746578742d73697a652d61646a7573743a313030253b2d6d732d746578742d73697a652d61646a7573743a313030253b207d0a202020207461626c652c207464207b20626f726465722d636f6c6c617073653a636f6c6c617073653b6d736f2d7461626c652d6c73706163653a3070743b6d736f2d7461626c652d7273706163653a3070743b207d0a20202020696d67207b20626f726465723a303b6865696768743a6175746f3b6c696e652d6865696768743a313030253b206f75746c696e653a6e6f6e653b746578742d6465636f726174696f6e3a6e6f6e653b2d6d732d696e746572706f6c6174696f6e2d6d6f64653a626963756269633b207d0a2020202070207b20646973706c61793a626c6f636b3b6d617267696e3a3133707820303b207d0a20203c2f7374796c653e0a20203c212d2d5b6966206d736f5d3e0a20203c786d6c3e0a202020203c6f3a4f6666696365446f63756d656e7453657474696e67733e0a2020202020203c6f3a416c6c6f77504e472f3e0a2020202020203c6f3a506978656c73506572496e63683e39363c2f6f3a506978656c73506572496e63683e0a202020203c2f6f3a4f6666696365446f63756d656e7453657474696e67733e0a20203c2f786d6c3e0a20203c215b656e6469665d2d2d3e0a20203c212d2d5b6966206c7465206d736f2031315d3e0a20203c7374796c6520747970653d22746578742f637373223e0a202020202e6d6a2d6f75746c6f6f6b2d67726f75702d666978207b2077696474683a313030252021696d706f7274616e743b207d0a20203c2f7374796c653e0a20203c215b656e6469665d2d2d3e0a0a0a20203c7374796c6520747970653d22746578742f637373223e0a20202020406d65646961206f6e6c792073637265656e20616e6420286d696e2d77696474683a343830707829207b0a2020202020202e6d6a2d636f6c756d6e2d7065722d313030207b2077696474683a313030252021696d706f7274616e743b206d61782d77696474683a20313030253b207d0a2020202020202e6d6a2d636f6c756d6e2d7065722d3630207b2077696474683a3630252021696d706f7274616e743b206d61782d77696474683a203630253b207d0a202020207d0a20203c2f7374796c653e0a0a0a20203c7374796c6520747970653d22746578742f637373223e0a0a0a0a20202020406d65646961206f6e6c792073637265656e20616e6420286d61782d77696474683a343830707829207b0a2020202020207461626c652e6d6a2d66756c6c2d77696474682d6d6f62696c65207b2077696474683a20313030252021696d706f7274616e743b207d0a20202020202074642e6d6a2d66756c6c2d77696474682d6d6f62696c65207b2077696474683a206175746f2021696d706f7274616e743b207d0a202020207d0a0a20203c2f7374796c653e0a20203c7374796c6520747970653d22746578742f637373223e2e736861646f772061207b0a20202020626f782d736861646f773a203070782033707820317078202d327078207267626128302c20302c20302c20302e32292c20307078203270782032707820307078207267626128302c20302c20302c20302e3134292c20307078203170782035707820307078207267626128302c20302c20302c20302e3132293b0a20207d3c2f7374796c653e0a0a20207b7b6966202e466f6e7455524c7d7d0a20203c7374796c653e0a2020202040666f6e742d66616365207b0a202020202020666f6e742d66616d696c793a20277b7b2e466f6e744661636546616d696c797d7d273b0a202020202020666f6e742d7374796c653a206e6f726d616c3b0a202020202020666f6e742d646973706c61793a20737761703b0a2020202020207372633a2075726c287b7b2e466f6e7455524c7d7d293b0a202020207d0a20203c2f7374796c653e0a20207b7b656e647d7d0a0a3c2f686561643e0a3c626f6479207374796c653d22776f72642d73706163696e673a6e6f726d616c3b223e0a0a0a3c6469760a20202020202020207374796c653d22220a3e0a0a20203c7461626c650a20202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d226261636b67726f756e643a7b7b2e4261636b67726f756e64436f6c6f727d7d3b6261636b67726f756e642d636f6c6f723a7b7b2e4261636b67726f756e64436f6c6f727d7d3b77696474683a313030253b626f726465722d7261646975733a313670783b220a20203e0a202020203c74626f64793e0a202020203c74723e0a2020202020203c74643e0a0a0a20202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a20202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b626f726465722d7261646975733a313670783b6d61782d77696474683a38303070783b223e0a0a202020202020202020203c7461626c650a202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b626f726465722d7261646975733a313670783b220a202020202020202020203e0a2020202020202020202020203c74626f64793e0a2020202020202020202020203c74723e0a20202020202020202020202020203c74640a202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a3230707820303b70616464696e672d6c6566743a303b746578742d616c69676e3a63656e7465723b220a20202020202020202020202020203e0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d22222077696474683d22383030707822203e3c215b656e6469665d2d2d3e0a0a202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a202020202020202020202020202020203e0a2020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020203c74643e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a202020202020202020202020202020202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b6d61782d77696474683a38303070783b223e0a0a2020202020202020202020202020202020202020202020203c7461626c650a2020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a2020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020203c74626f64793e0a20202020202020202020202020202020202020202020202020203c74723e0a202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a303b746578742d616c69676e3a63656e7465723b220a202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d2222207374796c653d2277696474683a38303070783b22203e3c215b656e6469665d2d2d3e0a0a2020202020202020202020202020202020202020202020202020202020203c6469760a2020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d313030206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a303b6c696e652d6865696768743a303b746578742d616c69676e3a6c6566743b646973706c61793a696e6c696e652d626c6f636b3b77696474683a313030253b646972656374696f6e3a6c74723b220a2020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22203e3c74723e3c7464207374796c653d22766572746963616c2d616c69676e3a746f703b77696474683a38303070783b22203e3c215b656e6469665d2d2d3e0a0a20202020202020202020202020202020202020202020202020202020202020203c6469760a20202020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d313030206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a3070783b746578742d616c69676e3a6c6566743b646972656374696f6e3a6c74723b646973706c61793a696e6c696e652d626c6f636b3b766572746963616c2d616c69676e3a746f703b77696474683a313030253b220a20202020202020202020202020202020202020202020202020202020202020203e0a0a202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e222077696474683d2231303025220a202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d22766572746963616c2d616c69676e3a746f703b70616464696e673a303b223e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b6966202e4c6f676f55524c7d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22222077696474683d2231303025220a202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a353070782030203330707820303b776f72642d627265616b3a627265616b2d776f72643b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465722d636f6c6c617073653a636f6c6c617073653b626f726465722d73706163696e673a3070783b220a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d2277696474683a31383070783b223e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c696d670a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743d226175746f22207372633d227b7b2e4c6f676f55524c7d7d22207374796c653d22626f726465723a303b626f726465722d7261646975733a3870783b646973706c61793a626c6f636b3b6f75746c696e653a6e6f6e653b746578742d6465636f726174696f6e3a6e6f6e653b6865696768743a6175746f3b77696474683a313030253b666f6e742d73697a653a313370783b222077696474683d22313830220a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202f3e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b656e647d7d0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a20202020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a20202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a2020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a202020202020202020202020202020202020202020202020202020203c2f74643e0a20202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020203c2f74626f64793e0a2020202020202020202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020202020202020203c2f6469763e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a20202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c74723e3c746420636c6173733d22222077696474683d22383030707822203e3c215b656e6469665d2d2d3e0a0a202020202020202020202020202020203c7461626c650a202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a202020202020202020202020202020203e0a2020202020202020202020202020202020203c74626f64793e0a2020202020202020202020202020202020203c74723e0a20202020202020202020202020202020202020203c74643e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220636c6173733d2222207374796c653d2277696474683a38303070783b222077696474683d2238303022203e3c74723e3c7464207374796c653d226c696e652d6865696768743a3070783b666f6e742d73697a653a3070783b6d736f2d6c696e652d6865696768742d72756c653a65786163746c793b223e3c215b656e6469665d2d2d3e0a0a0a202020202020202020202020202020202020202020203c64697620207374796c653d226d617267696e3a307078206175746f3b6d61782d77696474683a38303070783b223e0a0a2020202020202020202020202020202020202020202020203c7461626c650a2020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d2277696474683a313030253b220a2020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020203c74626f64793e0a20202020202020202020202020202020202020202020202020203c74723e0a202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22646972656374696f6e3a6c74723b666f6e742d73697a653a3070783b70616464696e673a303b746578742d616c69676e3a63656e7465723b220a202020202020202020202020202020202020202020202020202020203e0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520726f6c653d2270726573656e746174696f6e2220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e3c74723e3c746420636c6173733d2222207374796c653d22766572746963616c2d616c69676e3a746f703b77696474683a34383070783b22203e3c215b656e6469665d2d2d3e0a0a2020202020202020202020202020202020202020202020202020202020203c6469760a2020202020202020202020202020202020202020202020202020202020202020202020202020636c6173733d226d6a2d636f6c756d6e2d7065722d3630206d6a2d6f75746c6f6f6b2d67726f75702d66697822207374796c653d22666f6e742d73697a653a3070783b746578742d616c69676e3a6c6566743b646972656374696f6e3a6c74723b646973706c61793a696e6c696e652d626c6f636b3b766572746963616c2d616c69676e3a746f703b77696474683a313030253b220a2020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e222077696474683d2231303025220a20202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020203c746420207374796c653d22766572746963616c2d616c69676e3a746f703b70616464696e673a303b223e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22222077696474683d2231303025220a20202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74626f64793e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a323470783b666f6e742d7765696768743a3530303b6c696e652d6865696768743a313b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e4772656574696e677d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313670783b666f6e742d7765696768743a6c696768743b6c696e652d6865696768743a312e353b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e546578747d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e7465722220766572746963616c2d616c69676e3d226d6964646c652220636c6173733d22736861646f7722207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c7461626c650a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d22302220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465722d636f6c6c617073653a73657061726174653b6c696e652d6865696768743a313030253b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222206267636f6c6f723d227b7b2e5072696d617279436f6c6f727d7d2220726f6c653d2270726573656e746174696f6e22207374796c653d22626f726465723a6e6f6e653b626f726465722d7261646975733a3670783b637572736f723a6175746f3b6d736f2d70616464696e672d616c743a3130707820323570783b6261636b67726f756e643a7b7b2e5072696d617279436f6c6f727d7d3b222076616c69676e3d226d6964646c65220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c610a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020687265663d227b7b2e55524c7d7d222072656c3d226e6f6f70656e6572206e6f7265666572726572206e6f747261636b22207374796c653d22646973706c61793a696e6c696e652d626c6f636b3b6261636b67726f756e643a7b7b2e5072696d617279436f6c6f727d7d3b636f6c6f723a236666666666663b666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313470783b666f6e742d7765696768743a3530303b6c696e652d6865696768743a313230253b6d617267696e3a303b746578742d6465636f726174696f6e3a6e6f6e653b746578742d7472616e73666f726d3a6e6f6e653b70616464696e673a3130707820323570783b6d736f2d70616464696e672d616c743a3070783b626f726465722d7261646975733a3670783b22207461726765743d225f626c616e6b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b2e427574746f6e546578747d7d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f613e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b6966202e496e636c756465466f6f7465727d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a3130707820323570783b70616464696e672d746f703a323070783b70616464696e672d72696768743a323070783b70616464696e672d626f74746f6d3a323070783b70616464696e672d6c6566743a323070783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c700a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22626f726465722d746f703a736f6c69642032707820236462646264623b666f6e742d73697a653a3170783b6d617267696e3a307078206175746f3b77696474683a313030253b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f703e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c7461626c6520616c69676e3d2263656e7465722220626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d223022207374796c653d22626f726465722d746f703a736f6c69642032707820236462646264623b666f6e742d73697a653a3170783b6d617267696e3a307078206175746f3b77696474683a34343070783b2220726f6c653d2270726573656e746174696f6e222077696474683d22343430707822203e3c74723e3c7464207374796c653d226865696768743a303b6c696e652d6865696768743a303b223e20266e6273703b0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c74723e0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c74640a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616c69676e3d2263656e74657222207374796c653d22666f6e742d73697a653a3070783b70616464696e673a313670783b776f72642d627265616b3a627265616b2d776f72643b220a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203e0a0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c6469760a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207374796c653d22666f6e742d66616d696c793a7b7b2e466f6e7446616d696c797d7d3b666f6e742d73697a653a313370783b6c696e652d6865696768743a313b746578742d616c69676e3a63656e7465723b636f6c6f723a7b7b2e466f6e74436f6c6f727d7d3b220a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020203e7b7b2e466f6f746572546578747d7d3c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b7b656e647d7d0a202020202020202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a20202020202020202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020202020202020203c2f74643e0a202020202020202020202020202020202020202020202020202020202020202020203c2f74723e0a202020202020202020202020202020202020202020202020202020202020202020203c2f74626f64793e0a20202020202020202020202020202020202020202020202020202020202020203c2f7461626c653e0a0a2020202020202020202020202020202020202020202020202020202020203c2f6469763e0a0a2020202020202020202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a202020202020202020202020202020202020202020202020202020203c2f74643e0a20202020202020202020202020202020202020202020202020203c2f74723e0a20202020202020202020202020202020202020202020202020203c2f74626f64793e0a2020202020202020202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020202020202020203c2f6469763e0a0a0a202020202020202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a20202020202020202020202020202020202020203c2f74643e0a2020202020202020202020202020202020203c2f74723e0a2020202020202020202020202020202020203c2f74626f64793e0a202020202020202020202020202020203c2f7461626c653e0a0a202020202020202020202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a20202020202020202020202020203c2f74643e0a2020202020202020202020203c2f74723e0a2020202020202020202020203c2f74626f64793e0a202020202020202020203c2f7461626c653e0a0a20202020202020203c2f6469763e0a0a0a20202020202020203c212d2d5b6966206d736f207c2049455d3e3c2f74643e3c2f74723e3c2f7461626c653e3c215b656e6469665d2d2d3e0a0a0a2020202020203c2f74643e0a202020203c2f74723e0a202020203c2f74626f64793e0a20203c2f7461626c653e0a0a3c2f6469763e0a0a3c2f626f64793e0a3c2f68746d6c3e0a	f
\.


--
-- Data for Name: message_texts2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.message_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, type, language, title, pre_header, subject, greeting, text, button_text, footer_text, owner_removed) FROM stdin;
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	38	1	InitCode	de	Zitadel - User initialisieren	User initialisieren	User initialisieren	Hallo {{.DisplayName}},	Dieser Benutzer wurde soeben im Zitadel erstellt. Mit dem Benutzernamen &lt;br&gt;&lt;strong&gt;{{.PreferredLoginName}}&lt;/strong&gt;&lt;br&gt; kannst du dich anmelden. Nutze den untenstehenden Button, um die Initialisierung abzuschliessen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es einfach ignorieren.	Initialisierung abschliessen	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	44	1	PasswordReset	de	Zitadel - Passwort zurücksetzen	Passwort zurücksetzen	Passwort zurücksetzen	Hallo {{.DisplayName}},	Wir haben eine Anfrage für das Zurücksetzen deines Passwortes bekommen. Du kannst den untenstehenden Button verwenden, um dein Passwort zurückzusetzen &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du dieses Mail nicht angefordert hast, kannst du es ignorieren.	Passwort zurücksetzen	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	50	1	VerifyEmail	de	Zitadel - Email verifizieren	Email verifizieren	Email verifizieren	Hallo {{.DisplayName}},	Eine neue E-Mail Adresse wurde hinzugefügt. Bitte verwende den untenstehenden Button um diese zu verifizieren &lt;br&gt;(Code &lt;strong&gt;{{.Code}}&lt;/strong&gt;).&lt;br&gt; Falls du deine E-Mail Adresse nicht selber hinzugefügt hast, kannst du dieses E-Mail ignorieren.	Email verifizieren	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	56	1	VerifyPhone	de	Zitadel - Telefonnummer verifizieren	Telefonnummer verifizieren	Telefonnummer verifizieren	Hallo {{.DisplayName}},	Eine Telefonnummer wurde hinzugefügt. Bitte verifiziere diese in dem du folgenden Code eingibst (Code {{.Code}})	Telefon verifizieren	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	92	1	VerifyPhone	en	Zitadel - Verify phone	Verify phone	Verify phone	Hello {{.DisplayName}},	A new phone number has been added. Please use the following code to verify it {{.Code}}.	Verify phone	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	62	1	DomainClaimed	de	Zitadel - Domain wurde beansprucht	Email / Username ändern	Domain wurde beansprucht	Hallo {{.DisplayName}},	Die Domain {{.Domain}} wurde von einer Organisation beansprucht. Dein derzeitiger User {{.Username}} ist nicht Teil dieser Organisation. Daher musst du beim nächsten Login eine neue Email hinterlegen. Für diesen Login haben wir dir einen temporären Usernamen ({{.TempUsername}}) erstellt.	Login	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	68	1	PasswordChange	de	ZITADEL - Passwort von Benutzer wurde geändert	Passwort Änderung	Passwort von Benutzer wurde geändert	Hallo {{.DisplayName}},	Das Password vom Benutzer wurde geändert. Wenn diese Änderung von jemand anderem gemacht wurde, empfehlen wir die sofortige Zurücksetzung ihres Passworts.	Login	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	74	1	InitCode	en	Zitadel - Initialize User	Initialize User	Initialize User	Hello {{.DisplayName}},	This user was created in Zitadel. Use the username {{.PreferredLoginName}} to login. Please click the button below to finish the initialization process. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	Finish initialization	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	80	1	PasswordReset	en	Zitadel - Reset password	Reset password	Reset password	Hello {{.DisplayName}},	We received a password reset request. Please use the button below to reset your password. (Code {{.Code}}) If you didn't ask for this mail, please ignore it.	Reset password	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	86	1	VerifyEmail	en	Zitadel - Verify email	Verify email	Verify email	Hello {{.DisplayName}},	A new email has been added. Please use the button below to verify your email. (Code {{.Code}}) If you din't add a new email, please ignore this email.	Verify email	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	98	1	DomainClaimed	en	Zitadel - Domain has been claimed	Change email/username	Domain has been claimed	Hello {{.DisplayName}},	The domain {{.Domain}} has been claimed by an organization. Your current user {{.UserName}} is not part of this organization. Therefore you'll have to change your email when you login. We have created a temporary username ({{.TempUsername}}) for this login.	Login	\N	f
275845547489756116	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	104	1	PasswordChange	en	ZITADEL - Password of user has changed	Change password	Password of user has changed	Hello {{.DisplayName}},	The password of your user has changed. If this change was not done by you, please be advised to immediately reset your password.	Login	\N	f
\.


--
-- Data for Name: milestones; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.milestones (instance_id, type, reached_date, last_pushed_date, primary_domain, ignore_client_ids) FROM stdin;
275845547489756116	1	2024-07-13 19:19:19.788267-04	\N	localhost	\N
275845547489756116	5	\N	\N	localhost	{275845549117146068@zitadel,275845549133923284@zitadel,275845549133988820@zitadel,275845549150700500@zitadel}
275845547489756116	6	\N	\N	localhost	\N
275845547489756116	2	2024-07-13 19:20:49.184203-04	\N	localhost	\N
275845547489756116	3	2024-07-13 19:22:09.813563-04	\N	localhost	\N
275845547489756116	4	2024-07-13 19:22:51.658348-04	\N	localhost	\N
\.


--
-- Data for Name: notification_policies; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.notification_policies (id, creation_date, change_date, resource_owner, instance_id, sequence, state, is_default, password_change, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489756116	275845547489756116	20	1	t	t	f
\.


--
-- Data for Name: notification_providers; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.notification_providers (aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, state, provider_type, compact) FROM stdin;
\.


--
-- Data for Name: oidc_settings2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.oidc_settings2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, access_token_lifetime, id_token_lifetime, refresh_token_idle_expiration, refresh_token_expiration) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489756116	275845547489756116	105	43200000000000	43200000000000	2592000000000000	7776000000000000
\.


--
-- Data for Name: org_domains2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.org_domains2 (org_id, instance_id, creation_date, change_date, sequence, domain, is_verified, is_primary, validation_type, owner_removed) FROM stdin;
275845547489821652	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	4	zitadel.localhost	t	t	0	f
275845761030161364	275845547489756116	2024-07-13 19:21:26.039644-04	2024-07-13 19:21:26.039644-04	4	dinobank.localhost	t	t	0	f
275846310987301844	275845547489756116	2024-07-13 19:26:53.821454-04	2024-07-13 19:26:53.821454-04	4	dogsinc.localhost	t	t	0	f
\.


--
-- Data for Name: org_members4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.org_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, org_id) FROM stdin;
2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547490345940	275845547489821652	{ORG_OWNER}	5	275845547489821652	275845547489756116	275845547489821652
2024-07-13 19:21:26.039644-04	2024-07-13 19:21:26.039644-04	275845547490345940	275845547489821652	{ORG_OWNER}	5	275845761030161364	275845547489756116	275845761030161364
2024-07-13 19:26:53.821454-04	2024-07-13 19:26:53.821454-04	275845547490345940	275845547489821652	{ORG_OWNER}	5	275846310987301844	275845547489756116	275846310987301844
\.


--
-- Data for Name: org_metadata2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.org_metadata2 (org_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value, owner_removed) FROM stdin;
\.


--
-- Data for Name: orgs1; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.orgs1 (id, creation_date, change_date, resource_owner, instance_id, org_state, sequence, name, primary_domain) FROM stdin;
275845547489821652	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547489821652	275845547489756116	1	4	ZITADEL	zitadel.localhost
275845761030161364	2024-07-13 19:21:26.039644-04	2024-07-13 19:21:26.039644-04	275845761030161364	275845547489756116	1	4	dinobank	dinobank.localhost
275846310987301844	2024-07-13 19:26:53.821454-04	2024-07-13 19:26:53.821454-04	275846310987301844	275845547489756116	1	4	dogsinc	dogsinc.localhost
\.


--
-- Data for Name: password_age_policies2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.password_age_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, expire_warn_days, max_age_days, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	13	1	t	275845547489756116	275845547489756116	0	0	f
\.


--
-- Data for Name: password_complexity_policies2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.password_complexity_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, min_length, has_lowercase, has_uppercase, has_symbol, has_number, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	12	1	t	275845547489756116	275845547489756116	8	t	t	t	t	f
\.


--
-- Data for Name: personal_access_tokens3; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.personal_access_tokens3 (id, creation_date, change_date, sequence, resource_owner, instance_id, user_id, expiration, scopes, owner_removed) FROM stdin;
\.


--
-- Data for Name: privacy_policies4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.privacy_policies4 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, privacy_link, tos_link, help_link, support_email, docs_link, custom_link, custom_link_text, owner_removed) FROM stdin;
275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	19	1	t	275845547489756116	275845547489756116	https://zitadel.com/docs/legal/privacy-policy	https://zitadel.com/docs/legal/terms-of-service			https://zitadel.com/docs			f
\.


--
-- Data for Name: project_grant_members4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.project_grant_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id, grant_id, granted_org) FROM stdin;
\.


--
-- Data for Name: project_grants4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.project_grants4 (grant_id, creation_date, change_date, sequence, state, resource_owner, instance_id, project_id, granted_org_id, granted_role_keys) FROM stdin;
\.


--
-- Data for Name: project_members4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.project_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id) FROM stdin;
2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	275845547490345940	275845547489821652	{PROJECT_OWNER}	2	275845547489821652	275845547489756116	275845547489887188
2024-07-13 19:22:09.813563-04	2024-07-13 19:22:09.813563-04	275845547490345940	275845547489821652	{PROJECT_OWNER}	2	275845761030161364	275845547489756116	275845834531144660
2024-07-13 19:25:09.078396-04	2024-07-13 19:25:09.078396-04	275845547490345940	275845547489821652	{PROJECT_OWNER}	2	275845547489821652	275845547489756116	275846135296295892
2024-07-13 19:27:03.715993-04	2024-07-13 19:27:03.715993-04	275845547490345940	275845547489821652	{PROJECT_OWNER}	2	275846310987301844	275845547489756116	275846327613522900
\.


--
-- Data for Name: project_roles4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.project_roles4 (project_id, role_key, creation_date, change_date, sequence, resource_owner, instance_id, display_name, group_name) FROM stdin;
\.


--
-- Data for Name: projects4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.projects4 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, project_role_assertion, project_role_check, has_project_check, private_labeling_setting) FROM stdin;
275845547489887188	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	1	1	275845547489821652	275845547489756116	ZITADEL	f	f	f	0
275845834531144660	2024-07-13 19:22:09.813563-04	2024-07-13 19:22:09.813563-04	1	1	275845761030161364	275845547489756116	zstarter	f	f	f	0
275846135296295892	2024-07-13 19:25:09.078396-04	2024-07-13 19:25:09.078396-04	1	1	275845547489821652	275845547489756116	zstarter	f	f	f	0
275846327613522900	2024-07-13 19:27:03.715993-04	2024-07-13 19:27:03.715993-04	1	1	275846310987301844	275845547489756116	zstarter	f	f	f	0
\.


--
-- Data for Name: quotas; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.quotas (id, instance_id, unit, amount, from_anchor, "interval", limit_usage) FROM stdin;
\.


--
-- Data for Name: quotas_notifications; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.quotas_notifications (instance_id, unit, id, call_url, percent, repeat, latest_due_period_start, next_due_threshold) FROM stdin;
\.


--
-- Data for Name: quotas_periods; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.quotas_periods (instance_id, unit, start, usage) FROM stdin;
\.


--
-- Data for Name: restrictions2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.restrictions2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, disallow_public_org_registration, allowed_languages) FROM stdin;
\.


--
-- Data for Name: secret_generators2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.secret_generators2 (generator_type, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, length, expiry, include_lower_letters, include_upper_letters, include_digits, include_symbols) FROM stdin;
7	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	3	275845547489756116	275845547489756116	64	0	t	t	t	f
1	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	4	275845547489756116	275845547489756116	6	259200000000000	f	t	t	f
2	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	5	275845547489756116	275845547489756116	6	3600000000000	f	t	t	f
3	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	6	275845547489756116	275845547489756116	6	3600000000000	f	t	t	f
5	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	7	275845547489756116	275845547489756116	6	3600000000000	f	t	t	f
6	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	8	275845547489756116	275845547489756116	12	3600000000000	t	t	t	f
4	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	9	275845547489756116	275845547489756116	32	0	t	t	t	f
8	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	10	275845547489756116	275845547489756116	8	300000000000	f	f	t	f
9	275845547489756116	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	11	275845547489756116	275845547489756116	8	300000000000	f	f	t	f
\.


--
-- Data for Name: security_policies2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.security_policies2 (creation_date, change_date, instance_id, sequence, enable_iframe_embedding, origins, enable_impersonation) FROM stdin;
\.


--
-- Data for Name: sessions8; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.sessions8 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, creator, user_id, user_resource_owner, user_checked_at, password_checked_at, intent_checked_at, webauthn_checked_at, webauthn_user_verified, totp_checked_at, otp_sms_checked_at, otp_email_checked_at, metadata, token_id, user_agent_fingerprint_id, user_agent_ip, user_agent_description, user_agent_header, expiration) FROM stdin;
\.


--
-- Data for Name: sms_configs2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.sms_configs2 (id, aggregate_id, creation_date, change_date, sequence, state, resource_owner, instance_id) FROM stdin;
\.


--
-- Data for Name: sms_configs2_twilio; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.sms_configs2_twilio (sms_id, instance_id, sid, sender_number, token) FROM stdin;
\.


--
-- Data for Name: smtp_configs2; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.smtp_configs2 (id, creation_date, change_date, sequence, resource_owner, instance_id, tls, sender_address, sender_name, reply_to_address, host, username, password, state, description) FROM stdin;
\.


--
-- Data for Name: system_features; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.system_features (key, creation_date, change_date, sequence, value) FROM stdin;
\.


--
-- Data for Name: targets1; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.targets1 (id, creation_date, change_date, resource_owner, instance_id, target_type, sequence, name, endpoint, timeout, interrupt_on_error) FROM stdin;
\.


--
-- Data for Name: user_auth_methods4; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.user_auth_methods4 (user_id, method_type, token_id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, owner_removed) FROM stdin;
\.


--
-- Data for Name: user_grants5; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.user_grants5 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, user_id, resource_owner_user, project_id, resource_owner_project, grant_id, granted_org, roles) FROM stdin;
\.


--
-- Data for Name: user_metadata5; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.user_metadata5 (user_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value) FROM stdin;
\.


--
-- Data for Name: user_schemas; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.user_schemas (id, change_date, sequence, state, instance_id, type, revision, schema, possible_authenticators) FROM stdin;
\.


--
-- Data for Name: users13; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.users13 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, username, type) FROM stdin;
275845547490345940	2024-07-13 19:19:19.788267-04	2024-07-13 19:19:19.788267-04	2	1	275845547489821652	275845547489756116	zitadel-admin@zitadel.localhost	1
\.


--
-- Data for Name: users13_humans; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.users13_humans (user_id, instance_id, first_name, last_name, nick_name, display_name, preferred_language, gender, avatar_key, email, is_email_verified, phone, is_phone_verified, password_change_required, password_changed) FROM stdin;
275845547490345940	275845547489756116	ZITADEL	Admin	\N	ZITADEL Admin	en	\N	\N	zitadel-admin@zitadel.localhost	t	\N	\N	f	2024-07-13 19:20:46.293416-04
\.


--
-- Data for Name: users13_machines; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.users13_machines (user_id, instance_id, name, description, secret, access_token_type) FROM stdin;
\.


--
-- Data for Name: users13_notifications; Type: TABLE DATA; Schema: projections; Owner: postgres
--

COPY projections.users13_notifications (user_id, instance_id, last_email, verified_email, last_phone, verified_phone, password_set) FROM stdin;
275845547490345940	275845547489756116	zitadel-admin@zitadel.localhost	zitadel-admin@zitadel.localhost	\N	\N	t
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: system; Owner: postgres
--

COPY system.assets (instance_id, asset_type, resource_owner, name, content_type, data, updated_at) FROM stdin;
275845547489756116	1	275845547489756116	policy/label/css/variables.css	text/css	\\x3a726f6f74207b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3130303a20726762283133372c203135302c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3630303a207267622837352c2039382c20323034293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3730303a207267622836362c2039312c20313936293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3830303a207267622835362c2038342c20313838293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d35303a20726762283135382c203136392c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3230303a20726762283132322c203133362c20323438293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3330303a20726762283130322c203131392c20323238293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3430303a207267622839332c203131322c20323230293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3530303a207267622838342c203130352c20323132293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3930303a207267622834352c2037382c20313830293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3230303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3430303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3530303a20726762283235302c203235302c20323530293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3630303a20726762283233332c203233332c20323333293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3930303a20726762283138342c203138342c20313834293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d35303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3130303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3830303a20726762283230302c203230302c20323030293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3330303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3730303a20726762283231362c203231362c20323136293b2d2d7a69746164656c2d636f6c6f722d7761726e2d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3430303a20726762283231342c2037302c203933293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3530303a20726762283230352c2036312c203836293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3730303a20726762283138372c2034332c203732293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3830303a20726762283137382c2033332c203636293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3630303a20726762283139362c2035322c203739293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3930303a20726762283137302c2032312c203539293b2d2d7a69746164656c2d636f6c6f722d7761726e2d35303a20726762283235352c203133322c20313439293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3130303a20726762283235352c203131322c20313330293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3230303a20726762283234342c2039372c20313137293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3330303a20726762283232332c2037382c20313030293b2d2d7a69746164656c2d636f6c6f722d6c6162656c3a20233030303030303b2d2d7a69746164656c2d636f6c6f722d746578742d3230303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3330303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3530303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3630303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3730303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3830303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d35303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3430303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d3930303a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3130303a2072676228302c20302c2030293b7d2e6c676e2d6461726b2d7468656d65207b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3930303a2072676228302c2038372c20313635293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d35303a20726762283132302c203137392c20323535293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3130303a207267622839382c203136302c20323436293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3330303a207267622835372c203132392c20323132293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3430303a207267622834362c203132322c20323034293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3730303a2072676228302c203130312c20313830293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3230303a207267622838312c203134362c20323331293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3530303a207267622833322c203131352c20313936293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3630303a207267622831312c203130382c20313838293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d3830303a2072676228302c2039342c20313732293b2d2d7a69746164656c2d636f6c6f722d7072696d6172792d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3730303a207267622831352c2032322c203337293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3830303a207267622831342c2032312c203336293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3930303a207267622831332c2032302c203335293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d636f6e74726173743a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d35303a207267622832362c2033332c203438293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3430303a207267622831382c2032352c203430293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3530303a207267622831372c2032342c203339293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3630303a207267622831362c2032332c203338293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3130303a207267622832332c2033302c203436293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3230303a207267622832312c2032382c203434293b2d2d7a69746164656c2d636f6c6f722d6261636b67726f756e642d3330303a207267622831392c2032362c203431293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3730303a20726762283233332c2033302c203735293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3430303a20726762283235352c2037312c203939293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3630303a20726762283234342c2034362c203833293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3230303a20726762283235352c203130372c20313238293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3330303a20726762283235352c2038322c20313038293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3530303a20726762283235352c2035392c203931293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3830303a20726762283232322c20342c203637293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3930303a20726762283231312c20302c203539293b2d2d7a69746164656c2d636f6c6f722d7761726e2d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d7761726e2d35303a20726762283235352c203135322c20313637293b2d2d7a69746164656c2d636f6c6f722d7761726e2d3130303a20726762283235352c203132362c20313434293b2d2d7a69746164656c2d636f6c6f722d6c6162656c3a20236666666666663b2d2d7a69746164656c2d636f6c6f722d746578742d3130303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3230303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3430303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3530303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d636f6e74726173743a2072676228302c20302c2030293b2d2d7a69746164656c2d636f6c6f722d746578742d35303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3330303a20726762283235352c203235352c20323535293b2d2d7a69746164656c2d636f6c6f722d746578742d3630303a20726762283233382c203233382c20323338293b2d2d7a69746164656c2d636f6c6f722d746578742d3730303a20726762283232312c203232312c20323231293b2d2d7a69746164656c2d636f6c6f722d746578742d3830303a20726762283230342c203230342c20323034293b2d2d7a69746164656c2d636f6c6f722d746578742d3930303a20726762283138372c203138372c20313837293b7d	2024-07-13 19:19:33.118168-04
\.


--
-- Data for Name: encryption_keys; Type: TABLE DATA; Schema: system; Owner: postgres
--

COPY system.encryption_keys (id, key) FROM stdin;
userKey	_SGzBhZTubQJSZNteHnOzYMrszjZIigIJy6Iq944bPv-JAXipJ5NZ1ayOqZnChpg
smtpKey	CFvUVssRP5aptFm8YKRLRrt8-gd5a6Ds85dxLMj0JPOugb_8IavqeY6gpi0elNbh
oidcKey	KPoPoUEexP54czRC-VCco99MoXPfbq5we9rTU_cSQDeRLRwI06KFou26WuKVTrr8
domainVerificationKey	aIbzPkgzg_tfglhaMV1CZyiuMwtMwvXrh6kmGa1Gph7Xj6KjzOXwbwavptzpi8d-
idpConfigKey	nv37X0nMAcpMqGbeFUXE68du_bpDTxsnVUazSJE-gOtY98NJiNCz8CkiaqjlwY7h
samlKey	JOciZJM2ZvclpJ20Hv3kBrujTwSFjIt3ZPA0XjqnOdPbnI7-fJmXERFUOAUrnLyY
otpKey	zyY-NNY8jc-XaFaijTlM0kqpJjTU19ltCJ9Wdekfs8GeCJXKEjiA33ftNQMQIW0i
smsKey	pIeha6bqRoEdMVV3HIzcNzAhlTrSj_OCiKRH29NstAbf_KfYzgJP4LnRTCUTU2cm
csrfCookieKey	EgvsnhWr2RM01xPT_J-x4O6mnXVNNW5cBN7CwjEqe5EPkM0S1wTHAyHVJ-LMHh8X
userAgentCookieKey	UkeRcRqTBlTi-M5FrbNLmkHJtnbyuLVRG5dVzFIkYPOqwbmuW0JvRUw5LMfDmQPQ
\.


--
-- Name: system_seq; Type: SEQUENCE SET; Schema: eventstore; Owner: postgres
--

SELECT pg_catalog.setval('eventstore.system_seq', 1, false);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: postgres
--

ALTER TABLE ONLY adminapi.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: postgres
--

ALTER TABLE ONLY adminapi.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: postgres
--

ALTER TABLE ONLY adminapi.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: styling2 styling2_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: postgres
--

ALTER TABLE ONLY adminapi.styling2
    ADD CONSTRAINT styling2_pkey PRIMARY KEY (instance_id, aggregate_id, label_policy_state);


--
-- Name: styling styling_pkey; Type: CONSTRAINT; Schema: adminapi; Owner: postgres
--

ALTER TABLE ONLY adminapi.styling
    ADD CONSTRAINT styling_pkey PRIMARY KEY (aggregate_id, label_policy_state, instance_id);


--
-- Name: auth_requests auth_requests_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (id, instance_id);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);


--
-- Name: idp_configs2 idp_configs2_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.idp_configs2
    ADD CONSTRAINT idp_configs2_pkey PRIMARY KEY (instance_id, idp_config_id);


--
-- Name: idp_configs idp_configs_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.idp_configs
    ADD CONSTRAINT idp_configs_pkey PRIMARY KEY (idp_config_id, instance_id);


--
-- Name: idp_providers2 idp_providers2_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.idp_providers2
    ADD CONSTRAINT idp_providers2_pkey PRIMARY KEY (instance_id, aggregate_id, idp_config_id);


--
-- Name: idp_providers idp_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.idp_providers
    ADD CONSTRAINT idp_providers_pkey PRIMARY KEY (aggregate_id, idp_config_id, instance_id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);


--
-- Name: org_project_mapping2 org_project_mapping2_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.org_project_mapping2
    ADD CONSTRAINT org_project_mapping2_pkey PRIMARY KEY (instance_id, org_id, project_id);


--
-- Name: org_project_mapping org_project_mapping_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.org_project_mapping
    ADD CONSTRAINT org_project_mapping_pkey PRIMARY KEY (org_id, project_id, instance_id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id, instance_id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id, instance_id);


--
-- Name: user_external_idps2 user_external_idps2_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.user_external_idps2
    ADD CONSTRAINT user_external_idps2_pkey PRIMARY KEY (instance_id, external_user_id, idp_config_id);


--
-- Name: user_external_idps user_external_idps_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.user_external_idps
    ADD CONSTRAINT user_external_idps_pkey PRIMARY KEY (external_user_id, idp_config_id, instance_id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (user_agent_id, user_id, instance_id);


--
-- Name: users2 users2_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users2
    ADD CONSTRAINT users2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users3 users3_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users3
    ADD CONSTRAINT users3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, instance_id);


--
-- Name: events2 events2_pkey; Type: CONSTRAINT; Schema: eventstore; Owner: postgres
--

ALTER TABLE ONLY eventstore.events2
    ADD CONSTRAINT events2_pkey PRIMARY KEY (instance_id, aggregate_type, aggregate_id, sequence);


--
-- Name: unique_constraints unique_constraints_pkey; Type: CONSTRAINT; Schema: eventstore; Owner: postgres
--

ALTER TABLE ONLY eventstore.unique_constraints
    ADD CONSTRAINT unique_constraints_pkey PRIMARY KEY (instance_id, unique_type, unique_field);


--
-- Name: actions3 actions3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.actions3
    ADD CONSTRAINT actions3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: apps7_api_configs apps7_api_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_api_configs
    ADD CONSTRAINT apps7_api_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: apps7_oidc_configs apps7_oidc_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_oidc_configs
    ADD CONSTRAINT apps7_oidc_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: apps7 apps7_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7
    ADD CONSTRAINT apps7_pkey PRIMARY KEY (instance_id, id);


--
-- Name: apps7_saml_configs apps7_saml_configs_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_saml_configs
    ADD CONSTRAINT apps7_saml_configs_pkey PRIMARY KEY (instance_id, app_id);


--
-- Name: auth_requests auth_requests_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (instance_id, id);


--
-- Name: authn_keys2 authn_keys2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.authn_keys2
    ADD CONSTRAINT authn_keys2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: current_sequences current_sequences_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (projection_name, aggregate_type, instance_id);


--
-- Name: current_states current_states_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.current_states
    ADD CONSTRAINT current_states_pkey PRIMARY KEY (projection_name, instance_id);


--
-- Name: custom_texts2 custom_texts2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.custom_texts2
    ADD CONSTRAINT custom_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, template, key, language);


--
-- Name: device_auth_requests2 device_auth_requests2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.device_auth_requests2
    ADD CONSTRAINT device_auth_requests2_pkey PRIMARY KEY (instance_id, device_code);


--
-- Name: domain_policies2 domain_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.domain_policies2
    ADD CONSTRAINT domain_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: executions1 executions1_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.executions1
    ADD CONSTRAINT executions1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: executions1_targets executions1_targets_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.executions1_targets
    ADD CONSTRAINT executions1_targets_pkey PRIMARY KEY (instance_id, execution_id, "position");


--
-- Name: failed_events2 failed_events2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.failed_events2
    ADD CONSTRAINT failed_events2_pkey PRIMARY KEY (projection_name, instance_id, aggregate_type, aggregate_id, failed_sequence);


--
-- Name: failed_events failed_events_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (projection_name, failed_sequence, instance_id);


--
-- Name: flow_triggers3 flow_triggers3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.flow_triggers3
    ADD CONSTRAINT flow_triggers3_pkey PRIMARY KEY (instance_id, flow_type, trigger_type, resource_owner, action_id);


--
-- Name: idp_login_policy_links5 idp_login_policy_links5_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_login_policy_links5
    ADD CONSTRAINT idp_login_policy_links5_pkey PRIMARY KEY (instance_id, aggregate_id, idp_id);


--
-- Name: idp_templates6_apple idp_templates6_apple_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_apple
    ADD CONSTRAINT idp_templates6_apple_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_azure idp_templates6_azure_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_azure
    ADD CONSTRAINT idp_templates6_azure_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_github_enterprise idp_templates6_github_enterprise_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_github_enterprise
    ADD CONSTRAINT idp_templates6_github_enterprise_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_github idp_templates6_github_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_github
    ADD CONSTRAINT idp_templates6_github_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_gitlab idp_templates6_gitlab_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_gitlab
    ADD CONSTRAINT idp_templates6_gitlab_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_gitlab_self_hosted idp_templates6_gitlab_self_hosted_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_gitlab_self_hosted
    ADD CONSTRAINT idp_templates6_gitlab_self_hosted_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_google idp_templates6_google_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_google
    ADD CONSTRAINT idp_templates6_google_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_jwt idp_templates6_jwt_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_jwt
    ADD CONSTRAINT idp_templates6_jwt_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_ldap2 idp_templates6_ldap2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_ldap2
    ADD CONSTRAINT idp_templates6_ldap2_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_oauth2 idp_templates6_oauth2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_oauth2
    ADD CONSTRAINT idp_templates6_oauth2_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6_oidc idp_templates6_oidc_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_oidc
    ADD CONSTRAINT idp_templates6_oidc_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_templates6 idp_templates6_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6
    ADD CONSTRAINT idp_templates6_pkey PRIMARY KEY (instance_id, id);


--
-- Name: idp_templates6_saml idp_templates6_saml_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_saml
    ADD CONSTRAINT idp_templates6_saml_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idp_user_links3 idp_user_links3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_user_links3
    ADD CONSTRAINT idp_user_links3_pkey PRIMARY KEY (instance_id, idp_id, external_user_id);


--
-- Name: idps3_jwt_config idps3_jwt_config_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT idps3_jwt_config_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idps3_oidc_config idps3_oidc_config_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT idps3_oidc_config_pkey PRIMARY KEY (instance_id, idp_id);


--
-- Name: idps3 idps3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idps3
    ADD CONSTRAINT idps3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: instance_domains instance_domains_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.instance_domains
    ADD CONSTRAINT instance_domains_pkey PRIMARY KEY (instance_id, domain);


--
-- Name: instance_features2 instance_features2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.instance_features2
    ADD CONSTRAINT instance_features2_pkey PRIMARY KEY (instance_id, key);


--
-- Name: instance_members4 instance_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.instance_members4
    ADD CONSTRAINT instance_members4_pkey PRIMARY KEY (instance_id, id, user_id);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: keys4_certificate keys4_certificate_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT keys4_certificate_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4 keys4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4
    ADD CONSTRAINT keys4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4_private keys4_private_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT keys4_private_pkey PRIMARY KEY (instance_id, id);


--
-- Name: keys4_public keys4_public_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT keys4_public_pkey PRIMARY KEY (instance_id, id);


--
-- Name: label_policies3 label_policies3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.label_policies3
    ADD CONSTRAINT label_policies3_pkey PRIMARY KEY (instance_id, id, state);


--
-- Name: limits limits_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.limits
    ADD CONSTRAINT limits_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: lockout_policies3 lockout_policies3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.lockout_policies3
    ADD CONSTRAINT lockout_policies3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (projection_name, instance_id);


--
-- Name: login_names3_domains login_names3_domains_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.login_names3_domains
    ADD CONSTRAINT login_names3_domains_pkey PRIMARY KEY (instance_id, resource_owner, name);


--
-- Name: login_names3_policies login_names3_policies_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.login_names3_policies
    ADD CONSTRAINT login_names3_policies_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: login_names3_users login_names3_users_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.login_names3_users
    ADD CONSTRAINT login_names3_users_pkey PRIMARY KEY (instance_id, id);


--
-- Name: login_policies5 login_policies5_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.login_policies5
    ADD CONSTRAINT login_policies5_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: mail_templates2 mail_templates2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.mail_templates2
    ADD CONSTRAINT mail_templates2_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: message_texts2 message_texts2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.message_texts2
    ADD CONSTRAINT message_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, type, language);


--
-- Name: milestones milestones_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (instance_id, type);


--
-- Name: notification_policies notification_policies_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.notification_policies
    ADD CONSTRAINT notification_policies_pkey PRIMARY KEY (instance_id, id);


--
-- Name: notification_providers notification_providers_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.notification_providers
    ADD CONSTRAINT notification_providers_pkey PRIMARY KEY (instance_id, aggregate_id, provider_type);


--
-- Name: oidc_settings2 oidc_settings2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.oidc_settings2
    ADD CONSTRAINT oidc_settings2_pkey PRIMARY KEY (instance_id, aggregate_id);


--
-- Name: org_domains2 org_domains2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.org_domains2
    ADD CONSTRAINT org_domains2_pkey PRIMARY KEY (org_id, domain, instance_id);


--
-- Name: org_members4 org_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.org_members4
    ADD CONSTRAINT org_members4_pkey PRIMARY KEY (instance_id, org_id, user_id);


--
-- Name: org_metadata2 org_metadata2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.org_metadata2
    ADD CONSTRAINT org_metadata2_pkey PRIMARY KEY (instance_id, org_id, key);


--
-- Name: orgs1 orgs1_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.orgs1
    ADD CONSTRAINT orgs1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: password_age_policies2 password_age_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.password_age_policies2
    ADD CONSTRAINT password_age_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: password_complexity_policies2 password_complexity_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.password_complexity_policies2
    ADD CONSTRAINT password_complexity_policies2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: personal_access_tokens3 personal_access_tokens3_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.personal_access_tokens3
    ADD CONSTRAINT personal_access_tokens3_pkey PRIMARY KEY (instance_id, id);


--
-- Name: privacy_policies4 privacy_policies4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.privacy_policies4
    ADD CONSTRAINT privacy_policies4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: project_grant_members4 project_grant_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.project_grant_members4
    ADD CONSTRAINT project_grant_members4_pkey PRIMARY KEY (instance_id, project_id, grant_id, user_id);


--
-- Name: project_grants4 project_grants4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.project_grants4
    ADD CONSTRAINT project_grants4_pkey PRIMARY KEY (instance_id, grant_id);


--
-- Name: project_members4 project_members4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.project_members4
    ADD CONSTRAINT project_members4_pkey PRIMARY KEY (instance_id, project_id, user_id);


--
-- Name: project_roles4 project_roles4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.project_roles4
    ADD CONSTRAINT project_roles4_pkey PRIMARY KEY (instance_id, project_id, role_key);


--
-- Name: projects4 projects4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.projects4
    ADD CONSTRAINT projects4_pkey PRIMARY KEY (instance_id, id);


--
-- Name: quotas_notifications quotas_notifications_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.quotas_notifications
    ADD CONSTRAINT quotas_notifications_pkey PRIMARY KEY (instance_id, unit, id);


--
-- Name: quotas_periods quotas_periods_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.quotas_periods
    ADD CONSTRAINT quotas_periods_pkey PRIMARY KEY (instance_id, unit, start);


--
-- Name: quotas quotas_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.quotas
    ADD CONSTRAINT quotas_pkey PRIMARY KEY (instance_id, unit);


--
-- Name: restrictions2 restrictions2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.restrictions2
    ADD CONSTRAINT restrictions2_pkey PRIMARY KEY (instance_id, resource_owner);


--
-- Name: secret_generators2 secret_generators2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.secret_generators2
    ADD CONSTRAINT secret_generators2_pkey PRIMARY KEY (instance_id, generator_type, aggregate_id);


--
-- Name: security_policies2 security_policies2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.security_policies2
    ADD CONSTRAINT security_policies2_pkey PRIMARY KEY (instance_id);


--
-- Name: sessions8 sessions8_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.sessions8
    ADD CONSTRAINT sessions8_pkey PRIMARY KEY (instance_id, id);


--
-- Name: sms_configs2 sms_configs2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.sms_configs2
    ADD CONSTRAINT sms_configs2_pkey PRIMARY KEY (instance_id, id);


--
-- Name: sms_configs2_twilio sms_configs2_twilio_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.sms_configs2_twilio
    ADD CONSTRAINT sms_configs2_twilio_pkey PRIMARY KEY (instance_id, sms_id);


--
-- Name: smtp_configs2 smtp_configs2_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.smtp_configs2
    ADD CONSTRAINT smtp_configs2_pkey PRIMARY KEY (instance_id, resource_owner, id);


--
-- Name: system_features system_features_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.system_features
    ADD CONSTRAINT system_features_pkey PRIMARY KEY (key);


--
-- Name: targets1 targets1_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.targets1
    ADD CONSTRAINT targets1_pkey PRIMARY KEY (instance_id, id);


--
-- Name: user_auth_methods4 user_auth_methods4_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.user_auth_methods4
    ADD CONSTRAINT user_auth_methods4_pkey PRIMARY KEY (instance_id, user_id, method_type, token_id);


--
-- Name: user_grants5 user_grants5_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.user_grants5
    ADD CONSTRAINT user_grants5_pkey PRIMARY KEY (instance_id, id);


--
-- Name: user_metadata5 user_metadata5_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.user_metadata5
    ADD CONSTRAINT user_metadata5_pkey PRIMARY KEY (instance_id, user_id, key);


--
-- Name: user_schemas user_schemas_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.user_schemas
    ADD CONSTRAINT user_schemas_pkey PRIMARY KEY (instance_id, id);


--
-- Name: users13_humans users13_humans_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_humans
    ADD CONSTRAINT users13_humans_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users13_machines users13_machines_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_machines
    ADD CONSTRAINT users13_machines_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users13_notifications users13_notifications_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_notifications
    ADD CONSTRAINT users13_notifications_pkey PRIMARY KEY (instance_id, user_id);


--
-- Name: users13 users13_pkey; Type: CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13
    ADD CONSTRAINT users13_pkey PRIMARY KEY (instance_id, id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: system; Owner: postgres
--

ALTER TABLE ONLY system.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (instance_id, resource_owner, name);


--
-- Name: encryption_keys encryption_keys_pkey; Type: CONSTRAINT; Schema: system; Owner: postgres
--

ALTER TABLE ONLY system.encryption_keys
    ADD CONSTRAINT encryption_keys_pkey PRIMARY KEY (id);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: adminapi; Owner: postgres
--

CREATE INDEX current_sequences_instance_id_idx ON adminapi.current_sequences USING btree (instance_id);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: adminapi; Owner: postgres
--

CREATE INDEX failed_events_instance_id_idx ON adminapi.failed_events USING btree (instance_id);


--
-- Name: st2_owner_removed_idx; Type: INDEX; Schema: adminapi; Owner: postgres
--

CREATE INDEX st2_owner_removed_idx ON adminapi.styling2 USING btree (owner_removed);


--
-- Name: auth_code_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX auth_code_idx ON auth.auth_requests USING btree (code);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX current_sequences_instance_id_idx ON auth.current_sequences USING btree (instance_id);


--
-- Name: ext_idps2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX ext_idps2_owner_removed_idx ON auth.user_external_idps2 USING btree (owner_removed);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX failed_events_instance_id_idx ON auth.failed_events USING btree (instance_id);


--
-- Name: idp_conf2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX idp_conf2_owner_removed_idx ON auth.idp_configs2 USING btree (owner_removed);


--
-- Name: idp_prov2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX idp_prov2_owner_removed_idx ON auth.idp_providers2 USING btree (owner_removed);


--
-- Name: inst_app_tkn_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX inst_app_tkn_idx ON auth.tokens USING btree (instance_id, application_id);


--
-- Name: inst_refresh_tkn_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX inst_refresh_tkn_idx ON auth.tokens USING btree (instance_id, refresh_token_id);


--
-- Name: inst_ro_tkn_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX inst_ro_tkn_idx ON auth.tokens USING btree (instance_id, resource_owner);


--
-- Name: inst_usr_agnt_tkn_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX inst_usr_agnt_tkn_idx ON auth.tokens USING btree (instance_id, user_id, user_agent_id);


--
-- Name: org_proj_m2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX org_proj_m2_owner_removed_idx ON auth.org_project_mapping2 USING btree (owner_removed);


--
-- Name: u2_owner_removed_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX u2_owner_removed_idx ON auth.users2 USING btree (owner_removed);


--
-- Name: unique_client_user_index; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE UNIQUE INDEX unique_client_user_index ON auth.refresh_tokens USING btree (client_id, user_agent_id, user_id);


--
-- Name: user_sessions_by_user; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX user_sessions_by_user ON auth.user_sessions USING btree (instance_id, user_id);


--
-- Name: active_instances_events; Type: INDEX; Schema: eventstore; Owner: postgres
--

CREATE INDEX active_instances_events ON eventstore.events2 USING btree (aggregate_type, event_type) WHERE ((aggregate_type = 'instance'::text) AND (event_type = ANY (ARRAY['instance.added'::text, 'instance.removed'::text])));


--
-- Name: es_active_instances; Type: INDEX; Schema: eventstore; Owner: postgres
--

CREATE INDEX es_active_instances ON eventstore.events2 USING btree (created_at DESC, instance_id);


--
-- Name: es_projection; Type: INDEX; Schema: eventstore; Owner: postgres
--

CREATE INDEX es_projection ON eventstore.events2 USING btree (instance_id, aggregate_type, event_type, "position");


--
-- Name: es_wm; Type: INDEX; Schema: eventstore; Owner: postgres
--

CREATE INDEX es_wm ON eventstore.events2 USING btree (aggregate_id, instance_id, aggregate_type, event_type);


--
-- Name: events2_current_sequence; Type: INDEX; Schema: eventstore; Owner: postgres
--

CREATE INDEX events2_current_sequence ON eventstore.events2 USING btree (sequence DESC, aggregate_id, aggregate_type, instance_id);


--
-- Name: log_date_desc; Type: INDEX; Schema: logstore; Owner: postgres
--

CREATE INDEX log_date_desc ON logstore.execution USING btree (instance_id, log_date DESC) INCLUDE (took);


--
-- Name: protocol_date_desc; Type: INDEX; Schema: logstore; Owner: postgres
--

CREATE INDEX protocol_date_desc ON logstore.access USING btree (instance_id, protocol, log_date DESC) INCLUDE (request_url, response_status, request_headers);


--
-- Name: actions3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX actions3_owner_removed_idx ON projections.actions3 USING btree (owner_removed);


--
-- Name: actions3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX actions3_resource_owner_idx ON projections.actions3 USING btree (resource_owner);


--
-- Name: apps7_api_configs_client_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX apps7_api_configs_client_id_idx ON projections.apps7_api_configs USING btree (client_id);


--
-- Name: apps7_oidc_configs_client_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX apps7_oidc_configs_client_id_idx ON projections.apps7_oidc_configs USING btree (client_id);


--
-- Name: apps7_project_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX apps7_project_id_idx ON projections.apps7 USING btree (project_id);


--
-- Name: apps7_saml_configs_entity_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX apps7_saml_configs_entity_id_idx ON projections.apps7_saml_configs USING btree (entity_id);


--
-- Name: authn_keys2_enabled_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX authn_keys2_enabled_idx ON projections.authn_keys2 USING btree (enabled);


--
-- Name: authn_keys2_identifier_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX authn_keys2_identifier_idx ON projections.authn_keys2 USING btree (identifier);


--
-- Name: cs_instance_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX cs_instance_id_idx ON projections.current_states USING btree (instance_id);


--
-- Name: current_sequences_instance_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX current_sequences_instance_id_idx ON projections.current_sequences USING btree (instance_id);


--
-- Name: custom_texts2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX custom_texts2_owner_removed_idx ON projections.custom_texts2 USING btree (owner_removed);


--
-- Name: device_auth_requests2_user_code_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX device_auth_requests2_user_code_idx ON projections.device_auth_requests2 USING btree (instance_id, user_code);


--
-- Name: domain_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX domain_policies2_owner_removed_idx ON projections.domain_policies2 USING btree (owner_removed);


--
-- Name: executions1_targets_execution_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX executions1_targets_execution_idx ON projections.executions1_targets USING btree (instance_id, execution_id);


--
-- Name: failed_events_instance_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX failed_events_instance_id_idx ON projections.failed_events USING btree (instance_id);


--
-- Name: fe2_instance_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX fe2_instance_id_idx ON projections.failed_events2 USING btree (instance_id);


--
-- Name: idp_login_policy_links5_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_login_policy_links5_owner_removed_idx ON projections.idp_login_policy_links5 USING btree (owner_removed);


--
-- Name: idp_login_policy_links5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_login_policy_links5_resource_owner_idx ON projections.idp_login_policy_links5 USING btree (resource_owner);


--
-- Name: idp_templates6_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_templates6_owner_removed_idx ON projections.idp_templates6 USING btree (owner_removed);


--
-- Name: idp_templates6_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_templates6_resource_owner_idx ON projections.idp_templates6 USING btree (resource_owner);


--
-- Name: idp_user_links3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_user_links3_owner_removed_idx ON projections.idp_user_links3 USING btree (owner_removed);


--
-- Name: idp_user_links3_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idp_user_links3_user_id_idx ON projections.idp_user_links3 USING btree (user_id);


--
-- Name: idps3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idps3_owner_removed_idx ON projections.idps3 USING btree (owner_removed);


--
-- Name: idps3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX idps3_resource_owner_idx ON projections.idps3 USING btree (resource_owner);


--
-- Name: instance_domains_instance_domain_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX instance_domains_instance_domain_idx ON projections.instance_domains USING btree (domain) INCLUDE (creation_date, change_date, sequence, is_generated, is_primary);


--
-- Name: instance_members4_im_instance_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX instance_members4_im_instance_idx ON projections.instance_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: instance_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX instance_members4_user_id_idx ON projections.instance_members4 USING btree (user_id);


--
-- Name: label_policies3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX label_policies3_owner_removed_idx ON projections.label_policies3 USING btree (owner_removed);


--
-- Name: login_names3_domain_search; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_domain_search ON projections.login_names3_domains USING btree (instance_id, resource_owner, name_lower);


--
-- Name: login_names3_domain_search_result; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_domain_search_result ON projections.login_names3_domains USING btree (instance_id, resource_owner) INCLUDE (is_primary);


--
-- Name: login_names3_policies_is_default_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_policies_is_default_idx ON projections.login_names3_policies USING btree (resource_owner, is_default);


--
-- Name: login_names3_users_instance_user_name_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_users_instance_user_name_idx ON projections.login_names3_users USING btree (instance_id, user_name) INCLUDE (resource_owner);


--
-- Name: login_names3_users_lnu_instance_ro_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_users_lnu_instance_ro_id_idx ON projections.login_names3_users USING btree (instance_id, resource_owner, id) INCLUDE (user_name);


--
-- Name: login_names3_users_search; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_names3_users_search ON projections.login_names3_users USING btree (instance_id, user_name_lower) INCLUDE (resource_owner);


--
-- Name: login_policies5_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX login_policies5_owner_removed_idx ON projections.login_policies5 USING btree (owner_removed);


--
-- Name: mail_templates2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX mail_templates2_owner_removed_idx ON projections.mail_templates2 USING btree (owner_removed);


--
-- Name: message_texts2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX message_texts2_owner_removed_idx ON projections.message_texts2 USING btree (owner_removed);


--
-- Name: org_domains2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX org_domains2_owner_removed_idx ON projections.org_domains2 USING btree (owner_removed);


--
-- Name: org_members4_om_instance_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX org_members4_om_instance_idx ON projections.org_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: org_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX org_members4_user_id_idx ON projections.org_members4 USING btree (user_id);


--
-- Name: org_metadata2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX org_metadata2_owner_removed_idx ON projections.org_metadata2 USING btree (owner_removed);


--
-- Name: orgs1_domain_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX orgs1_domain_idx ON projections.orgs1 USING btree (primary_domain);


--
-- Name: orgs1_name_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX orgs1_name_idx ON projections.orgs1 USING btree (name);


--
-- Name: password_age_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX password_age_policies2_owner_removed_idx ON projections.password_age_policies2 USING btree (owner_removed);


--
-- Name: password_complexity_policies2_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX password_complexity_policies2_owner_removed_idx ON projections.password_complexity_policies2 USING btree (owner_removed);


--
-- Name: personal_access_tokens3_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX personal_access_tokens3_owner_removed_idx ON projections.personal_access_tokens3 USING btree (owner_removed);


--
-- Name: personal_access_tokens3_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX personal_access_tokens3_resource_owner_idx ON projections.personal_access_tokens3 USING btree (resource_owner);


--
-- Name: personal_access_tokens3_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX personal_access_tokens3_user_id_idx ON projections.personal_access_tokens3 USING btree (user_id);


--
-- Name: privacy_policies4_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX privacy_policies4_owner_removed_idx ON projections.privacy_policies4 USING btree (owner_removed);


--
-- Name: project_grant_members4_pgm_instance_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_grant_members4_pgm_instance_idx ON projections.project_grant_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: project_grant_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_grant_members4_user_id_idx ON projections.project_grant_members4 USING btree (user_id);


--
-- Name: project_grants4_granted_org_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_grants4_granted_org_idx ON projections.project_grants4 USING btree (granted_org_id);


--
-- Name: project_grants4_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_grants4_resource_owner_idx ON projections.project_grants4 USING btree (resource_owner);


--
-- Name: project_members4_pm_instance_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_members4_pm_instance_idx ON projections.project_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);


--
-- Name: project_members4_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX project_members4_user_id_idx ON projections.project_members4 USING btree (user_id);


--
-- Name: projects4_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX projects4_resource_owner_idx ON projections.projects4 USING btree (resource_owner);


--
-- Name: sessions8_user_agent_fingerprint_id_idx_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX sessions8_user_agent_fingerprint_id_idx_idx ON projections.sessions8 USING btree (user_agent_fingerprint_id);


--
-- Name: user_auth_methods4_owner_removed_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX user_auth_methods4_owner_removed_idx ON projections.user_auth_methods4 USING btree (owner_removed);


--
-- Name: user_auth_methods4_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX user_auth_methods4_resource_owner_idx ON projections.user_auth_methods4 USING btree (resource_owner);


--
-- Name: user_grants5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX user_grants5_resource_owner_idx ON projections.user_grants5 USING btree (resource_owner);


--
-- Name: user_grants5_user_id_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX user_grants5_user_id_idx ON projections.user_grants5 USING btree (user_id);


--
-- Name: user_metadata5_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX user_metadata5_resource_owner_idx ON projections.user_metadata5 USING btree (resource_owner);


--
-- Name: users13_notifications_email_search; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX users13_notifications_email_search ON projections.users13_notifications USING btree (instance_id, verified_email_lower);


--
-- Name: users13_resource_owner_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX users13_resource_owner_idx ON projections.users13 USING btree (resource_owner);


--
-- Name: users13_username_idx; Type: INDEX; Schema: projections; Owner: postgres
--

CREATE INDEX users13_username_idx ON projections.users13 USING btree (username);


--
-- Name: apps7_api_configs fk_api_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_api_configs
    ADD CONSTRAINT fk_api_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_apple fk_apple_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_apple
    ADD CONSTRAINT fk_apple_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_azure fk_azure_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_azure
    ADD CONSTRAINT fk_azure_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_certificate fk_certificate_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT fk_certificate_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: executions1_targets fk_executions1_targets_execution; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.executions1_targets
    ADD CONSTRAINT fk_executions1_targets_execution FOREIGN KEY (instance_id, execution_id) REFERENCES projections.executions1(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_github_enterprise fk_github_enterprise_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_github_enterprise
    ADD CONSTRAINT fk_github_enterprise_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_github fk_github_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_github
    ADD CONSTRAINT fk_github_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_gitlab fk_gitlab_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_gitlab
    ADD CONSTRAINT fk_gitlab_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_gitlab_self_hosted fk_gitlab_self_hosted_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_gitlab_self_hosted
    ADD CONSTRAINT fk_gitlab_self_hosted_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_google fk_google_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_google
    ADD CONSTRAINT fk_google_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: users13_humans fk_humans_ref_users13; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_humans
    ADD CONSTRAINT fk_humans_ref_users13 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users13(instance_id, id) ON DELETE CASCADE;


--
-- Name: idps3_jwt_config fk_jwt_config_ref_idps3; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT fk_jwt_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_jwt fk_jwt_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_jwt
    ADD CONSTRAINT fk_jwt_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_ldap2 fk_ldap2_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_ldap2
    ADD CONSTRAINT fk_ldap2_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: users13_machines fk_machines_ref_users13; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_machines
    ADD CONSTRAINT fk_machines_ref_users13 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users13(instance_id, id) ON DELETE CASCADE;


--
-- Name: users13_notifications fk_notifications_ref_users13; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.users13_notifications
    ADD CONSTRAINT fk_notifications_ref_users13 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users13(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_oauth2 fk_oauth2_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_oauth2
    ADD CONSTRAINT fk_oauth2_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: idps3_oidc_config fk_oidc_config_ref_idps3; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT fk_oidc_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;


--
-- Name: apps7_oidc_configs fk_oidc_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_oidc_configs
    ADD CONSTRAINT fk_oidc_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_oidc fk_oidc_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_oidc
    ADD CONSTRAINT fk_oidc_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_private fk_private_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT fk_private_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: keys4_public fk_public_ref_keys4; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT fk_public_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;


--
-- Name: apps7_saml_configs fk_saml_configs_ref_apps7; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.apps7_saml_configs
    ADD CONSTRAINT fk_saml_configs_ref_apps7 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps7(instance_id, id) ON DELETE CASCADE;


--
-- Name: idp_templates6_saml fk_saml_ref_idp_templates6; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.idp_templates6_saml
    ADD CONSTRAINT fk_saml_ref_idp_templates6 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates6(instance_id, id) ON DELETE CASCADE;


--
-- Name: sms_configs2_twilio fk_twilio_ref_sms_configs2; Type: FK CONSTRAINT; Schema: projections; Owner: postgres
--

ALTER TABLE ONLY projections.sms_configs2_twilio
    ADD CONSTRAINT fk_twilio_ref_sms_configs2 FOREIGN KEY (instance_id, sms_id) REFERENCES projections.sms_configs2(instance_id, id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

