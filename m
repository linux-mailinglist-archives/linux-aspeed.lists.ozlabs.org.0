Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07091C59
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 07:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BhzK0t5JzDqXT
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 15:18:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wa4gXkpp"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BhyZ3NwNzDqXV
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2019 15:17:58 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d85so469462pfd.2
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Aug 2019 22:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DyOkWXbip/sFDtzCMcgt9fKortz6cn0pIstBPgx8f+A=;
 b=Wa4gXkppzwM0+r04OH6+s7lLvWAhrUF/5j+fyU8uox4gov+ZJgzHhjmS2Crg475wh6
 68fYVRmc09jA4Dt4DUHcmv7z3UY5O0jDLHnoffxGIO6RMhray7o9zzx1tC4XSJmKckfV
 Hjj53K0p3SiK5nJUfmDDzsy7egJ4dIKXoRs+7XyUHgv4bXyygwYHd+uclWOlihp7j/3B
 wnxMbOPM/xDiv41AqwKcsgUcvD4hq+BbLf1dpSixl9G9UNA+A0kXpREoWFiFqgqA7KJ8
 GNCYMEn88qAvZMIXVBKT4CK/y8vH+tgaLYq77mLsLH4VULjISsY0i6qEQaHEJ3KA3Q5G
 MiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DyOkWXbip/sFDtzCMcgt9fKortz6cn0pIstBPgx8f+A=;
 b=BcOJnMQVgb5IZKzk1KmmtTglCMepDWsIHSkEN/Z8oG4qsi8KtVVG17ObI0A67S8FDD
 p2bVHsKsQXlbBv04zLWdu0CM7mKoql0e9OF5+D9UG1TfxtESc+/nml59Z2carzZEYvYm
 x+nFeu+LbEbjcF9HpS1xd+NVhdecdgmQeKrlZb7uHLvbOXzOTGmfBdcltD2KEYuEyAby
 Uy2IgWvDu6Rv0mVnJ/bZ0weC+QpkDN1INVaupFqVSX0Sj+/QIUbeupB8aBi4qVxf5VEQ
 IiRHWsLTK3c7wqkqW/xbFh/poOcfhgnVrKSX8iLOSCiqFviyxGrLNh6oPLVfJZWhoaPM
 S7NA==
X-Gm-Message-State: APjAAAV3lbFfJTt5VOOQt/vmiDy4t1sHAU243S6Mkm/VX972AhMVnyxP
 pSBEpRw/GnGkV1AZrhxCHus=
X-Google-Smtp-Source: APXvYqxmKIFDHCNwPUL7Pa2AYZQ57N6+X/NXdnMruTHlp+98Fjja2C1q0M4BwqahIM1AvA03PmrVSw==
X-Received: by 2002:a65:528d:: with SMTP id y13mr18906968pgp.120.1566191876456; 
 Sun, 18 Aug 2019 22:17:56 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 22:17:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] watchdog: aspeed: Add support for AST2600
Date: Mon, 19 Aug 2019 14:47:38 +0930
Message-Id: <20190819051738.17370-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819051738.17370-1-joel@jms.id.au>
References: <20190819051738.17370-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ryan Chen <ryan_chen@aspeedtech.com>

The ast2600 can be supported by the same code as the ast2500.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Reuse ast2500 config structure
---
 drivers/watchdog/aspeed_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..5b64bc2e8788 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -34,6 +34,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -259,7 +260,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
+		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-- 
2.23.0.rc1

