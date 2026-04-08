Return-Path: <linux-aspeed+bounces-3875-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLyECcnc1mlhJQgAu9opvQ
	(envelope-from <linux-aspeed+bounces-3875-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 00:55:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BF3C4947
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 00:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frdgV3CQNz2xlM;
	Thu, 09 Apr 2026 08:55:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775677304;
	cv=none; b=cWX8PG05962m4HuLjlMHO/mABPwwiVGPBfLHKjeRTXXfBH+HZcu4L78GXxJBbhgc5AvirhmIMazIaz6ykPf6uyPt1StepyGk/bERaVxRN0Ik8s+M+IOreO6JU2r8XY0MO0Cmrn4EmvKVfXV+QFCfGHz42YAdsE1hmLi7ilkKQapGS9pifVyEahxbsQym1703hpoalm4jgIBeya6A68Qra3rUJDaVQS/8hYiY2HKaW8JWxzZAbaa1kEIS8vVq6oJUY7lmxO/eqtvRBSSj9pGORYDQv+T8SePLS+FGgEshOQX51ZrWRbeL5s4tb34JePvAlPoJiyA496MeceARbPx3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775677304; c=relaxed/relaxed;
	bh=9wv0AWcHgu06bDFm+BUwIIlJ6phYQwKz8lXRSI36ll0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKHnAqIsXqPS+IX8Qyz9YY/b9vLhYyNcL91PTkMU0pFIMEtICjPsRYF7Y4RUycUGtXAkewLsm5xTZm8dEddmt5Z0muY/5tC+VWG2mcMz9fYk+Zu65yHmmXFmDFad6gFPeYZ+DLH4LJv8D/rOBrlYIw3BJCKHqtIRn4nhahem+SNABFCgxrOOrmOWqvSf43tdC91PJ0kusMKmPbaN+3HFvqsFWV7cB8eQWwzwlnk29JyeHERcCJfpOKaEhPaEzPrGjnmP2cXMbsBxhKzl0EKvwJWgASNs4pDeot3KrlisXhd0X7O0d36s87lxIIAFBZlsnwM11CagWNe7bNNeOaLOUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buGWf4dU; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buGWf4dU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frYNM6MvPz2yC9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Apr 2026 05:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677300; x=1807213300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m2f0MgviSe4n7FamZwL8P5PBCKEndEE+/KV0B5nZuDg=;
  b=buGWf4dU2dNb+Dy7I1zu1RFj9jGAvyYuA81lDHqYA9mrnQP5he0gaLNg
   J2Ar4dyKCjjaO8MFpVGqdm9v+ROKu67hLaDiP3bqAs2trCTqmhLbL+tcu
   GTDnXrWxrgL5pGKdN83esIRK927aGL6j6uA1FVTpcsmuE6d5rjEwK4o2U
   vYrYaIqGJj06TdkPlKxbi5dFtAn30r533ELu/+Uk36nfWBVrybzpzmNXg
   zFaK6fgRxWUobRhxouthf0Q3U6+UQtjjxSn6xhAKF7ewBgPcFGLx4NUUR
   fLjXBOcBkgNld7NAn1yXUMP5OmuCUlKI8H0djkN1hFbR0zugCsNpRHoOX
   g==;
X-CSE-ConnectionGUID: bwMU6PK9QfmLfNznj/AV0A==
X-CSE-MsgGUID: vGjyyGfaSp6n6wxxFMn4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056885"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:34 -0700
X-CSE-ConnectionGUID: XAD6QAc2SwKwIrhvqhfXHg==
X-CSE-MsgGUID: 8wH8aIgPT6WijufKP3yuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053320"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:30 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: [PATCH v3 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and bindings
Date: Wed,  8 Apr 2026 22:34:32 +0200
Message-ID: <cover.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[dawid.glazik@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Frank.Li@nxp.com,m:dawid.glazik@linux.intel.com,m:maciej.lawniczak@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3875-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawid.glazik@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 868BF3C4947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series reworks and resubmits AST2600 I3C DTS updates that were
originally posted in 2024, but stalled without further upstream
progress.[1] The series was rebased onto the current tree and merge
conflicts were resolved.

The patches first move i2c nodes under the APB simple-bus for layout
consistency, then add AST2600 I3C controller nodes in aspeed-g6.dtsi
and finally add the missing dt-binding for AST2600 I3C global
registers. Jeremy agreed in a separate email thread that I can continue
this series under my authorship.

Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  ARM: dts: aspeed-g6: Add nodes for i3c controllers
  dt-bindings: i3c: Add AST2600 I3C global registers

 .../i3c/aspeed,ast2600-i3c-global.yaml        |  55 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 549 ++++++++++--------
 2 files changed, 377 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


