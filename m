Return-Path: <linux-aspeed+bounces-4161-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QH6hBRVrH2oslwAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4161-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 01:45:25 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E833632FA5
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 01:45:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=t5tEgZq4;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4161-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4161-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSBB1ZxJz2xpn;
	Wed, 03 Jun 2026 09:45:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780406709;
	cv=none; b=c7UZ+Slooca4YYVevZCJtWHuti82KlgwumxMjzdmjRpT9Er9m2BXWuUrOOc3shdXvuMYZ6OOrkZfyaKFT3kWA4314si1T++bMQmPMaNJJDdBLz8CZxKCeg1B5EfcpsBuD92k6yQRbMEzPy3ilWHB9ca0DHR+9nmQEBG9+I4CspCnc/UWWrYiEfwft/EnQIYYcCUSWJsRw2SX5OueA3pXh8XPL7q/LXnHRHMxeG5jOtQY/4DQhDDJRE675lB5Ka2U0dqaSrzTai2WF/n2dTfjZf3AViPTRuB6kXsa6A3gLbN+i47z47Tjd1+UPu1g+FnaOjau+RcIBRkninjfy0kXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780406709; c=relaxed/relaxed;
	bh=OOnvOQQxe0U2HaZQLe467i41E1CshFflkj8D/1ClMDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oemAYTGDtoj2/XO8q9wZg3IWxxeXZJFsRx5LXmAX088A7PiObqIT817FyeC4N/iwRmsXHMmV1jr9x232O8tvDri4v3BXHlENt1FLEgl9YZbzQYwYrfBv9rcM9SvZD7pV33eJ43TJsu3HHuhXjpt6YZQzya31gFvY4JJeFLEu+e64q9trHH7TaRQhjL+t42rxUX/VH3wS5uLlclkz9DW+9v6Vgl+wUXLqjtDUuzIcGsPa+Uc2K1PsURYlx4mxS2VIALYvGjjCxC8sQxVWBeuqDPO9Guyh7dy1lK4yblMGteIqTsKLVF+G1xofVs2PVZPTBIGPvzM1J92rzP00/2/x+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t5tEgZq4; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVBQW3Q2hz2xBb
	for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Jun 2026 23:25:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94A2C43FD6;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A963C2BCB4;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=nFbJfV8A9rkTWO5rSUCpM/WiuDOGMVCW5hVMnvc7Ax0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t5tEgZq4X1gosQV8d/ukdvT1TI1zfLnZB+ZqY2qSACyfR3SYRPCElc8fy7LIIT8/W
	 NKUvNkv2S5wx/ZWf889SK0joLtwPDqq/oQFLDI0VsQ8q7aWml89vPJmxlQ6qm8m9M4
	 IRnim1raOVidZDFD+oyq6qOynp+eJEyhygV4MTOaIL//aLbSLYr79++LUPdldAHFPN
	 waxYLeFgFQQ4kkDLKEsAYwDvQRjBgShleqMZA0gHHPuJSaq4mrW37oizGsNIJsmzQ3
	 PL2akodSbDiwl+P/+osf5ZATcCXwHtSR0/mJEF+RQ1V2vLvym14/fdcvuiveRyd1MS
	 XrqSJeW/Xt1sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61372CD6E57;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure devicetree
 for development-phase
Date: Tue, 02 Jun 2026 21:24:55 +0800
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKfZHmoC/43NvQ6CMBSG4Vshna3pDxZw8j6Mw7Ec4CRIm5Y0G
 sK9W5h00vH9hudbWMRAGNm5WFjARJHclEMfCmYHmHrk1OZmSigjSlFxmMCCB95iGp3nfoCIW5D
 FOSDyUgrZ6k5LZQXLig/Y0XN/uN5yDxRnF177YZLb+r+dJBe8qe6N0aayYPWlfwCNR+sebLOT+
 vSa357Knqk7rWpTSXP68tZ1fQNF2GVHHgEAAA==
X-Change-ID: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, 
 Andy Chung <Andy.Chung@amd.com>, Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=2654;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=nFbJfV8A9rkTWO5rSUCpM/WiuDOGMVCW5hVMnvc7Ax0=;
 b=9OYO2EkCb3s9v4KIZOB5CzKtPjN2qZy5OYCUH6Fz2p5VAS0oEFBRGKho+OiFsoj5tC9LPmRC9
 uuXDJTnkyjbAPzvxpLix2GwjKXE5mxRmXb2d5+1JJbL30aFl/2s93uf
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
	FREEMAIL_REPLYTO_END_DIGIT,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.29 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4161-lists,linux-aspeed=lfdr.de,u8813345.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:u8813345@gmail.com,m:carl.lee@amd.com,m:rex.fu.amd@gmail.com,m:Andy.Chung@amd.com,m:peter.shen@amd.com,m:krzk@kernel.org,m:conor@kernel.org,m:rexfuamd@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,amd.com,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[u8813345@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E833632FA5

This series refactors the Anacapa BMC devicetree layout to better support
development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a platform
entrypoint.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v3:
- Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, making it incremental rather than standalone.
- Add the DVT devicetree, inheriting from the EVT2 devicetree.
- Enable MCTP and FRU support for the NIC.
- Align PDB fan GPIO numbering.
- Add an EEPROM device node for the NFC adaptor board.
- Add an additional EEPROM device node for the SCM.
- Add shunt resistor values for HSC monitors
- Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com

Changes in v2:
- Fix dtbs_check fail.
  Validated by following command:
    make dt_binding_check DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
- Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com

---
Andy Chung (1):
      ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC

Carl Lee (1):
      ARM: dts: aspeed: anacapa: Add eeprom device node for NFC adaptor board

Colin Huang (5):
      dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 DVT board
      ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper to it
      ARM: dts: aspeed: anacapa: add EVT2 devicetree inheriting EVT1
      ARM: dts: aspeed: anacapa: add DVT devicetree inheriting EVT2
      ARM: dts: aspeed: anacapa: add additional EEPROM node for SCM

Peter Shen (1):
      ARM: dts: aspeed: anacapa: evt2: add shunt resistor values for HSC monitors

Rex Fu (1):
      ARM: dts: aspeed: anacapa: Align PDB fan GPIO numbering

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |  178 +++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1179 ++++++++++++++++++++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    |  228 ++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1077 +-----------------
 5 files changed, 1589 insertions(+), 1076 deletions(-)
---
base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



