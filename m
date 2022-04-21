Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C645095AA
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Apr 2022 06:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkP7f6PCBz3bVN
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Apr 2022 14:04:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dDXjEiQh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dDXjEiQh; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkP7W5njCz2xrs
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Apr 2022 14:04:37 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id x1so3846302pfj.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Apr 2022 21:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpfDonpRUmG38e9TnYZ913heAJIMSDn888Zn5gQcpGg=;
 b=dDXjEiQhDkUIA+u25W7rod+UdShPVr5Yk71YCFjRgk42t8ZDQAMbc4FxwT9Bpd6xwF
 GxYv2Yr0aPvc7HfTzlcCNtBn7bVAWINfi8fdat6iCpvgWjtuqt06OQIWuNOjbZIS2/rX
 d1QmyubJNsIeFkuPf3KuBqJeuBlguRFbB01h3KWgUDiVlq0a5KZ8N1OpyuhtFDGWuYi2
 ng5nh8Eh1Inu9tSUN9RfJGiR5NgHLSEg1nJHSqbK30IQ5DKENt/t3b5P5EzOUtk4cx25
 iz+jjX0Nfg1EibxMi8mO1xtQDBwW6c4B8Q17qRfE/mxuMCc35rOUKcHuq/ns6XGnByvX
 Opbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tpfDonpRUmG38e9TnYZ913heAJIMSDn888Zn5gQcpGg=;
 b=oSK/yT49oKkCyKEtW65Uo5SmU5peV4Yjn4Q4HZfGwDrDz7fm56Ck1xW3kagQWQ1lT6
 8Wc82Y+6ff5FPUnVDGHU1y5Y8ZDtVhQfK+SMDxJUXMLPysrd89FsM0hLJOGLL6P+IyL2
 Svkrlj/R2MF6FYQHuy+Ku2pM9igWVM9F5qm3lpVrmpt02sn6yt6fSmxAxKl2VhWIJuR7
 gtJjIMbbVXEC4bo+tkBMCl7WrqiYOCylyQUiKyeJOBO38F2yYftimsRtc2C1VEVMzTx/
 ACKNgtdPe0qRLNJM1TgDq/Mo6Xwb2Yc5GwP4NiBSMGnQuVNsIJcZmTZcYcJgEIVvY2wL
 pEWw==
X-Gm-Message-State: AOAM5305yqcomKE3zokECU2lyk4jN7sr68O2NUOSnrWEvvS7kXeKQI5K
 DbIy9Nxp589er1rypAIt9r4=
X-Google-Smtp-Source: ABdhPJx+hV59qQDmAFHtCXedOW4O+iea2nBUbk26jY4E2agRgCJlLBhb9wtgGyAYmqbyxlqYKKSkDQ==
X-Received: by 2002:a05:6a00:10c7:b0:4fd:9ee6:4130 with SMTP id
 d7-20020a056a0010c700b004fd9ee64130mr27392367pfu.84.1650513874912; 
 Wed, 20 Apr 2022 21:04:34 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14]) by smtp.gmail.com with ESMTPSA id
 p12-20020a634f4c000000b003a94e71ca01sm13184040pgl.46.2022.04.20.21.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 21:04:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 BMC-SW@aspeedtech.com
Subject: [PATCH] clk: ast2600: BCLK comes from EPLL
Date: Thu, 21 Apr 2022 13:34:26 +0930
Message-Id: <20220421040426.171256-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This correction was made in the u-boot SDK recently. There are no
in-tree users of this clock so the impact is minimal.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Link: https://github.com/AspeedTech-BMC/u-boot/commit/8ad54a5ae15f27fea5e894cc2539a20d90019717
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 24dab2312bc6..9c3305bcb27a 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -622,7 +622,7 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 	regmap_write(map, 0x308, 0x12000); /* 3x3 = 9 */
 
 	/* P-Bus (BCLK) clock divider */
-	hw = clk_hw_register_divider_table(dev, "bclk", "hpll", 0,
+	hw = clk_hw_register_divider_table(dev, "bclk", "epll", 0,
 			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 20, 3, 0,
 			ast2600_div_table,
 			&aspeed_g6_clk_lock);
-- 
2.35.1

