Return-Path: <linux-aspeed+bounces-4009-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FnyK3drAmqosgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4009-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 May 2026 01:51:19 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF825177C9
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 May 2026 01:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gDxM73vDNz2xLr;
	Tue, 12 May 2026 09:51:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778492883;
	cv=none; b=H0tGp7Xyhor2MZeOWHGu9zBSv23QZTsZZal7328iWvBDLsfMiaayfXo8KS/sO36xDjgNik5anm/tHHdrUtp6V7KYk8Oisc5Zbror0bF0AbPbZ3JWiXejBQ95TI1xviMAq7jfCu6y7TR2Wi/jV+pK1u8nDb/xMl6UhbNRCg+KH6B2H77LFf1B1V01QYz33MUlE10lP9daNGU43R5UBu+XSOpcGPLVHXOYU/I3fx3KW70EWdppY1DLCboVx8h85KTZzaHF+WNlHboiLVAx02/1It55wkTVP86HNgNRA+N+B1YP31jOfU+dI3wn5dH5qZkLJifP0RPEJKQZq3muROwALg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778492883; c=relaxed/relaxed;
	bh=QkyufA/Hgj2GyxmUk6urE/8+rHteYNCx2KKX5Ay7wdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bxsRb3tg92XNn/GLDQHdQgrnTBwXikZrHnoBjTg2HjNt0nJmfnBANhSDe6IBFPd3AO6ew6/RBUfTe9z6kIFicZS0hxb/dCBoOB0pyTLeK74cMny68FEf8PNTGXoQPxWa3/lc6hf0KLWuX0zgmVJ/5Xa2/7yAlfYRX617E+g39gt7V9iyEPPWMLnLnNmZQ6ln9U9ej36s8f9QFtX1aWD/PvEVnD4/MrlxTh21WTVTvGEV56C8DyJcaD7ROtr1hRyrzZOqHIqXwFmSx3yxQVr0ReuCTfA6akNtBOQiERyUmqC36gqUJBJlZ3oSC2+RhlmQi15T2ICFnR57noQG9/Z03A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LoldjdEo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LoldjdEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gDZfB5NFrz2xl6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 May 2026 19:48:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AB34407AA;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B1AC2BCFA;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492880;
	bh=D4cEEwP+Pw2JC+uqCH7D0mOoSaD3yW1LgWxT8p0r9d4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LoldjdEomdcXhZsTCmbS+yxoyWhyPMpSy4xF0MTG/tlAsQfy1nRzFTP8rSvUFLwuU
	 OvMPu54qeLCV/1j1y//ApfxX2OCwmjBNNPnVjTdSNDF6rsg1lJtyVSSGer3/FxXPhn
	 CzQCBLuNTD2oGyON4oY25lXUxRkxkx7acyzbHKAKR4uAFm9zavvE1yBSlxtTlnZi/p
	 URsAs0TXuU0hn1//BfvC6QhkKlZsWZLfV9KHOb0Cuc3DYxLNB+SGOU3A4V8SkwFLH5
	 GOfsoTDjcKp3e6uCdwRQHLiD2zSG0pCxYewiox1/z5c6HDNxclWFY3dpa6yjQlAWpI
	 D9X0Z8V7b7jCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F08CCD3427;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 11 May 2026 17:47:56 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add JTAG CPLD TRST pin to SGPIO
 map
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
Message-Id: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMulAWoC/x3MTQqAIBBA4avIrBtQsR+6SrQwnWpamKhEEN09a
 fkt3nsgU2LKMIoHEl2c+QwVqhHgdhs2QvbVoKXuZKsUWu/xKHbDknLByAFbI5feD8aSdlC7mGj
 l+39O8/t+z6YwNmMAAAA=
X-Change-ID: 20260511-add-jtag-trst-pin-540b7d84ae2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492878; l=1269;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=bBz3YS2LvMQAba2/yKKCExHR35pJbolOWMc0cULsHQc=;
 b=7eqrmaxmn6l4gBcvbL2EZFv54EpM2ExzQR73yUeUFlCbjQgpzwSnkXTmVVMzLP6g6IACqMNDx
 USyAryJvHoVAj1X87q8+El6BZfM90iU21bwytKBspw7Ok3OtcRg0YIX
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
X-Rspamd-Queue-Id: 5AF825177C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4009-lists,linux-aspeed=lfdr.de,u8813345.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:u8813345@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,amd.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	HAS_REPLYTO(0.00)[u8813345@gmail.com]
X-Rspamd-Action: no action

From: Colin Huang <u8813345@gmail.com>

Add JTAG_CPLD_TRST_R_N to the sgpiom0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Add JTAG_CPLD_TRST_R_N to the SGPIO M0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..9a43e0c87257 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -882,7 +882,7 @@ &sgpiom0 {
 	/* C0-C7 line 32-47 */
 	"RSVD_RMC_GPIO3", "", "", "",
 	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
+	"LEAK_DETECT_RMC_N", "JTAG_CPLD_TRST_R_N", "", "",
 	"", "", "", "",
 
 	/* D0-D7 line 48-63 */

---
base-commit: b333a0f1c857411d83a02aa6f1d9ecc7666d6179
change-id: 20260511-add-jtag-trst-pin-540b7d84ae2c

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



