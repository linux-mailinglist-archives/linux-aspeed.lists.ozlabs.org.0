Return-Path: <linux-aspeed+bounces-4426-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AdXbBersTWrGAAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4426-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 08:23:38 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC389722290
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 08:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=cOd7wxjI;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4426-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4426-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gw7MV3JHzz2y7r;
	Wed, 08 Jul 2026 16:23:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783491313;
	cv=pass; b=GhHhR8VVVqxnRNLL8WdT/D3FJOTkiixl8ilrVryPArILuaZKmo6JfrrVWe8GLlh6t0Ta78Qm0PueoYqzSr1rWIzBa5bsiXdhlUdEjY8mjWgiloAi+IkbYYMSkoxX+u9Cgee8Xzzi9E9WWPLlsAMh7NvVMTCcAREjydQlmBzAkLWZrljuD0KUUI3LjcFWbhBJ+Afd8FKw9L9uphpclv29obc3zaouq7QS2Sk/POYBPxlOHzVian3sPEBUB4PfYR9endSjUI9h10xe6PBMZfLBNh2k9N+8Fwhn4oLGeiW2jvkDm5gOQsUai3+uBxW7VGCvqO+JZmnkYyolQSxu4IIHMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783491313; c=relaxed/relaxed;
	bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ml4XLSWEcKsExkXa6EJ8kZq16eYEuYd9WxIU6ZsrtJHU0vdvr30Ly2Aphuxzo5XYNvwrk+rbNb1O3QBoBABmeKpY9ZD+4E9QKKPaHLHW4cN+d33MwdULF4vkyISbPPcWlAC0FZ3yqWQ2uXAdddUVsGnXhuL7NO0KfuXWDKRzuMvfjes+wZkWGEGhAX5Osrg7fj/Sj5brla5zWex/ZzaOocGXVCffCud4p4UTBFyRaQ4I9sWAmq3dovtwTZ792pCM3mK2e6l8vSKObKtEVTv7p/l8aRKeB8AFVbSsZ9YYhyF5Pe91xT0L0YRUH5KWC2K8YR9356vX9N18+0HVDJg4/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cOd7wxjI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gw79r3508z2xKh;
	Wed, 08 Jul 2026 16:15:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuoNlP2lnSmN79zravD+PDF0pR9eysu+++JDXlK3+G2e7u5DEwwTAAIna4qEqS1PbcpJjwWhKs9P5wmAHUf9YodjbvSTXhVYRKtaEpNj0oesYICwh3786iPCvoheQUAZhql2K+WEssw9dn/7ylVmZGJ4bv9saUOYj76bTiXeFgOs5mQO9fPYFqYUCbaWrYODV/gYnP3COXj7b1a4geCpMjC8xsV00z8kirlz8/G3OAeqHUkrVuVUbhbasYaJOD2T8I52bmPHJ9Hg1qcPcQqO3cTXM6WNTxe4NUGpEaZ+H7oOynEW03wYwDVnvoPRfb84VybYJm4txiaaKFYhTX7mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=;
 b=H7olsI7Mu3NiUQPcKfzi2Eyx6nFnuaiPP14s56qzBc2kEUcsAIzFx1bdZDo9F1eqfkDne4gQ18tbQhHRSIwO/Lez5ADatHXoBioTQqijDH3ckzoHtVOSjOzQzD4BmxYYYazho+JNfOpnko7a6wA4lajqXAbZdvKLGVK1tBjjv122ptK4HkhvcqOCIhGQx7tZPj95DnpzH/HazIysYD4lWH7nWvVK/yDHieA433UiOiPWaaBjcxbGoBiVhuy6MVu1qxv00CXwFKurxs6ehy/zAcwgdjI08mPv86DQFyKtW0/MzvYI2mjGoWjFbZ3465/kyeLf7mfw9wBHgFf+pR612w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=;
 b=cOd7wxjIoJNSTK2pTjufGKF9aGYe4MCmz/Q8r/pS6LoAf652yoFl8d4JrLNG2MHMe3oJZa23zVCIpX9heJ8z2sC+H/Z9wtOfIpz3FlVhgrw+72s80mFUFED2UrtOu2yf1elLNPw1zQdcEXHYL/1GWIKIoye9MC57v0BozSGY+YGhWfxXk4yCKEOc36WhVxffCQTNoBTaSyV8WV/m6mX7GxaRf7nA6+7btEEIHLGU+fFFZSqdVMQ8b12aCMsx60wco0G0Atj0KTKmDYVXOm9XkCRINzKecGfv2q9elWHmRTaygrU0XrlnNy1piB4LIpi7G4gDR3bpja6UiPV50ilymw==
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 06:14:40 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::82) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 06:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 06:14:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 23:14:24 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 23:14:21 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Jacky Huang <jackyhuang@nvidia.com>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>, <robh@kernel.org>, <krzysztof.kozlowski@oss.qualcomm.com>,
	<conor+dt@kernel.org>, <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Date: Wed, 8 Jul 2026 15:13:43 +0900
Message-ID: <20260708061352.2885386-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101526.2556226-3-jackyhuang@nvidia.com>
References: <20260706101526.2556226-1-jackyhuang@nvidia.com> <20260706101526.2556226-3-jackyhuang@nvidia.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fecfa8-5edf-4bc9-c484-08dedcb831d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|30052699003|7416014|376014|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CtiOzK3IWcQlLQgENkx5Osi+eI0qD/DfNWQ74UEgFTcBWTr/FY4eJFQOy9iMNvTg7hCuAEQrV33whNGXfdbrxwHqzjfONDAHalBLmxI4BZercDBfpvO3v3ilJr1VKSMTcJ/KLRliCm1LrwUAdgYT5Gz2qqBD55nGLbdBuLAgSM9gMFdRlRRhNrproejaSizJF2vHHnu9UV/ElZQNs4bVwk+MgrM+tK+5r+PDs1vnVTy8Q6+6lGQPHNuUKitw6qqGbQxd7o6JhBc0o13KslI2EaqlrS4oZbNIWUlUHOZRjcDh8RniBRI/Vxw3R1lSsXMN7FsB2Zsz35C2zITGXeg2DACX5e81/k2UkAW29+RbgwNOjF+SNMdkTgxAyEkQzOpOQ0Xh0AhU/GODW9YVBmjSP1ni+lSf1KLzNoIH7RvHN/b9NA3ll9L7SB3Ocj1okz6kJ9sfROaDggrxHETotDmW3IbHDMziRz58IoNTJeUmE2GxixdIPDcIvGqCVrv92mcVbaK+Km/hr1dc8uuy4q3PSf4ek7R5xkm5Q21Z7xjKnlYp77sqam/iw06RjtfEX1kQNTbe+Mr4/W+jbiFrCRm0xYIsrlLL0R/n68wQZSMmN+OKFp6WzxarZfYECUt43hNe0zgImBVsiWeuoPqd8RV/EgwS+J9lrpV1HTSMZJWYTP2onCSlESqLWLDFxsr03zL4ZP/y1lhLZvAmG/OZryY9vg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(30052699003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xdZ4R90iNcYQu77M2arQMfjBukuw3DjblNZ3P/rlgXwBQiRYrRLCIBZkfUKdnhqVsRJAbfZx/mIvLQ3rE3UBcjY8hS3Li1raKTYg2NH9M/mvUDkCo5MlYZWYsx05bDQUINYSq/lKIVUt/jG23uwwyC/ZZDTmX/lE9/J4gK2sP/ADNFKEYG/5tBgf0hI/lkvUNjel4bYEdUJiH3hQZbN0hrJ60nP6MEaepkJbx2oNQGdWt0ZalM5lX2LkUMiDqih6YDbs00vk8grBE7ru8a/BwGGJxCYHUv9ubmBlkHg0XyuCIdySAeCLFkiWMWtJFGRrJY8iHz9Ja4O246W3mVdEns0JLiqGZ5tGgmF0dgjge6YGoUFKD/yw+M92NupB4XODmy3FYnkuxxObAanVFDVlBxgKosum99ChpD77a4TezhiU+IvAGJpGoTW+zn+GV71M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 06:14:39.9617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fecfa8-5edf-4bc9-c484-08dedcb831d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.21 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4426-lists,linux-aspeed=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:from_mime,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jackyhuang@nvidia.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC389722290

On Mon, Jul 06, 2026 at 10:24:00AM +0000, sashiko-bot wrote:
> [Severity: High]
> Does this incorrectly nest cp2112a inside an interface@1 node?
>
> The CP2112 is a single-interface USB Class 0 device. According to the USB
> device tree bindings and the kernel's usb_of_has_combined_node() logic,
> shouldn't this be defined as a standalone device node directly on device@1,
> similar to how cp2112c and cp2112g are defined?
>
> By nesting cp2112a inside interface@1 with reg = <1 1> (specifying interface
> 1 when the CP2112 only has interface 0), it seems the USB subsystem will
> fail to match the OF node to the device. Could this cause the
> gpio-controller and interrupt-controller properties to be ignored?

This was already addressed in the v1 thread. cp2112a and cp2112b are
NVIDIA composite devices that expose 3 USB interfaces, so
usb_of_has_combined_node() returns false and interface@1 is used.

> [Severity: High]
> Are the properties for cp2112b also incorrectly nested in an interface@1
> child node here?
>
> Similar to cp2112a above, defining this inside an interface node rather than
> directly on device@1 could prevent the USB core from attaching the OF nodes
> to the instantiated devices, silently breaking GPIO and interrupt control.

Same as above for cp2112b. No change is needed.

Jacky

