Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161D6A78A3
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 01:59:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRt676b4Jz3cB4
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 11:59:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bULp4tHX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bULp4tHX;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRt5c4W2gz3c7K
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 11:58:44 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 20338202DE; Thu,  2 Mar 2023 08:58:44 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677718724;
	bh=rcWE5yATsN5CfBHBjwN3Th7/mIbe+8zUJTNmVPXeGSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bULp4tHX9LvWEoD+O0tDbtQG3s4oDme2J0Q/FAYByKN6kKE+O4di106eh3zw7xeXY
	 4rlZfJ8B/TlrNAdkJ3rvffN8C+9lHrnLQq92YBkxf/ikcmy25H4wk/yw+QnbPOyFIp
	 xqIoItmevyq2D36UtWBsrdbdhbxVFAfKud7CcWXTVgUKN76Y9gNOJCTMe73x92Ov1F
	 TmgByEfqaadAVsk6VKRis4K82MwT2W3M6opqFUirqoTCoEWZUkTV4vZmucnviqLIkt
	 lJ3El5uwroMfTEWlMYiju1C2LvBuLd8lCseHHS3qf5QJcHHAaSvxiWHJnmeH3/2DOu
	 vapF6dTn4SuGA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock + reset handling
Date: Thu,  2 Mar 2023 08:58:33 +0800
Message-Id: <20230302005834.13171-6-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a little description about how reset lines can be implicit with
clock enable/disable. This is mostly based on the commit message
from the original submission in 15ed8ce5f8.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/clk/clk-ast2600.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 09f26ab5f9af..a094a2601a37 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -73,6 +73,27 @@ static void __iomem *scu_g6_base;
 static u8 soc_rev;
 
 /*
+ * The majority of the clocks in the system are gates paired with a reset
+ * controller that holds the IP in reset; this is represented by the @reset_idx
+ * member of entries here.
+ *
+ * This borrows from clk_hw_register_gate, but registers two 'gates', one
+ * to control the clock enable register and the other to control the reset
+ * IP. This allows us to enforce the ordering:
+ *
+ * 1. Place IP in reset
+ * 2. Enable clock
+ * 3. Delay
+ * 4. Release reset
+ *
+ * Consequently, if reset_idx is set, reset control is implicit: the clock
+ * consumer does not need its own reset handling, as enabling the clock will
+ * also deassert reset.
+ *
+ * There are some gates that do not have an associated reset; these are
+ * handled by using -1 as the index for the reset, and the consumer must
+ * explictly assert/deassert reset lines as required.
+ *
  * Clocks marked with CLK_IS_CRITICAL:
  *
  *  ref0 and ref1 are essential for the SoC to operate
-- 
2.39.1

