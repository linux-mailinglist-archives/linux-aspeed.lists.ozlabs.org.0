Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391CD9226
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 15:14:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tXnf4hdnzDq5n
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 00:14:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbZlVSMX"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tXmd0bz2zDqyX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2019 00:13:36 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id y72so14695914pfb.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3WMejLIjX/sN4h8RDr6kyJEZVhRO/kXeqFDRFF6Id8=;
 b=lbZlVSMXAaG45YMMWa8UqrZlE3mNsCasc5BFMYhZcETMQqmJCvgmOTLr7gfz8HrKHu
 eEdTYOcFOGto7xSuq4Ubox4D2RUcQXEtZbmkFSB/I/JDek6+CuHQ+WWMPQTHIs/Mk/mP
 qXFlhQxgDQQMvILeKOUlNYmP7iCbES0YFtXHKZGxxvUTQcFZypFfH5dHUzdQLJ/Qpv+d
 h3HtGKJHsCkcxMoKujCuTiPiTt1JRu3lR+jbO/Crwj7/pGNEX6sXJOJnk2P+T2/Xnan8
 5l9QrDaWaeEXuS7aPnU4jZq+Km9U5QgJJgLrtR+qcC4JIka0Vh6UmV871gOHIJrimT6I
 uJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C3WMejLIjX/sN4h8RDr6kyJEZVhRO/kXeqFDRFF6Id8=;
 b=BT06TYcZ3pklwJ70WcSJuq9FK7rKf6/AsrZgOcGTkoTY38DmGT5rFkTmBO9bvYeUKO
 7u07uDZFnmk+H4G6aQE9ZbtJC4rjcTS+rlt5JWDA3j3MKayc3kWKHDoH2H6zGo5qEYV/
 ryybXbEhTYAK8eiTawers2NRVNOR6Hk7C1FfilJ0V3+gMlrRZry7gtQ3kMjK9lckZg1x
 ppVuYr+w/LE3sX8D1fcHeirR+GEABA7FXYIC7Fv7opQJSba2F94vpaSRN++ib1z2aEpx
 rWyno735BjDL+vKy9w6ZE7eyCq0azPKcvtTq/C1Ya1szmFT49Hte6Gnn5Lui1BGNV8YX
 cOqw==
X-Gm-Message-State: APjAAAXf4fkyKVN0/PR+gFC1dk+3an/hT/RrZ31gQdnIaKE7sGsZlBmO
 Ly4//tn7mLw5HlSstaKF0Uc=
X-Google-Smtp-Source: APXvYqyqahV9zVwQW3dqjD79x3+FqITP01LbOa2/B5n0zWhcO1UPkVNuw7hURrivflb7cequRdvdPQ==
X-Received: by 2002:a17:90a:a781:: with SMTP id
 f1mr5116963pjq.29.1571231613537; 
 Wed, 16 Oct 2019 06:13:33 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id n3sm28433569pff.102.2019.10.16.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 06:13:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: ast2600: Fix enabling of clocks
Date: Wed, 16 Oct 2019 23:43:19 +1030
Message-Id: <20191016131319.31318-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The struct clk_ops enable callback for the aspeed gates mixes up the set
to clear and write to set registers.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-ast2600.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 1c1bb39bb04e..b1318e6b655b 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -266,10 +266,11 @@ static int aspeed_g6_clk_enable(struct clk_hw *hw)
 
 	/* Enable clock */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE) {
-		regmap_write(gate->map, get_clock_reg(gate), clk);
-	} else {
-		/* Use set to clear register */
+		/* Clock is clear to enable, so use set to clear register */
 		regmap_write(gate->map, get_clock_reg(gate) + 0x04, clk);
+	} else {
+		/* Clock is set to enable, so use write to set register */
+		regmap_write(gate->map, get_clock_reg(gate), clk);
 	}
 
 	if (gate->reset_idx >= 0) {
-- 
2.23.0

