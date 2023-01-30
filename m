Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB72681DB6
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 23:09:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Mlv2ZHkz3cCD
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Jan 2023 09:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Baa8FKGH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Baa8FKGH;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Mll2djSz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Jan 2023 09:09:06 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so1141482pjb.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Jan 2023 14:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L5foAVcdo0wWC1jyJkjon2kzWr1+9ltHtWZQ2d1jOVw=;
        b=Baa8FKGHgsqHOOj68wxx0RxE8EryAs2yr6Lw4gyNRkO5D6k2qSD7r4KN7/8KNV+RTw
         xlCqwguOwuQpPYDDQsub2O+e+quW/YGL04cVEmRLb2ngdVfRuGn9txrxOzJhFIDikLHW
         TNtEKeklzLwGrn6SuOSOqWV2olym5L5dpat8WAnmEhVNvIcziY8OGEYXSvXdi7MKIsPz
         R1auOxUF0GwqTwXGeBtK7YZhX94eqZvnEk2Xr1HheWuJOIgc6kk0Hcr92NhBhAw/ZWsq
         PYUYNFojoLgP/334x9leUoI+0xTIvv6ng+iXFyhO/VkzhGX/n/sBPQlxRaO6YCWO+53M
         Z6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5foAVcdo0wWC1jyJkjon2kzWr1+9ltHtWZQ2d1jOVw=;
        b=rMAUIvQQTtKiCwSCbGmQddMcdLbtPz0Zgxt7mJLBqkNDs2n2kdiQyYxxdze/irahV4
         LOQWjiD+vQ7fJTYLYgIWvE2uu/Lv9QSmZFYA4qYGxuWfTWM12/aFuM8YDOZtF2TouUpA
         2OS0fn0twynszjXCcUN7eYBCbBaNAUYLvhWXRJvCvkHoIHiD9b7Qi1teAw2YBwQ0b5d7
         rWbmz7rNNkFMyVTDPIKT4Mk8ixX20OQ6sXdWHwXDwRlGDBB2eYm1BVN33l7c2LHIx55P
         rBX8Er9U5epfn8FHFl9v3l9qnYiCjPz5cP5rOgBC+nOSCRPIvYKSvvL3zuonVdHf+hL6
         0MQQ==
X-Gm-Message-State: AO0yUKVu6QDqNvbJJMaJI7UjPdv74vINYuqBNBsoKEnGixPDVhVlxoX1
	M4CTKWhJSIbR8sFZtMk/RtY=
X-Google-Smtp-Source: AK7set9vdlpVkOYcmq+zYZISjy8rtCo12U/jBU3OzjF1ZhMA9Aein/s5pHwUlEL/1R4BcnHLZBobIQ==
X-Received: by 2002:a17:902:da8e:b0:196:2da1:dca4 with SMTP id j14-20020a170902da8e00b001962da1dca4mr24378796plx.65.1675116542535;
        Mon, 30 Jan 2023 14:09:02 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902758500b0019686d286e2sm2285995pll.13.2023.01.30.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:09:01 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
Date: Tue, 31 Jan 2023 08:38:45 +1030
Message-Id: <20230130220845.917985-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This reverts commit cf517fef601b9dde151f0afc27164d13bf1fd907.

The commit cf517fef601b ("pinctrl: aspeed: Force to disable the
function's signal") exposed a problem with fetching the regmap for
reading the GFX register.

The Romulus machine the device tree contains a gpio hog for GPIO S7.
With the patch applied:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
  aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151

The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
of_clock code returns an error as it doesn't have a valid struct clk_hw
pointer. The regmap call happens because pinmux wants to check the GFX
node (IP block 1) to query bits there.

For reference, before the offending patch:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF1
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF2
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Enabling signal GPIOS7 for GPIOS7
  Muxed pin 151 as GPIOS7
  gpio-943 (seq_cont): hogged as output/low

We can't skip the clock check to allow pinmux to proceed, because the
write to disable VPOB9 will try to set a bit in the GFX register space
which will not stick when the IP is in reset. However, we do not want to
enable the IP just so pinmux can do a disable-enable dance for the pin.

For now, revert the offending patch while a correct solution is found.

Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
Link: https://github.com/openbmc/linux/issues/218
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index f93d6959cee9..5a12fc7cf91f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -92,10 +92,19 @@ static int aspeed_sig_expr_enable(struct aspeed_pinmux_data *ctx,
 static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 				   const struct aspeed_sig_expr *expr)
 {
+	int ret;
+
 	pr_debug("Disabling signal %s for %s\n", expr->signal,
 		 expr->function);
 
-	return aspeed_sig_expr_set(ctx, expr, false);
+	ret = aspeed_sig_expr_eval(ctx, expr, true);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		return aspeed_sig_expr_set(ctx, expr, false);
+
+	return 0;
 }
 
 /**
-- 
2.39.0

