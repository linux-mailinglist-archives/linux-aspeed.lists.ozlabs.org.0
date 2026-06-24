Return-Path: <linux-aspeed+bounces-4292-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qS+5CvduO2pEXwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4292-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 07:45:27 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4A6BB919
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 07:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=aspeedtech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4292-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4292-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glW9r66wpz2yY1;
	Wed, 24 Jun 2026 15:45:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782279920;
	cv=none; b=KfebM6km9UX04LVC5hoYxMhPXDNvY6nopEi2/MSdSqB9TCtP6nOJoamft4FGFUqkFHzCjyeJTxmkroBsmWaiBRwpMsewIrsp/iwK0wam4hTIZ8XCSkg+HZrLXHE3tG6Mu5rSMEMx0Cooi54L7E8cEYH0yqqYd3u2FZ9MeFalAw4p4SU2OH8VxYkqwGMwwVRiMcgcfQfyGJofunV3+UxSvLhLiC1KzLdM0f/4/CnqQKVu41OUZxLq0WRpqvpBgR/1ZVNjfl/wMuvtX7t785bagD0x/AXMxsnRp4L5JOb6xG9VxwRSHepyi/VPn4n+wg7XZ/FXvxDvd5QjwLkCDhbBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782279920; c=relaxed/relaxed;
	bh=LWLN71yt+YA8OvfTtpMEtJlNMfJ+e3+F4iSar+rq42A=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oDHM6brqnWSl9mfEC4U0MvosVZ6p27hX27LPoCpF+nQHtqMissMcqHK/ksW8G3yjQMNi7WQ7U6vMlVRo8uf/BLCPxxUtJeKYKjJQAqkK8Uk5RWKiA3e9tUK8n9MxYM0WHY6hi+rvasxRNG98cfD41bcPJ2yhh3Qr/cZEXKZDPdhmACQkSv94soKmg1CCti1mO4xp1wNSGzw45PBaqOvouHpXX6kNp/FHlDjNXvBO0sV7/WXCrtefNBzm8eSGLupBwdii2k6qssGqJf8HXewTaacg5ATkNb/8tLwN0e4BpOLw6yqt8Nsbyez0pBCwMEsDT4wLkSXcOdU0tLiBWDFScg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glW9q285vz2yQn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 15:45:18 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Jun
 2026 13:45:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Jun 2026 13:45:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/2] Add AST2700 PECI clock support
Date: Wed, 24 Jun 2026 13:44:58 +0800
Message-ID: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpuO2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3YLU5Mz45Jxs3aREC/NUAxPj1FTTNCWg8oKi1LTMCrBR0bG1tQA
 Z34/3WgAAAA==
X-Change-ID: 20260623-peci_clk-ba87e043ee5f
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782279900; l=643;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=odlPR9ypkZoCmLp8rrpiizM7sQMlSS91UDSOPAX5z6s=;
 b=jY5mCWNYf6ZGdseK9bInNXNGm6THNQm8Tn8QAiGuCks3CWEWMwrwx1cJdXSY1RcdDG/yej/qA
 Mal65bRBbEbDSY5lT2tFoJrxdkdEfZlEpnIpebJLHZzYbt4Jcadf7a+
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4292-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:ryan_chen@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ryan_chen@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,aspeedtech.com:email,aspeedtech.com:mid,aspeedtech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26B4A6BB919

Add the PECI clock for the AST2700 SoC1. The PECI clock is a mux
controlled by SCU1_CLK_SEL2 bit 16, selecting between the 25MHz CLKIN
and HPLL/4.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (2):
      dt-bindings: clock: ast2700: add PECI clock
      clk: aspeed: add AST2700 PECI clock

 drivers/clk/aspeed/clk-ast2700.c               | 10 ++++++++++
 include/dt-bindings/clock/aspeed,ast2700-scu.h |  2 ++
 2 files changed, 12 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260623-peci_clk-ba87e043ee5f

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


