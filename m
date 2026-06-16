Return-Path: <linux-aspeed+bounces-4262-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WicjLHDDMGqtXAUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4262-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jun 2026 05:30:56 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014A68BB25
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jun 2026 05:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=aspeedtech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4262-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4262-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfXYq4fZJz3bwX;
	Tue, 16 Jun 2026 13:30:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781580623;
	cv=none; b=eJuLCTwfsjoiCPk6A8qHu2sTF12NCPq2i6qTsOs8/MfBUk9AJMfCZzrK63ASyvFRw1Pht6Lv5PKv6FirEyt0i2G4mPlv5AM9yL6yIAc5JBtVFtSaR7pqBB7Bi8X269tKOYEtiV2hvZJfwm496LYPZ89sZw1gSzbBk27KldoGVHLs1UmuLkIX2gw9LbL9xSPYieeszNEIltlWMb2qVchB4/Pz9TSXFMy2xwk/5qvsF8Uj+IHCwrVAnrous+I6AhHZ/TKbLrpV928RLUa2TyxVdDgH+CfqW8/f6fBxE+9GuprX2z+OPF8G/DTFwSbZZ6Oa3hGJtUZOwvUri2h7z0Bz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781580623; c=relaxed/relaxed;
	bh=VMf9sNjHJw2BsEQrYgeWnW9Ukxa/ro2TiiasJQRS3SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D5TAWW88z9OKe/SgBAfz5ZxRDmpceB2jxX1ek2xaVvgfvcBaMYyeSMoxDFw70bHQY1aTZqQKwFA6cNqFcmJWBYHyPPVTwGu7k+eB7d7exAAZHdZig0Gq62Q0kSB2DjA7aJdQqJ8Hy4IpeQViyh5eaOoQ8GyBUGxmOQgAhnEwOCmn2YvsjAX6ywRkU7ydnXNXeZUkk3WHIlXnvSGnNipJtANw3VBAdZwsPyCz8GJsYqwAWBNGUwgaMnShaimXthQ76KWxtTeXR9Yu4R418uczV5vq7RGVDnrIwpqbITFfuiY1GgLcPvicD/li8z1ysNI41/SdQ8QqENAlHCU1qIXYmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfXYp6Qsgz3c18;
	Tue, 16 Jun 2026 13:30:22 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 16 Jun 2026 11:30:01 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: aspeed,ast2700-soc1: Add
 JTAGM1TRST group
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
Message-ID: <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580601; l=1070;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GQ3UQ5BFqq5w8PmNHkkbD3GB5wPV3CqM9yPcj5KE00g=;
 b=bHIkg0RFnCrvD4WKwjeopVECkuhuV/dk2dW8dRMWJM/DDZ9aLi/6fkU5tjS07KZJZyRxeo96e
 YPaQoo8uQWzCEr9WtIWN3OHGitlQEd35PnEnK3QyQrt8WPpA2/Dcq72
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,aspeedtech.com:email,aspeedtech.com:mid,aspeedtech.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4262-lists,linux-aspeed=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0014A68BB25

The TRST signal of the JTAG master is optional and may not be wired on
every design, but it is only selectable as part of the JTAGM1 group,
which forces the D12 ball to be muxed whenever the JTAG master is used.

Add a separate JTAGM1TRST group so boards can enable TRST independently
of the other JTAG master signals.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
index 76944fd14e2c..fe7cef4fef6a 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
@@ -356,6 +356,7 @@ patternProperties:
           - I3C8
           - I3C9
           - JTAGM1
+          - JTAGM1TRST
           - LPC0
           - LPC1
           - LTPI

-- 
2.34.1


