Return-Path: <linux-aspeed+bounces-4188-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdX2Oe1uImqwXAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4188-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 05 Jun 2026 08:38:37 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7277645932
	for <lists+linux-aspeed@lfdr.de>; Fri, 05 Jun 2026 08:38:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4188-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4188-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=aspeedtech.com (policy=quarantine);
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gWsG143qPz2yR5;
	Fri, 05 Jun 2026 16:38:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780641513;
	cv=none; b=FnpVIBh4qVEH/H7+BS9Wfz5kC04rXddSeUh+smX7DP+Ikz7Ue0KZK6d6BpeAu5eEDdNjwAI/LOKaRwdNkurtEndT31H5e3KOETk9CkTst7AdvK6ktNXYXRHgIokGSK/UHWLaLmkvN5oKHrESmO/WQse0/2FAvo2nV7CxdtgHg+B7yvguXaHtP3ATyq/Jpr9I4Kv/oa36ECYZinWRewgyDIzI35JE5YF+bf4nxPLyjqjP21HpPG51s0p1x1ufWKA+f7e5izUPTHYC33CdJOY1MRr1pVyguIpIwXjphAg5TqPgKjVkZXARQbNqFmQnJxsvgKMAZghDkx+SNJEjgVFihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780641513; c=relaxed/relaxed;
	bh=7yaa4X5hOY7Nyo41YzhNCOU/LM7bHHdZoOzTCzZHF3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=i/ieaE/cjnWkdfqX4HRtDLNAgemuanHPFkMpQp1JwoUTcRHLZRU9Njqp4EcEHDjJihGfSGyA9U/lvodMjhOzHRPephxB3H28AfpAWsgm3YvcL8yAt0opmCVfR/0RDZA4HrXHWNoIvT2+EwKKjx0329uUDgQAh80K9KYAPlSPHtebo43CvL3toRtOXEce73Zin3j4NIV66C7w7aK5lfQ5rcOrRw25l/TG/+eBBxv0rbEycd5fmV85xlb3WzzWCT0o05EDeLLuX24q7CDq2LLVZYWichWUNyKRbiu3V61IsP/O+YLvQswTm+CZ7JdS0C5/9cEE4FYPhr9FAs8C6ZN/cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWsG02JQNz2yNn;
	Fri, 05 Jun 2026 16:38:31 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 5 Jun
 2026 14:38:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 5 Jun 2026 14:38:14 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 5 Jun 2026 14:38:09 +0800
Subject: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
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
Message-ID: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIANBuImoC/x2MQQqAMAzAviI9W+hEO/Ar4kG0akGmbCLC2N8tH
 hNIMiSJKgn6KkOUR5OewcDVFcz7FDZBXYyhoYaJqcNLw3zHA1d90TO3rXhamRxYcUUx/d+GsZQ
 P58mYBl0AAAA=
X-Change-ID: 20260605-pinctrl-fix-76644e70f601
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780641494; l=1866;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=xAY5hWssBNCtFpjMIDeqYTF6QWlBQlC7/Ebm8kSZ1yc=;
 b=mxo5eczYf2oAK1TjLECaN853onZlWHApLvxA+tAckQEh7Sqd68Q2RI0IgpUItFJDSeZ/1tVPB
 d8SQ5ruU3AJD7i8VCiIgymYG9bjKmhGFfVmrQnZfiLchmDzw7IPzX0S
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_FROM(0.00)[bounces-4188-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7277645932

aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
function 0 to route the requested pin to GPIO. This is wrong for the
ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
selects the ADC input and function 1 selects GPIO. Requesting one of
those GPIOs therefore muxed the ball to ADC instead.

Write mux value 1 for balls W17 through AB19 so the GPIO function is
actually selected.

Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
index a1ef52ad5c75..50027d69c342 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -691,12 +691,21 @@ static int aspeed_g7_soc1_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_g7_soc1_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct aspeed_g7_field field;
+	unsigned int val = 0;
 	int ret = -ENOTSUPP;
 
 	if (pin <= AC24) {
+		/*
+		 * Balls W17 through AB19 are the ADC-capable pins: mux
+		 * function 0 selects the ADC input and function 1 selects
+		 * GPIO, unlike all other pins where function 0 is GPIO.
+		 */
+		if (pin >= W17 && pin <= AB19)
+			val = 1;
 		field = aspeed_g7_soc1_pinmux_field_from_pin(pin);
 		ret = regmap_update_bits(pctl->regmap, field.reg,
-					 field.mask << field.shift, 0);
+					 field.mask << field.shift,
+					 val << field.shift);
 	}
 
 	return ret;

---
base-commit: 57ae58c5506ade17df728d676a0c73c705f21f57
change-id: 20260605-pinctrl-fix-76644e70f601

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


