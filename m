Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8D6946E2
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:25:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlSW618jz3bh7
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JzmUhCiZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JzmUhCiZ;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlS66M5Fz2yNm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:24:38 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 55953202E2; Mon, 13 Feb 2023 21:24:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676294678;
	bh=g+nn19uiKqv62SinRddEJdqDBAu/bfZiWyBp1ABFHYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JzmUhCiZsCq+qp1d0kdeLYHU8qL155J57C1RDlQF1BhLbL+nk0GHGHCRwuJv2CnQ5
	 t2/v6PLZvx1laqHGIy3zLKECI3Eliatd+QV5tesSkLNDpEyjI6g2cDHGHyH0XcuefD
	 kd8GtHwITdPLLl7rlW6Jqdw03hnDw4hTW6XIrKs2uTC88b084u9ezorGMOoeqIxPnz
	 dQNykDTFAVIVSFrOCHE0N53q2fjzXDY5yUB4JOPzrp7FL4enFfoZR7Eh6DXle1mUnz
	 XgYtUWPkzU/33MKws/CzP+INIIcE6m2AFsTK9G7VkVXik8dtWn3h267ZZYQrCFT2SK
	 PooVdfOTmqt0g==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
Date: Mon, 13 Feb 2023 21:24:20 +0800
Message-Id: <1b9bb33e75c0a84880035954d500a6e608668b99.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676294433.git.jk@codeconstruct.com.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The current ast2600 clock definitions include entries for i3c6 and i3c7
devices, which don't exist: there are no clock control lines documented
for these, and only i3c devices 0 through 5 are present.

So, remove the definitions for I3C6 and I3C7. Although this is a
potential ABI-breaking change, there are no in-tree users of these, and
any references would be broken anyway, as the hardware doesn't exist.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - split dt-bindings and clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 608ce576e63e..600549d7bee8 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -57,8 +57,6 @@
 #define ASPEED_CLK_GATE_I3C3CLK		40
 #define ASPEED_CLK_GATE_I3C4CLK		41
 #define ASPEED_CLK_GATE_I3C5CLK		42
-#define ASPEED_CLK_GATE_I3C6CLK		43
-#define ASPEED_CLK_GATE_I3C7CLK		44
 
 #define ASPEED_CLK_GATE_FSICLK		45
 
-- 
2.39.1

